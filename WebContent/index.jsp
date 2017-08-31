<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>My First Application</title>
		
			<script  type="text/javascript"> 
			var re = /^[A-Za-z]+,[ ]?[A-Za-z]{2,}$/;

		 function validateName(cityName) // java script function is created 
		{ 
			var x = re.exec(cityName.value);
		if(x.value=="" ) { 
		alert("City Name should not be blank..");
		 return false; 
		 }
		/* if( !x.value.matches(re)) {
			alert("please enter a valid City Name.")
		} */
		} 
		</script>
		 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	        <script src="weather.js"></script>
	</head>
	<body>
		Forecast! with Expertise
        <a href="hello.html">  <br></br>Click to see model view controller Implementation!</a>
     
		<form  method="post"  onsubmit = "return validateName(document.getElementById('cityName'))" class= "my-form">
		<table style="with: 50%">
 
			<tr>
				<td>CityName</td>
				<td><input type="text" name="cityName" id="cityName" /></td>
			</tr>
		</table>
	<!-- 	<input type="submit" value="Submit" /></form> -->

	
  <script type="text/javascript">

  jQuery(function($){

    function getWeather(){
      $.ajax('http://api.wunderground.com/api/c6dc8e785d943109/conditions/q/AZ/Chandler.json', {
    	 /*  $.ajax('http://api.wunderground.com/api/0febb2c6dfdd1e46/conditions/q/Miami.json', { */  
        dataType: 'jsonp',
        success: function(json) {
          $('div#city strong').text(json.current_observation.display_location.city)
          $('div#icon').html('<img src=' + json.current_observation.icon_url + '>')
          $('div#weather').text(json.current_observation.temperature_string + " " + json.current_observation.weather);
          $('div#time').text(json.current_observation.observation_time_rfc822);
        }
      });
    }


    $('#btn_add').click(function(e) {
        e.preventDefault();
        $(this).hide();
        getWeather();
        $('#result').fadeIn(1000);
      });
    
    $('a.hide').click(function(e) {
      e.preventDefault();
      $('#result').hide();
      $('#btn_add').show();
    })

  })

  </script>
    <header class="seats-header">
  <h1>Weather</h1>
</header>

  <button type="button" id="btn_add" class="btn btn-primary">Search</button>
    <a class="btn_delete" href="#"><i class="icon-trash"></i></a>
  <div id="result" style="display: none">
    <div id="icon"></div>
    <div id="city"><strong></strong></div>
    <div id="weather"></div>
    <div id="time"></div>
    <div><a href="#" class="hide">Hide</a>
  </div>


		
	</body>
</html>