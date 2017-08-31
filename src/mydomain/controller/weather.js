$(document).ready(function() {
    $.ajax({
        url: "http://api.wunderground.com/api/0febb2c6dfdd1e46/conditions/q/Miami.json"
    }).then(function(data) {
       $('.Miami-version').append(data.id);
     /*  $('.greeting-content').append(data.content);*/
    });
});