package edu.sjsu.cmpe282.api.resources;


import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

//import dynamoDB.AddToCart;
import edu.sjsu.cmpe282.domain.Product;
import edu.sjsu.cmpe282.dto.ProductDao;

@Path("/products")

public class ProductResource {
	
	private ProductDao productdao = new ProductDao();
	
		
//	@POST
//	@Path("/Main")
//	public void main(User user){
//		System.out.println("user created: "+user.getFirstName());
//	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/main")
	public JSONArray displayProducts()
	{
		System.out.println("deeptiuigiuohoi");
		ArrayList<Product> productList = productdao.getProducts();
		
		JSONArray jsonArray = new JSONArray();
		
		//JSONObject json = new JSONObject();
		
		for (int i=0; i<productList.size(); i++) {
			jsonArray.put(productList.get(i).getJSONObject());
//			try {
//				json.put("key"+i, productList.get(i).getJSONObject());
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
			//System.out.println(productList.get(i).getJSONObject());
		}
		
		System.out.println(jsonArray);
		
//		try {
//			//System.out.println(jsonArray.get(0));
//		} catch (JSONException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		JSONObject json1 = new JSONObject();
//		try {
//			json1.put("a", 1);
//		} catch (JSONException e) {
//			
//			e.printStackTrace();
//		}
		//String st = "Hi huccha somesha";
		//return productdao.getProducts();
		//List<Product> productList =productdao.getProducts();
		return jsonArray;
		//return st;
	}
	/*public Response displayProducts()
	{	
		System.out.println("in signin");
		ArrayList<Product> productsArray = productdao.getProducts();
		
		return productsArray;
	}*/
	
	
	/*@POST
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.TEXT_PLAIN)
	@Path("/addtocart")
	public String addtocart(String product)
	{
		System.out.println("in cart"+product);
		Product prod = new Product();
		StringTokenizer str = new StringTokenizer(product,",");
		while (str.hasMoreElements()) {
			prod.setProductId(Integer.parseInt((String)str.nextElement()));
			prod.setProductName((String)str.nextElement());
			prod.setDescription((String)str.nextElement());
			prod.setPrice(Integer.parseInt((String)str.nextElement()));
			prod.setQuantity(Integer.parseInt((String)str.nextElement()));
			//System.out.println(st2.nextElement());
		}
		
//		System.out.println(prod.getProductId());
//		System.out.println(prod.getProductName());
//		System.out.println(prod.getDescription());
//		System.out.println(prod.getPrice());
//		System.out.println(prod.getQuantity());
		
		
		
		AddToCart cart = new AddToCart();
		
			try {
				cart.addToDynamoDB(prod);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		
		return "added to cart";
	}*/
	
	
	
	
		
}
