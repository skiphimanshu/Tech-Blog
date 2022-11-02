package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServ extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");

        PrintWriter pw = res.getWriter();
        String name = req.getParameter("email");
        String password = req.getParameter("pass");
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        User u=userDao.getUserByEmailAndPasswors(name, password);
        
        if (u==null) {
            //login error
           Message msg = new Message("Invalid details ! try again","error","alert-danger");
           HttpSession session = req.getSession();
           session.setAttribute("msg", msg);
           res.sendRedirect("login.jsp");
            
        } else {
            //login 
                HttpSession session = req.getSession();
                session.setAttribute("currentUser", u);
                res.sendRedirect("profile.jsp");
        }

    }
}
