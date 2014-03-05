<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.sjsu.cmpe282.dto.DB_Conn"%>

<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<title>CmpE282 Computer Store</title>
<link type="text/css" rel="stylesheet" href="assets/css/bootstrap.css" />
</head>

<body>
	<div class="container">
		<h1>
			<a href="#">CmpE282 Computer Store</a>
		</h1>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li class="active"><a href="index.jsp">Home</a></li>
						<li class="active span6"></li>
						<li class="span2"><a href="view/signIn.jsp">Sign In</a></li>
						<li class="span2"><a href="view/signUp.jsp">Sign Up</a></li>
						<!--     <li><a href="#">My Cart</a></li> -->
					</ul>
				</div>
			</div>
		</div>
		<%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
		<div id="leftside" class="grid_3">
			<div>
				<ul id="leftsideNav">
					<li><a href="#"><strong>CATEGORIES</strong></a></li>

					<%
                        while (rs.next()){
                            String category = rs.getString ("category-name");
                            %>
					<li><a href="view/product.jsp"><%= category %></a></li>
					<%
                        }
                        %>
				</ul>
			</div>
		</div>
		<img src="assets/img/cloudServices.jpg" class="span5" />

		<!-- h1><a href="#">CMPE 282 Cloud Services</a></h1>
	
	<h1 class="span2"><a href="view/SignIn.html">Sign In</a></h1>
	<h3><a href="#">My Cart</a></h3-->


	</div>	
	<script src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</body>
</html>
