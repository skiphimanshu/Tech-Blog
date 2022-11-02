<%@page import="com.tech.blog.entities.User"%>
<%
    
    User user1 =(User) session.getAttribute("currentUser");
    %>
    
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fas fa-code"></span>Tech Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-home"> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#"><i class='far fa-address-card'></i> Contact</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-list-alt"> Category</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Java</a></li>
                                <li><a class="dropdown-item" href="#">Python</a></li>
                                <li><a class="dropdown-item" href="#">Java Script</a></li>
                                <li><a class="dropdown-item" href="#">c#</a></li>
                            </ul>
                        </li>
                        
                         <%
                           if(user1 != null) {
                        %>
                         <li class="nav-item">
                            <a class="nav-link active" href="#!" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fas fa-user-circle"></i> Add Post </a>
                        </li>
                        <%}
                        %>
                        
                        <%
                           if(user1 != null) {
                        %>
                    </ul>
                     <ul class="navbar-nav mr-right">   
                        <li class="nav-item">
                            <a class="nav-link active" href="#!" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profile-modal"><i class="fas fa-user-circle"></i> <%= user1.getName()%> </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active " href="LogoutServ"><i class="fas fa-power-off"></i> Logout</a>
                        </li>
                        </ul>
                        <%
                            }else{
                            %>
                            
                        <li class="nav-item">
                            <a class="nav-link active " href="login.jsp"><span class="fa fa-sign-in"></span> Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active " href="register_page.jsp"><i class="fas fa-user-plus"></i> SignUp</a>
                        </li>
                            
                            <%
                            }
                        %>
                        
                    </ul>
   
                </div>
            </div>
        </nav>
