package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPostServ extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter pw = response.getWriter();
        //fetch data
        int cId = Integer.parseInt(request.getParameter("cid"));
        String pTitle = request.getParameter("po-title");
        String pContent = request.getParameter("po-content");
        String pCode = request.getParameter("po-code");
        Part part = request.getPart("po-img");
        String pImg = part.getSubmittedFileName();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        int userId = user.getId();
        
        // set variable to post
        Post post = new Post(pTitle, pContent, pCode, pImg, null, cId, userId);
        // save post
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        if (postDao.savePost(post)) {
            String path = request.getRealPath("/") + "postPics" + File.separator + pImg;
            Helper.saveFile(part.getInputStream(), path);
            pw.println("done");
        }else {
            pw.println("N_done");
        }
        
        
       
       
    }

}
