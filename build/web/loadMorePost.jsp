<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    int pId = Integer.parseInt(request.getParameter("postId"));
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    Post po = postDao.getPostByPostId(pId);
    int userId = po.getUserId();
    UserDao ud = new UserDao(ConnectionProvider.getConnection()); 
    User u = ud.getUserByUserId(userId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>Profile</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background {

                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 70% 100%, 24% 93%, 0 100%, 0 0);
            }
            
            .post-title {

                font-size: 30px;
            }
            .po-date{
                font-style: italic;
                font-weight: bold;
            }
            body {
                background: url(img/bgimg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

        </style>

    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
        <!-- navbar -->


        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fas fa-code"></span>Tech Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-home"></span> Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link  active" href="#"><i class='far fa-address-card'></i> Contact </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-list-alt "><span> Category
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li><a class="dropdown-item" href="#">Java</a></li>
                                            <li><a class="dropdown-item" href="#">Python</a></li>
                                            <li><a class="dropdown-item" href="#">C#</a></li>
                                            <li><a class="dropdown-item" href="#">Java EE</a></li>
                                            <li><a class="dropdown-item" href="#">JDBC</a></li>
                                        </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active " href="profile.jsp"><i class="far fa-file-alt"></i> Profile</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#!" data-bs-toggle="modal" data-bs-target="#post-modal"><i class='fas fa-pen'></i> Create Post</a>
                                        </li>

                                        </ul>
                                        <ul class="navbar-nav mr-right">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#!" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profile-modal" ><i class="fas fa-user-circle"></i> <%= user.getName()%> </a>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link active " href="LogoutServ"><i class="fas fa-power-off"></i> Logout</a>
                                            </li>
                                        </ul>

                                        </div>
                                        </div>
                                        </nav>




                                        <!-- Profile modal -->

                                        <div class="modal fade" id="profile-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header primary-background text-white">
                                                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="contanier text-center">

                                                            <img src="pics/<%= user.getProfile()%>"class="img-fluid" style="border-radius: 50%; max-width:90px;"/>
                                                            <h5 class="modal-title mt-3 text-primary" id="exampleModalLabel"><%= user.getName()%></h5>

                                                            <div id="profile-details">


                                                                <table class="table">

                                                                    <tbody>
                                                                        <tr>
                                                                            <th scope="row">ID</th>
                                                                            <td><%= user.getId()%></td>

                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Email</th>
                                                                            <td><%= user.getEmail()%></td>

                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Gender</th>
                                                                            <td><%=  StringUtils.capitalize(user.getGender())%></td>

                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Status</th>
                                                                            <td><%= user.getAbout()%></td>

                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Registered On</th>
                                                                            <td><%= user.getDateTime().toString()%></td>

                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>


                                                            <div id="edit-profile" style="display: none;">

                                                                <p class="mt-2">Please Edit Your Details...</p>

                                                                <form action="EditProfSev" method="post" enctype="multipart/form-data">

                                                                    <table class="table">
                                                                        <tr>
                                                                            <th scope="row">ID :</th>
                                                                            <td> <%= user.getId()%> </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Name :</th>
                                                                            <td><input type="text" class="form-control" value="<%= user.getName()%>" name="p-name" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Email :</th>
                                                                            <td><input type="email" class="form-control" value="<%= user.getEmail()%>" name="p-mail" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Password :</th>
                                                                            <td><input type="password" class="form-control" value="<%= user.getPassword()%>" name="p-pass" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Gender :</th>
                                                                            <td class="form-group"><input <% if (user.getGender().equals("male")) {%>
                                                                                    checked
                                                                                    <%
                                                                                        }
                                                                                    %>type="radio" name="p-gender" class="form-check-input " value="male"/>Male

                                                                                <input <% if (user.getGender().equals("female")) {%>
                                                                                    checked
                                                                                    <%
                                                                                        }
                                                                                    %>
                                                                                    type="radio" name="p-gender" class="form-check-input" value="female" />Female</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">About :</th>
                                                                            <td>
                                                                                <textarea rows="3"  class="form-control" name="p-about"><%= user.getAbout()%></textarea>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">Profile :</th>
                                                                            <td><input type="file" class="form-control" name="p-image" accept="image/*" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <div class="container">
                                                                        <button type="submit"id="f-sub" class="btn btn-primary">Save</button>
                                                                    </div>

                                                                </form>

                                                            </div>                  
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="button" id="edit-btn" class="btn btn-primary">Edit</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- end of profile-modal -->

                                        <!-- Post modal -->

                                        <div class="modal fade" id="post-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header primary-background text-white">
                                                        <h5 class="modal-title text-center" id="staticBackdropLabel">Create Your Post</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <form action="AddPostServ" method="post" id="post-form">
                                                            <div class="form-group">
                                                                <select class="form-select" aria-label="Default select example"name="cid">
                                                                    <option selected disabled>select post category</option>
                                                                    <%
                                                                        PostDao pDao = new PostDao(ConnectionProvider.getConnection());
                                                                        ArrayList<Category> list = pDao.getAllCategories();
                                                                        for (Category c : list) {
                                                                    %>

                                                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                                                    <% }
                                                                    %>

                                                                </select>
                                                            </div>

                                                            <div class="form-group mt-3">
                                                                <input type="text" placeholder="Enter  post Title" class="form-control" name="po-title"/>
                                                            </div>

                                                            <div class="form-group mt-3">
                                                                <textarea class="form-control"  name="po-content" placeholder="Enter your content" style="height: 150px;"></textarea>
                                                            </div>
                                                            <div class="form-group mt-3">
                                                                <textarea class="form-control"  name="po-code" placeholder="Enter your code(if any)" style="height: 150px;"></textarea>
                                                            </div>
                                                            <div class="form-group mt-3">
                                                                <label>Select Post Image</label><br>
                                                                <input type="file" name="po-img" id="file"/>
                                                            </div>
                                                            <div class="container mt-3 text-center">
                                                                <button type="submit" class="btn btn-outline-primary">Post</button>
                                                            </div>        

                                                        </form>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary">Understood</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                        <!-- end of post modal -->
                                        <!-- main body -->
                                        <main>
                                            <div class="container">
                                                <div class="row my-4">
                                                    <div class="col-md-8 offset-md-2">
                                                        <div class="card">
                                                            <div class="card-header primary-background text-white text-center">
                                                                <h4 class="post-title"><%= po.getpTitle()%></h4>

                                                            </div>
                                                            <div class="card-body">
                                                                <img src="postPics/<%=po.getpImg()%>" style="height: 20vw;" class="card-img-top my-2" alt="Postimage"/>
                                                                <div class="row my-3">
                                                                    <div class="col-md-8">
                                                                        <p> <a href="#!" style="text-decoration: none;"><%= u.getName() %></a> has posted : </p>
                                                                    </div>
                                                                    <div class="col-md-4 po-date">
                                                                        <p> <%= po.getPdate().toLocaleString()%></p>

                                                                    </div>
                
                                                                </div
                                                                <p><%=po.getpContent() %></p>
                                                               
                                                                <br>
                                                                <div class="post-code">
                                                                    <span class="fas fa-code"> code</span>
                                                                    <br><br>
                                                                    <pre><%= po.getpCode()%></pre>
                                                                </div>


                                                            </div>
                                                            <div class="card-footer primary-background">
                                                                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"><span> 10</span></i></a>
                                                                <a href="#!" class="btn btn-outline-light btn-sm"><i class='far fa-comment-alt'><span> 5</span></i></a>


                                                            </div>




                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </main>


                                        <!-- end of msin body -->




                                        <!-- JavaScript Bundle with Popper -->
                                        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
                                        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>        
                                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                                        <script>
                                            $(document).ready(function () {
                                                let editStatus = false;

                                                $('#edit-btn').click(function ()
                                                {
                                                    if (editStatus === false) {
                                                        $("#profile-details").hide();
                                                        $("#edit-profile").show();
                                                        editStatus = true;
                                                        $(this).text("Back");
                                                    } else {
                                                        $("#profile-details").show();
                                                        $("#edit-profile").hide();
                                                        editStatus = false;
                                                        $(this).text("Edit");
                                                    }
                                                })
                                            });
                                        </script>
                                        <script>
                                            $(document).ready(function (e) {
                                                $("#post-form").on("submit", function (event) {
                                                    event.preventDefault();

                                                    let form = new FormData(this);
                                                    $.ajax({
                                                        url: "AddPostServ",
                                                        type: 'POST',
                                                        data: form,
                                                        success: function (data, textStatus, jqXHR) {
                                                            if (data.trim() === 'done') {
                                                                swal("Post Saved", "Post Saved Sucessfully", "success");

                                                            } else {
                                                                swal("Error!", "Something went wrong", "error");
                                                            }

                                                        }, error: function (jqXHR, textStatus, errorThrown) {
                                                            swal("Error!", "Something went wrong", "error");
                                                        },
                                                        processData: false,
                                                        contentType: false
                                                    })
                                                })
                                            })
                                        </script>
                                        <script>
                                            function getPosts(catId, temp)
                                            {
                                                $("#ploader").show();
                                                $("#p-container").hide();
                                                $(".c-link").removeClass('active');
                                                $.ajax({
                                                    url: "loadPost.jsp",
                                                    data: {cId: catId},
                                                    success: function (data, textStatus, jqXHR) {
                                                        console.log(data);
                                                        $("#ploader").hide();
                                                        $("#p-container").show();
                                                        $("#p-container").html(data);
                                                        $(temp).addClass("active");
                                                    }

                                                })
                                            }
                                            $(document).ready(function (e) {
                                                let allPostRef = $(".c-link")[0]
                                                getPosts(0, allPostRef);
                                            })


                                        </script>
                                        </body>
                                        </html>
