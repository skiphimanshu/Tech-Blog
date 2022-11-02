
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServ extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            res.setContentType("text/html;charset=UTF-8");
            PrintWriter out = res.getWriter();
            Thread.sleep(1000);
            String chk = req.getParameter("check");
            
            if (chk == null) {
                out.println("please check agreement");
            } else {
                //
                String name = req.getParameter("uname");
                String email = req.getParameter("umail");
                String password = req.getParameter("upass");
                String gender = req.getParameter("gender");
                String about = req.getParameter("about");
                
                User user = new User(name, email, password, gender, about);
                // create userDao object
                UserDao userdao = new UserDao(ConnectionProvider.getConnection());
                
                if (userdao.saveUser(user)) {
                    out.println("done");
                    
                } else {
                    out.println("error");
                }
                
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(RegisterServ.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
    