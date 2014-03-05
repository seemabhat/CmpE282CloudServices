<!DOCTYPE HTML>
<html>

<head>
	<meta charset="utf-8">
	<!-- <title> CMPE-282 Cloud Services </title> -->
	<title> CmpE282 Computer Store </title>
	<link type="text/css" rel="stylesheet" href="../assets/css/bootstrap.css"/>
</head>

<body>

<div class="container">
	<!--  <h1><a href="#">CMPE 282 Cloud Services</a></h1>-->
	<h1><a href="#">CmpE282 Computer Store</a></h1>
	
	<div class="navbar">
              <div class="navbar-inner">
                <div class="container">
                  <ul class="nav">
                   <!--   <li class="active"><a href="../index.html">CMPE282.com</a></li> -->
                   <li class="active"><a href="../index.jsp">Home</a></li>
                  	<li class="active span6"></li>
					<li class="span2"><a href="signIn.jsp">Sign In</a></li> 
					
              <!--        <li><a href="#">My Cart</a></li> -->
                  </ul>
                </div>
              </div>
            </div>
	<img src="../assets/img/cloudServices.jpg" class="span5" />
	<!-- h1><a href="#">CMPE 282 Cloud Services</a></h1>
	
	<h1 class="span2"><a href="SignIn.jsp">Sign In</a></h1>
	<h3><a href="#">My Cart</a></h3-->

	<form class="well span6" onsubmit="return false;">
		<input type="text" id="userName" class="span3" placeholder="Username"/>
		<input type="password" id="passwd" class="span3" placeholder="Password" />
	    <button class="btn btn-primary" id="login" onclick="LogInfun()">Login</button>
		<button id="clear" class="btn"> Clear </button>
	</form>
	</div>
	
	<script src="../assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<!--  script src="../assets/js/signIn.js"></script> -->
	
	<script type="text/javascript">
	
	//$(document).ready(function(){
	//	
	//})
	
function LogInfun(){

	var URL = "http://localhost:8080/CloudServices/rest/users/signIn";
	alert("signin button clicked"+formToJSON());
	
	$.ajax({
			type: "POST",
			url: URL,
			contentType: "application/json",
			dataType: 'json',
			data : formToJSON(),
				//success: function () { //success(data); }
			success: function(data, textStatus, jqXHR){
					alert("you are logged in");
				},
			error: function(textStatus, jqXHR,errorThrown){
				alert(textStatus+" "+jqXHR);
			}

		});
	
}

function formToJSON() {
    return JSON.stringify({
    "email": $('#userName').val(),
    "passwd": $('#passwd').val(),
    });
}


	</script>
	
</body>
</html> 