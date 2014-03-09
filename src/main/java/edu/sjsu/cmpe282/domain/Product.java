package edu.sjsu.cmpe282.domain;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

public class Product {
	
	private int ProductId;
	private String ProductName;
	private String Description;
	private int Price;
	private int Quantity;
	
		
	public Product() {
		super();
	}

	
	
	public Product(int productId, String productName, String description,
			int price, int quantity) {
		super();
		ProductId = productId;
		ProductName = productName;
		Description = description;
		Price = price;
		Quantity = quantity;
	}
	

	public int getProductId() {
		return ProductId;
	}


	public void setProductId(int productId) {
		ProductId = productId;
	}


	public String getProductName() {
		return ProductName;
	}


	public void setProductName(String productName) {
		ProductName = productName;
	}


	public String getDescription() {
		return Description;
	}


	public void setDescription(String description) {
		Description = description;
	}


	public int getPrice() {
		return Price;
	}


	public void setPrice(int price) {
		Price = price;
	}


	public int getQuantity() {
		return Quantity;
	}


	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public JSONObject getJSONObject() {
        JSONObject obj = new JSONObject();
        try {
            obj.put("ProductId", ProductId);
            obj.put("ProductName", ProductName);
            obj.put("Description", Description);
            obj.put("Price", Price);
            obj.put("Quantity", Quantity);
        } catch (JSONException e) {
           // e.setStackTrace("DefaultListItem.toString JSONException: "+e.getMessage());
        }
        return obj;
    }
	
	
}
