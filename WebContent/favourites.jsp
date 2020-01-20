<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Favorites-Page</title>
<link rel="shortcut icon" href="images\logo.png">
<link rel="stylesheet" href="styles\style.css">
</head>
<body link="white">
    <div class="fixed-header">
        <div class="container">
            <div class="edit">
                Movie Cruiser&nbsp;&nbsp;&nbsp;<img src="images\logo.png" height=25 width=25>
            </div>
        </div>

        <div class="nav">
            <a href="ShowMovieListCustomer">Movies</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
                href="ShowFavourite">Favorites</a>

        </div>

    </div>


    <c:set var="favorite" value="${favorite}"></c:set>
    <h1>Favorite</h1>
    <c:if test="${removeFavoriteItemStatus==true }">
        <h4 style="color: #0b8038" id="remove-cart1" class="edit">Item Removed from favorite
            Successfully</h4>
    </c:if>
    <table id="table2">
        <col width="200px" />
        <col width="100px" />
        <col width="110px" />


        <tr>
            <th align="left">Name</th>
            <th align="right">Box Office</th>
            <th align="center">Genre</th>

        </tr>
        <c:forEach items="${movie}" var="movie">
            <tr>
                <td>${movie.getTitle()}</td>

                <td align="right"><f:formatNumber type="currency" currencySymbol="$"
                        minFractionDigits="2" value="${movie.getBoxOffice()}"></f:formatNumber></td>
                <td align="center">${movie.getGenre()}</td>

                <td align="right"><a href="RemoveFavourite?movieId=${movie.getMovieId()}">Delete</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
            <td align="left"><b>No of Favorites:</b></td>
            <td><b>${favorite.getNoOfFavorite()}</b></td>
        </tr>

    </table>

    <div class="fixed-footer">
        <div>Copyright&copy2019</div>
    </div>
</body>
</html>

