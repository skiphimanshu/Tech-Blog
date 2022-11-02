package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class UserDao {
    private Connection con; 
    
    public UserDao(Connection con) {
        
        this.con = con;
    }
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String qury = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(qury);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.executeUpdate();
            f = true;
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByEmailAndPasswors(String email,String password) {
        User user = null;
        try {
            String qury = "select * from user where email=? and password=?";
            PreparedStatement ps = this.con.prepareStatement(qury);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                //data from db

                //set to user Object
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("date"));
                user.setProfile(rs.getString("profile"));
                

            } else {
                
                
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
    public boolean updateUser(User user) {
        boolean f = false;
        try{
            //update 
            
            String qyry = "update user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
            PreparedStatement ps = con.prepareStatement(qyry);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7,user.getId());
            ps.executeUpdate();
            f = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    public User getUserByUserId(int userId){
        User user = null;
        String qu = "select * from user where id=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(qu);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                //set to user Object
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("date"));
                user.setProfile(rs.getString("profile"));

            }

        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return user;
    }
}
