<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%
    Thread.sleep(1000);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       

    </head>
    <body>
        <div class="row">
            <%
                PostDao d = new PostDao(ConnectionProvider.getConnection());
                int cId = Integer.parseInt(request.getParameter("cId"));
                List<Post> plist = null;
                if (cId == 0) {
                    plist = d.getAllPost();
                } else {
                    plist = d.getAllPostByCatId(cId);
                }
                for (Post p : plist) {
            %>
            <div class="col-md-6 mt-2">
                <div class="card">
                    <img src="postPics/<%=p.getpImg()%>" class="card-img-top img-fluid" alt="Postimage" style="height: 15vw;">
                    <div class="card-body ">
                        <h5 class="card-title"><%= p.getpTitle()%></h5>
                        <hr>

                        <p id="p-cont"><%=p.getpContent()%></p>
                    </div>
                    <div class="card-footer primary-background text-center">
                        <a href="loadMorePost.jsp?postId=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More</a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"><span> 10</span></i></a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class='far fa-comment-alt'><span> 5</span></i></a>
                    </div>
                </div>
            </div>
             <%
                }
            %> 
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        
    </body>
</html>
