
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Message"%>
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
         <% 
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
       
        <!-- navbar -->
        <%@include file="navbar.jsp" %> 
        
        
        
        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <span class="fa fa-user-plus fa-2x"></span>
                                <h4>Login Here</h4>
                            </div>
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%=m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div>
                            <%
                                session.removeAttribute("msg");
                                }
                            %>
                            
                            
                            
                            
                            
                            <div class="card-body">
                                <!-- form -->
                               <form action="LoginServ" method="post">
                                    <div class="form-floating mb-3">
                     
                                        <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="name@example.com" required >
                                        <label for="exampleInputEmail1">Email address</label>
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-floating mb-3">
                                        
                                        <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                        <label for="exampleInputPassword1">Password</label>
                                        <small id="passHelp" class="form-text text-muted">Please enter a 6 digit Password.</small>
                                    </div>
                                    <div class="form-group form-check mt-2">
                                        <input type="checkbox" name="check" onclick="myFunction()" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Show Password</label>
                                    </div>

                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-primary mt-3">Submit</button>
                                    </div>

                                </form>


                            </div>
                        </div>
                        
                        
                    </div>
                </div>
                
            </div>
        </main>
        
       
        
        
        <!-- java script -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script>
            function myFunction() {
  var x = document.getElementById("exampleInputPassword1");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
    </script>
    
    </body>
</html>
