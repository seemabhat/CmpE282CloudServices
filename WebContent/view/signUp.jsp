<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


<form class="well span6" onsubmit="return false;">
			<input type="text" id="firstName" class="span3"
				placeholder="First Name" /> <input type="text" id="lastName"
				class="span3" placeholder="Last Name" /> <input type="text"
				id="email" class="span6" placeholder="Your Email" /> <input
				type="password" id="passwd" class="span6"
				placeholder="Enter Password" /> <input type="password"
				id="repasswd" class="span6" placeholder="Re-Enter Password" />
			<button class="btn btn-primary" id="signUp" onclick="signUpfun()">Sign
				Up</button>
			<button class="btn" id="clear">Clear</button>
		</form>

	</div>
	<script src="assets/js/signUp.js"></script>
</body>
</html>