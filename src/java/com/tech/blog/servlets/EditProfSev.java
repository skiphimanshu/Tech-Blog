package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
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
 public class EditProfSev extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter pw =  res.getWriter();
        
        //fetch data from Profile
        String name = req.getParameter("p-name");
        String mail = req.getParameter("p-mail");
        String password = req.getParameter("p-pass");
        String gender = req.getParameter("p-gender");
        String about = req.getParameter("p-about");
        Part part = req.getPart("p-image");
        String imgName = part.getSubmittedFileName();
       
         
        
        //get user from session from login.jsp
        HttpSession session = req.getSession();
        User u =(User)session.getAttribute("currentUser");
        
        //set data in User Class
        u.setName(name);
        u.setEmail(mail);
        u.setPassword(password);
        u.setGender(gender);
        u.setAbout(about);
        String oldFile = u.getProfile();
        u.setProfile(imgName);
//        
//        //update in database
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean ans = userDao.updateUser(u);
        if (ans) {
            String pathOld = req.getRealPath("/") + "pics" + File.separator +oldFile;
            String path = req.getRealPath("/") + "pics" + File.separator + u.getProfile();
            if(!oldFile.equals("default.png")){
                Helper.deleteFile(pathOld);
            }
            if (Helper.saveFile(part.getInputStream(), path)) {
                pw.println("Profile update");
                Message msg = new Message("Profile updated successfully", "success", "alert-success");
                session.setAttribute("msg", msg);
            } else {
                pw.println("Profile not update");
                Message msg = new Message("Something went wrong", "error", "alert-danger");
                session.setAttribute("msg", msg);
            }

        } else {
            pw.println("Not-Updated");
            Message msg = new Message("Something went wrong", "error", "alert-danger");     
            session.setAttribute("msg", msg);
        }
        res.sendRedirect("profile.jsp");
        
        
    }

}
