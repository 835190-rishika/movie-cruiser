package com.cognizant.movie.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.cognizant.movie.model.Movie;
import com.cognizant.movie.util.DateUtil;

public class MovieDaoCollectionImpl implements MovieDao {
    public static List<Movie> movieitemList;

    public MovieDaoCollectionImpl() {
        if (movieitemList == null || movieitemList.isEmpty()) {
            Movie item1 = new Movie(1, "Avatar", 2787965087L, true,
                    DateUtil.convertToDate("15/03/2017"), "Science Fiction", true);
            Movie item2 = new Movie(2, "The Avengers", 1518812988L, true,
                    DateUtil.convertToDate("23/12/2017"), "superhero", false);
            Movie item3 = new Movie(3, "Titanic", 2187463944L, true,
                    DateUtil.convertToDate("21/08/2018"), "Romance", false);
            Movie item4 = new Movie(4, "Jurassic World", 1671713208L, false,
                    DateUtil.convertToDate("02/07/2017"), "Science Fiction", true);
            Movie item5 = new Movie(5, "Avengers:End Game", 2750760348L, true,
                    DateUtil.convertToDate("02/11/2022"), "superhero", true);
            movieitemList = new ArrayList<Movie>();
            movieitemList.add(item1);
            movieitemList.add(item2);
            movieitemList.add(item3);
            movieitemList.add(item4);
            movieitemList.add(item5);
        }
    }

    @Override
    public List<Movie> getMovieListAdmin() {
        return movieitemList;
    }

    @Override
    public List<Movie> getMovieListCustomer() {
        ArrayList<Movie> movies = new ArrayList<Movie>();
        for (Movie movie : movieitemList) {
            if (((movie.getDateOfLaunch().before(new Date())
                    || movie.getDateOfLaunch().equals(new Date())) && movie.isActive() == true)) {
                movies.add(movie);
            }
        }
        return movies;
    }

    @Override
    public Movie getMovieById(long movieId) {
        for (Movie movie : movieitemList) {
            if (movie.getMovieId() == movieId) {
                return movie;
            }
        }
        return null;
    }

    @Override
    public void modifyMovieLists(Movie movie) {
        for (int i = 0; i < movieitemList.size(); i++) {
            if (movieitemList.get(i).getMovieId() == movie.getMovieId()) {
                movieitemList.set(i, movie);
            }
        }
    }
}
