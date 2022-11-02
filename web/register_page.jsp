<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user =(User) session.getAttribute("currentUser");
    if (user != null) {
            response.sendRedirect("profile.jsp");
    } 

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register Here</title>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 70% 100%, 24% 93%, 0 100%, 0 0);
            }
            
        </style>
    </head>
    <body>
       
        <!-- navbar -->
        <%@include file="navbar.jsp" %>
        
        
        <main class="primary-background  banner-background " style="padding-bottom: 70px;">
            <div class="container">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-user-circle fa-2x"></span>
                            <h4>Register Here</h4>
                        </div>
                        <div class="card-body">

                            <!-- form -->
                            <form action="RegisterServ" method="post" id="form-reg">
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1" >User Name</label>
                                    <input type="text" name="uname" class="form-control" id="username"  placeholder="Enter Name">
                                    
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="umail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="upass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputGender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="g_male" name="gender"value="male">Male
                                    <input type="radio" id="g_fmale" name="gender" value="female">Female
                                </div>
                                <div class="form-group">
                                    <textarea id="id" name="about" rows="5"  class="form-control" placeholder="Enter about yourself"
                                              ></textarea>
                                </div>
                                
                                
                                
                                <div class="form-group form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree term & condition's</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fas fa-sync-alt fa-spin fa-3x"></span>
                                    <h4>Please Wait...</h4>
                                </div>
                                <button type="submit" id="submit-btn" class="btn btn-primary">Signup</button>
                            </form>

                        </div>
                        
                    </div>
                    
                </div>
                 
            </div>
            
        </main>
        
        
        <!-- java script -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
            $(document).ready(function() {
                
                $('#form-reg').on('submit',function (event){
                    event.preventDefault();
                    
                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    $.ajax({
                       url: "RegisterServ",
                       type: 'POST',
                       data: form,
                       success: function (data, textStatus, jqXHR) {
                           
                         $("#submit-btn").show();
                         $("#loader").hide();
                         if (data.trim() === 'done') {
                              swal("Registerd Successfully, Redirect to Login Page")
                            .then((value) => {
                                window.location="login.jsp"
                            });
                         } else {
                             swal(data);
                         }
                         
                         
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                         $("#submit-btn").show();
                         $("#loader").hide();
                         swal("Something went wrong");
                             
                        
                    },
                    processData: false,
                    contentType: false 
                       
                    });
                    
                });
    
            });
        </script>
    </body>
    
</html>
