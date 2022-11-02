package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories() {
        
        ArrayList<Category> list = new ArrayList<>();
        try {
            
            String q = "select * from categories";
            Statement s = this.con.createStatement();
            ResultSet rs = s.executeQuery(q);
            while(rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String desc = rs.getString("description");
                Category c = new Category(cid, name, desc);
                list.add(c);
            }
            
            
            
        }catch(Exception e){
            
            e.printStackTrace();
        }
        
        return list;
    }
    
    //save post method
    public boolean savePost(Post p) {
        boolean f = false;
        
        try {
            String q = "insert into posts(ptitle,pcontent,pcode,pimg,catid,userid) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
            ps.setString(4, p.getpImg());
            ps.setInt(5, p.getCatId());
            ps.setInt(6, p.getUserId());
            ps.executeUpdate();
            f = true;
        }catch(Exception e){
            
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        // fetch all post 
        try {
            PreparedStatement ps = con.prepareStatement("select * from posts order by pid desc");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("ptitle");
                String pContent = rs.getString("pcontent");
                String pCode = rs.getString("pcode");
                String pimg = rs.getString("pimg");
                Timestamp date = rs.getTimestamp("pdate");
                int catId = rs.getInt("catid");
                int userId = rs.getInt("userid");
                Post p = new Post(pid,pTitle, pContent, pCode, pimg, date, catId, userId);
                list.add(p);
            }
            
        }catch(Exception e){
            
        }
        
        return list;
    }
    public List<Post> getAllPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        // fetch all post bu catid
        try {
            PreparedStatement ps = con.prepareStatement("select * from posts where catid = ?");
            ps.setInt(1,catId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("ptitle");
                String pContent = rs.getString("pcontent");
                String pCode = rs.getString("pcode");
                String pimg = rs.getString("pimg");
                Timestamp date = rs.getTimestamp("pdate");
                
                int userId = rs.getInt("userid");
                Post p = new Post(pid,pTitle, pContent, pCode, pimg, date, catId, userId);
                list.add(p);
            }
            
        }catch(Exception e){
            
        }
        
        return list;
    }
    public Post getPostByPostId(int postId) {
        Post post = null;
        String qu = "select * from posts where pid=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(qu);
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
               int pid = rs.getInt("pid");
                String pTitle = rs.getString("ptitle");
                String pContent = rs.getString("pcontent");
                String pCode = rs.getString("pcode");
                String pimg = rs.getString("pimg");
                Timestamp date = rs.getTimestamp("pdate");
                int catdId = rs.getInt("catid");
                
                int userId = rs.getInt("userid");
                post = new Post(pid,pTitle, pContent, pCode, pimg,date,catdId, userId);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return post;
    }
     
}
