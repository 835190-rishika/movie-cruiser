package com.cognizant.movie.dao;

import java.util.List;
import com.cognizant.movie.model.Movie;
import com.cognizant.movie.util.DateUtil;

public class MovieDaoCollectionImplTest {
    static MovieDao moviedao = new MovieDaoCollectionImpl();

    public static void main(String[] args) {
        testGetMovieListAdmin();
        getMovieListCustomer();
        testmodifyMovieLists();
        testGetMovieListAdmin();
        testGetMovieById();
    }

    public static void testGetMovieListAdmin() {
        System.out.println("Admin Page");
        List<Movie> movies = moviedao.getMovieListAdmin();
        System.out.printf("%-10s%-27s%-15s%-9s%-20s%-15s%s\n", "Id ", "Title", "Box Office",
                "Active", "Date of Launch", "Genre", "Has Teaser");
        for (Movie movie : movies) {
            System.out.println(movie);
        }
    }

    public static void getMovieListCustomer() {
        System.out.println("Customer Page");
        List<Movie> movies = moviedao.getMovieListCustomer();
        System.out.printf("%-10s%-27s%-15s%-9s%-20s%-15s%s\n", "Id ", "Title", "Box Office",
                "Active", "Date of Launch", "Genre", "Has Teaser");
        for (Movie movie2 : movies) {
            System.out.println(movie2);
        }
    }

    public static void testmodifyMovieLists() {
        System.out.println("Modify Movie");
        Movie movie = new Movie(1, "Conjuring", 2787985687L, true, DateUtil.convertToDate("02/01/2020"),
                "Horror", false);
        moviedao.modifyMovieLists(movie);
    }

    public static void testGetMovieById() {
        System.out.println("Get Movie");
        System.out.printf("%-10s%-27s%-15s%-9s%-20s%-15s%s\n", "Id ", "Title", "Box Office",
                "Active", "Date of Launch", "Genre", "Has Teaser");
        Movie movie = moviedao.getMovieById(3);
        System.out.println(movie);
    }

}
