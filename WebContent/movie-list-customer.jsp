<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movie-list-customer</title>
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
    <div>
        <h1 class="edit">Movies</h1>
    </div>
    <c:if test="${addFavoriteStatus==true }">
        <h4 style="color: #0b8038" id="remove-favorite" class="edit">Item Added Into Favorite
            Successfully</h4>
    </c:if>
    <table id="table2" class="edit">
        <col width="150px" />
        <col width="150px" />
        <col width="80px" />
        <col width="140px" />
        <col width="110px" />

        <tr>
            <th align="left">Title</th>
            <th align="center">Has Teaser</th>
            <th align="right">Box Office</th>
            <th align="center">Genre</th>
            <th align="center">Action</th>
        </tr>
        <c:forEach items="${movie}" var="movie">
            <tr>
                <td>${movie.getTitle()}</td>
                <td align="center"><c:choose>
                        <c:when test="${movie.isHasTeaser()==true}">Yes</c:when>
                        <c:otherwise>No</c:otherwise>
                    </c:choose></td>
                <td align="right"><f:formatNumber type="currency" currencySymbol="$"
                        minFractionDigits="2" value="${movie.getBoxOffice()}"></f:formatNumber></td>


                <td align="center">${movie.getGenre()}</td>


                <td align="center"><a href="AddToFavourite?movieId=${movie.getMovieId()}">Add
                        to Favorite</a></td>
            </tr>
        </c:forEach>
    </table>
    <div class="fixed-footer">
        <div>Copyright&copy2019</div>
    </div>
</body>
</html>