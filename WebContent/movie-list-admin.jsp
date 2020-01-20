<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin-Page</title>
<link rel="shortcut icon" href="images\logo.png">
<link rel="stylesheet" href="styles\style.css">
</head>
<body link="white">
    <div class="fixed-header">
        <div class="container">
            <div class="edit">
                Movie Cruiser&nbsp;&nbsp;&nbsp;&nbsp;<img src="images\logo.png" height=25 width=25>
            </div>
        </div>
        <div class="nav">
            <a href="ShowMovieListAdmin">Movies</a>
        </div>

    </div>
    <div>

        <h1 class="edit">Movies</h1>
    </div>
    <table class="edit">
        <tr>
            <th width=200 align=left><b>Title</b></th>
            <th width=100 align=right><b>Box Office</b></th>
            <th width=100><b>Active</b></th>
            <th width=120><b>Date of Launch</b></th>
            <th width=120 align=center><b>Genre</b></th>
            <th width=130><b>Has Teaser</b></th>
            <th>Action</th>
        </tr>
        <c:forEach items="${movie}" var="movie">
            <tr>
                <td>${movie.getTitle()}</td>
                <td align="right"><f:formatNumber type="currency" currencySymbol="$"
                        minFractionDigits="2" value="${movie.getBoxOffice()}"></f:formatNumber></td>
                <td align="center"><c:choose>
                        <c:when test="${movie.isActive()==true}">Yes</c:when>
                        <c:otherwise>No</c:otherwise>
                    </c:choose></td>
                <td align="center"><f:formatDate value="${movie.getDateOfLaunch()}"
                        pattern="dd/MM/yyyy"></f:formatDate></td>
                <td align="center">${movie.getGenre()}</td>
                <td align="center"><c:choose>
                        <c:when test="${movie.isHasTeaser()==true}">Yes</c:when>
                        <c:otherwise>No</c:otherwise>
                    </c:choose></td>
                <td align="center"><a href="ShowEditMovie?movieId=${movie.getMovieId()}">Edit</a></td>
            </tr>
        </c:forEach>
    </table>
    <div class="fixed-footer">
        <div>Copyright&copy2019</div>
    </div>

</body>
</html>