function validateMovieForm() {
    var title = document.forms["movieForm"]["title"].value;
    var boxOffice = document.forms["movieForm"]["boxOffice"].value;
    var dateOfLaunch = document.forms["movieForm"]["dateOfLaunch"].value;
    var genre = document.forms["movieForm"]["genre"].value;
    var regNumbers = (/^.*[0-9].*$/);
    var regSpecial = (/^.*[!#@&?].*$/);
    var regCharacters = (/^.*[a-zA-Z!#@&?].*$/);
    if (title == "") {
        alert("Title is required");
        return false;
    } else if (title.length < 2 || title.length > 100) {
        alert("Title should have 2 to 100 characters");
        return false;

    } else if (boxOffice == "") {
        alert("Box Office is required");
        return false;
    } else if (boxOffice.match(regCharacters)) {
        alert("Box Office has to be a number");
        return false;
    } else if (dateOfLaunch == "") {
        alert("Date of Launch is required");
        return false;
    } else if (genre == "") {
        alert("Select one genre");
        return false;
    } else {
    }

}
