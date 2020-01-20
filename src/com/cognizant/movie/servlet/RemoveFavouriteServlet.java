package com.cognizant.movie.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cognizant.movie.dao.FavoriteDao;
import com.cognizant.movie.dao.FavoriteDaoCollectionImpl;
import com.cognizant.movie.dao.FavoriteEmptyException;
import com.cognizant.movie.model.Favorite;
import com.cognizant.movie.model.Movie;

@WebServlet("/RemoveFavourite")
public class RemoveFavouriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RemoveFavouriteServlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long userId = 1L;
            long movieId = Long.parseLong(request.getParameter("movieId"));
            FavoriteDao favoriteDao = new FavoriteDaoCollectionImpl();
            favoriteDao.removeFavoritesById(userId, movieId);
            Favorite favorite = favoriteDao.getAllFavorites(userId);
            List<Movie> movieList = favorite.getFavoriteList();
            int noOfFavorite = 0;
            noOfFavorite = movieList.size();
            favorite.setNoOfFavorite(noOfFavorite);
           
            request.setAttribute("movie", movieList);
            request.setAttribute("favorite", favorite);
            request.setAttribute("removeFavoriteItemStatus", true);
            request.getRequestDispatcher("favourites.jsp").forward(request, response);
        }

        catch (FavoriteEmptyException e) {
            request.getRequestDispatcher("favourites-empty.jsp").forward(request, response);
        }
    }

}
