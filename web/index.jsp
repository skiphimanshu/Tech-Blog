<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>Welcome to TechBlog</title>

        <!-- CSS only -->
        <!-- CSS only -->
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
        
        <!-- navbar -->
        
        <div class="mt-0 p-5 bg-primary text-white primary-background banner-background ">
            <div class="container">
                <h1>Welcome, to TechBlog</h1>
                <p>The next step was the development of the so-called second-generation programming languages (2GL) or assembly languages, which were still closely tied to the instruction set architecture of the specific computer. These served to make the program much more human-readable and relieved the programmer of tedious and error-prone address calculations.</p>
                <p>Very early computers, such as Colossus, were programmed without the help of a stored program, by modifying their circuitry or setting banks of physical controls.</p>
                <a type="button" href="register_page.jsp" class="btn btn-light"><span class="fas fa-arrow-right"></span> Start</a>
                <a type="button" href="login.jsp" class="btn btn-light"><span class="fa fa-sign-in"></span>Login</a>
            </div>    
        </div>
        <br
        <!-- card -->
        <div class="container">
            
            <div class="row mb-2">
                <div class="col-md-4 p-3">
                        
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Core Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>

                </div>
                <div class="col-md-4 p-3">
                        
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Java EE</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                        
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>

                </div>
                

            </div>
             <div class="row">
                <div class="col-md-4">
                        
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">C#</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>

                </div>
                <div class="col-md-4 p-3">
                        
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Data Structure</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>

                </div>
                <div class="col-md-4 p-3">
                        
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">C</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>

                </div>
                

            </div>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        <!-- JavaScript Bundle with Popper -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        
    </body>
</html>
