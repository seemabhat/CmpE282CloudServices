package edu.sjsu.cmpe282.dto;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
/*
 *
 * @author Chirag
 */
public class DB_Conn {

    private String database="cloudservices", username = "root", password = null;
    private Connection con;
    
    public Connection getConnection() throws SQLException, ClassNotFoundException  {
        Class.forName("com.mysql.jdbc.Driver"); 
       // con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database+"",""+username+"",""+password+""); 
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudservices","root",null);
        // stm=con.createStatement(); 
        return con;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
