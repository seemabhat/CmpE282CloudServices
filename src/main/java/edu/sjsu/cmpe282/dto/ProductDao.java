package edu.sjsu.cmpe282.dto;

import java.sql.*;
import java.util.ArrayList;

import edu.sjsu.cmpe282.domain.Product;
import edu.sjsu.cmpe282.domain.User;

public class ProductDao {
	
		Connection conn = null;
	    Statement stmt = null;
	
	// Constructure with JDBC connection
	  public ProductDao()
	  {
		   try{
		      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      conn = DriverManager.getConnection("jdbc:mysql://localhost/CloudServices","root",null);
		   }
		   catch (SQLException e) {
					e.printStackTrace();
					
			}
	  }
	  
//	  public boolean addUser(User user)
//	  {
//		  try {
//		 stmt = conn.createStatement();
//		 String query = "INSERT INTO `cloudservices`.`users` (`firstname`, `lastname`, `email`, `passwd`) VALUES ('" + user.getFirstName() + "', '" + user.getLastName() + "', '" + user.getEmail() + "', '" + user.getPasswd() + "');";
//		 stmt.executeUpdate(query);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		  return true;
//	  }
	  
	  
	  public ArrayList<Product> getProducts(){
		  System.out.println("start db");
		  ResultSet rs;
		  ArrayList<Product> productArray = new ArrayList<Product>();
		  	try {
		  		stmt = conn.createStatement();
		  		//String query = "Select * from cloudservices.product_details";
		  		String query = "Select * from cloudservices.products";
		  		rs = stmt.executeQuery(query);
		  		
		  		
		  		while (rs.next()) {
		  			Product product = new Product();
		  			/*product.setProductId(rs.getInt("ProductID"));
		  			product.setProductName(rs.getString("ProductName"));
		  			product.setDescription(rs.getString("Description"));
		  			product.setPrice(rs.getInt("Price"));
		  			product.setQuantity(rs.getInt("Quantity"));*/
		  			product.setProductId(rs.getInt("product-id"));
		  			product.setProductName(rs.getString("product-name"));
		  			product.setDescription(rs.getString("summary"));
		  			product.setPrice(rs.getInt("price"));
		  			product.setQuantity(rs.getInt("product-qty"));
		  			productArray.add(product);
		  			//System.out.println(rs.getString("ProductName"));
		  		}
		  		
		  		} catch (SQLException e) {
		  			// TODO Auto-generated catch block
		  			e.printStackTrace();
		  		}

		  	System.out.println("end db");
		  		return productArray;
		  }
	  
	  
}
