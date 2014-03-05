<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.sjsu.cmpe282.dto.DB_Conn"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
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
				<!--  		<li class="active span6"></li>-->
				<!--  		<li class="span2"><a href="view/product.jsp">Product</a></li> -->
					</ul>
				</div>
			</div>
		</div>
        
        
                     
                    <%
                        String category;
                        StringBuffer sql = new StringBuffer();
                        sql.append("SELECT * FROM  `products` p "
                                        + "INNER JOIN  `images` i "
                                        + "USING (  `product-name` ) ");
                        
                        category = "";
                     //   if(session.getAttribute("cat") != null ){
                       //     category = (String) session.getAttribute("cat");
                         //   ArrayList subCat = product.getSubcategory(category);
                                
                           
                      //  }
                    %>
                    <!--
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Categories</strong></a></li>
                            <li><a href="#">Books</a></li>
                            <li><a href="#">Calculators</a></li>
                            <li><a href="#">Art Supplies</a></li>
                            <li><a href="#">Office Supplies</a></li>
                            <li><a href="#">School Supplies</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Movies</a></li>
                        </ul>
                    </div>
                    
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Sub-Categories</strong></a></li>
                            <li><a href="#">Books</a></li>
                            <li><a href="#">Calculators</a></li>
                            <li><a href="#">Art Supplies</a></li>
                            <li><a href="#">Office Supplies</a></li>
                            <li><a href="#">School Supplies</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Movies</a></li>
                        </ul>
                    </div>
                    
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Pricing</strong></a></li>
                            <li><a href="#">Low to High</a></li>
                            <li><a href="#">High to Low</a></li>
                        </ul>
                    </div>
                    -->
                    
                    
                </div>
            </div>

            <!-- Middle -->
            <div id="middle"class="grid_13">
                <div class="grid_13" id="whiteBox">
                    <div class="ProductHeading">
                        <div class="grid_12">
                                <h2 class="heading">Products 
                                    <%= category %> 
                                </h2>
                        </div>
                        
                    </div>
                    <div class="grid_12 productListing">
                        
                        <div class="clear"></div>
                        <%
                            if (session.getAttribute("cat") != null){
                                category = (String)session.getAttribute("cat");
                                /*
WHERE  `category-name` =  'Games'
AND  `sub-category-name` =  'Action-Adventure-Game'
GROUP BY  `product-name` */
                                
                                sql.append(" WHERE  `category-name` =  '"+category+"' ");
                                %>
                                    <div class="grid_4 ">
                                        <a id="greenBtn" href="removeProductFilter.jsp?cat=<%= category %>">Category : <%= category %> [x]</a>
                                    </div>
                                <%
                                
                                %>

                                    
                                <%
                            }
                        %>
                        
                        <%
                            //String sql = "SELECT * FROM  `products` p "
                             //           + "INNER JOIN  `images` i "
                             //           + "USING (  `product-name` ) 
                             //             +`product_qty` > 0
                              //          + "GROUP BY  `product-name` ";

                        DB_Conn con = new DB_Conn();
                        Connection c = con.getConnection();
                        Statement st = c.createStatement();
                        ResultSet rs ;
                         if (sql.toString().equalsIgnoreCase("SELECT * FROM  `products` p "
                                                            + "INNER JOIN  `images` i "
                                                            + "USING (  `product-name` ) "
                                                            )){
                            
                            String newSQL  = "SELECT * FROM  `products` p "
                                            + "INNER JOIN  `images` i "
                                           + "USING (  `product-name` ) "
                                            + " WHERE `product-qty` > 0 "
                                          +" GROUP BY  `product-name` ";
                            //out.print("Equals "+sql.toString() +" "+newSQL);
                         rs= st.executeQuery(newSQL);
                         }else { 
                            
                        sql.append(" AND `product-qty` > 0  "
                                + " GROUP BY  `product-name` ");
                            //out.print("Not Equals "+sql.toString());
                            rs= st.executeQuery(sql.toString());                        
                         }
                        

                                while (rs.next()) {
                                    /*
product-name	product_id	sub-category-name	category-name	company-name	price	summary	image-id	image-name*/
                                    String product_id = rs.getString("product-id");

                                    String product_name = rs.getString("product-name");

                               //     String sub_category_name = rs.getString("sub-category-name");

                                    String category_name = rs.getString("category-name");

                                 //   String company_name = rs.getString("company-name");

                                    String price = rs.getString("price");

                                    String summary = rs.getString("summary");
                                    
                                    String image_name = rs.getString("image-name");
/*
                                    out.println("<br/>"+product_id+
                                            "<br/>"+product_name+
                                            "<br/>"+sub_category_name+
                                            "<br/>"+category_name+
                                            "<br/>"+company_name+
                                            "<br/>"+price+
                                            "<br/>"+summary+
                                            "<br/>"+image_name);
                                    */
                        %>
                        <div class="clear"></div>
                        <div class="grid_2">
                          <!--   <a href="product.jsp?id=<%=product_id%>"><img src="<%= image_name %>" /></a> --> 
                          <a href="productDetail.jsp?id=<%=product_id%>"><img src="<%= image_name %>" /></a>
                        </div>
                        <div class="grid_9">
                            <div class="grid_5">
                                <p id="info"><a href="productDetail.jsp?id=<%=product_id%>"><h3><span class="blue"> <%=product_name %></span></h3></a><span class="red">$<%= price %></span></p>
                            </div>
                            <div class="grid_3 push_2">
                                <p><a href="addToCart.jsp?id=<%= product_id %>" id="greenBtn">Add to cart</a></p>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <%
                                }
                            rs.close();
                            st.close();
                            c.close();
                        %>

                    </div>
                </div>

                

    </body>
</html>