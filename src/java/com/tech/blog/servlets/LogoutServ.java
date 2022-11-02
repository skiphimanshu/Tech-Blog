package com.tech.blog.servlets;

import com.tech.blog.entities.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Himanshu
 */
public class LogoutServ extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = res.getWriter();
        HttpSession session = req.getSession();
        session.removeAttribute("currentUser");
        Message msg = new Message("Logout Sucessfully","sucess","alert-success");
        session.setAttribute("msg", msg);
        res.sendRedirect("login.jsp");
        
    }

}
