<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.sjsu.cmpe282.dto.DB_Conn"%>
<%@page import="java.util.ArrayList"%>

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
						<li class="active"><a href="../index.jsp">Home</a></li>
						<li class="active"><a href="../view/product.jsp">Back</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

      

        <%
            String id = request.getParameter("id");
            if (request.getParameter("id") == null) {
                response.sendRedirect("product.jsp");
            }else {

            DB_Conn c = new DB_Conn();
            Connection con = c.getConnection();

            Statement st = con.createStatement();


            String getProductQuery = "SELECT * FROM  `products` p INNER JOIN  `images` i USING (  `product-name` ) WHERE  `product-id` ="+id+" GROUP BY  `product-name` ";
            ResultSet rs = st.executeQuery(getProductQuery);

            rs.next();
            //out.println(""+rs.getString("product-name"));

            String product_id = rs.getString("product-id");
            
       //     int product_hits = rs.getInt("hits");

            String product_name = rs.getString("product-name");

      //      String sub_category_name = rs.getString("sub-category-name");

            String category_name = rs.getString("category-name");

        //    String company_name = rs.getString("company-name");

            String price = rs.getString("price");

            String summary = rs.getString("summary");

            String image_name = rs.getString("image-name");

        %>
        


        <div class="container_16">

            <div class="grid_16" id="productStrip">
                <div class="ProductHeading">
                    <div class="grid_16">
                        <h2 class="heading"><%= product_name%>-  <%= category_name%></h2>
                    </div>
                </div>

                <div class="grid_10">
                    <div class="grid_10">
                      <!--  <br/>
                          <h5>Category :<a href="#"><span class="blue"><%= category_name%></span></a> > <a href="#"><span class="blue"></span></a></h5>
                        <div class="clear"></div>
                        <br/>-->
                        <h5>Priced At <span class="BigRed">$ <%= price%></span></h5>
                        <!--  <br/>
                        <br/>-->
                        
                       <h1>Brief Description</h1>
                        <br/>
                        <table class="grid_6" id="descripTable">
                            <tr class="grid_6">
                                <td>Name:</td>
                                <td><%= product_name%></td>
                            </tr>
                            <tr class="grid_6">
                                <td>Category:</td>
                                <td><%= category_name%></td>
                            </tr>
                            
                            
                        </table>

                        <a href="addToCart.jsp?id=<%= product_id %>">
                            <div class="grid_3" id="buy">
                                Buy This Product Now
                            </div>
                        </a>
                        
                        <div  class="grid_5">
                    <div id="productImages">
                        <!-- Images with T are thumbs Images While with Q are The actual source Images -->

                        <img class="BigProductBox" alt="<%= product_name %>" src="<%= image_name%>" />

                        <div class="clear"></div>
                        
                        <%
                            String getImages = "SELECT  `image-name` FROM  `products` INNER JOIN  `images` USING (  `product-name` ) WHERE  `product-id` =" + product_id + "";
                            
                            rs.close();

                            rs = st.executeQuery(getImages);
                            int img_number = 1;
                            rs.next();
                            // GET THE REST OF THE PRODUCT IMAGES
                            while (rs.next()) {

                                 image_name = rs.getString("image-name");

                        %>
 
                           
                        <a href="<%= image_name %>" rel="lightbox[product]" title="Click on the right side of the image to move forward.">
                            <img class="SmallProductBox" alt="<%= image_name %> 1 of 8 thumb" src="<%= image_name %>" />
                        </a>
                        
                        
						<%                            
                            }
                            %>
                           
                        <h1>Product Details</h1>
                        <div class="clear"></div>
                        <p><%= product_name%>

                            <%= summary%>


                        
                    </div>
                </div>

                
                      <%      
                        }
                        %>
                        

                    </div>
                    <div class="clear"></div>
                    
                </div>

            </div>

                        
            
            
            
        </div>



                        



    </body>
</html>