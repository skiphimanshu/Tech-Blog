package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
  public static Connection con;
  
  public static Connection getConnection() {
     
        if (con == null) {

            try {
                //driver class load
                Class.forName("com.mysql.jdbc.Driver");

                //create connection   
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/techblog?characterEncoding=utf8", "root", "Himanshu");
                

            } catch (Exception e) {
                e.printStackTrace();

            }
        }

        return con;

    }
    
      
}
