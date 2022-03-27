<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1 style="text-align: center">User Management System</h1><br>
        <div class="row" style="text-align: center">
            <div class="col-md-3">
            <h2>Add User</h2>
            <form action="user" method="post">
                <input type="hidden" name="action" value="Save">
                <input type="text" id="email" name="email" required size="20" placeholder="E-mail"><br>
                <input type="text" id="fname" name="fname" required size="20" placeholder="First Name"><br>
                <input type="text" id="lname" name="lname" required size="20" placeholder="Last Name"><br>
                <input type="password" id="password" name="password" required size="20" placeholder="Password"><br><br>
                <select name="roleId">
                    <option value="1">System admin</option>
                    <option value="2">Regular User</option>
                    <option value="3">Company admin</option>                   
                </select><br><br>
                <input class="btn btn-primary" type="submit" name="action" value="Save">
            </form>
        </div>
        <div class="col-md-6">
            <div class="col">
            <table class="table">
            <thead>
                <tr>
                    <th>E-mail</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Active</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.active ? "Y" : "N"}</td>
                        <td>
                            <a href="user?action=edit&email=${user.email}">Edit</a>
                            <a href="user?action=delete&email=${user.email}">Delete</a>
                        </td>
                    </tr>                        
                </c:forEach>
            </tbody>
        </table>
            </div>
        </div>
            <div class="col-md-3">
                <h2>Update User</h2>
                    <form action="user" method="POST">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="email" value="${email}">
                               
                        <input type="text" placeholder="First Name" name="fname" value="${fname}"><br>
                        <input type="text" placeholder="Last Name" name="lname" value="${lname}"><br>
                        <input type="password" placeholder="Password" name="password" value="${password}"><br>
                        
                        <br><select name="role">
                            
                            <option value="system admin">system admin</option>
                            
                            <option value="regular user">regular user</option>
                          
                            <option value="company admin">company admin</option>
                        </select>
                        <br>
                        <br>
                        <button class="btn btn-dark" type ="submit">Edit</button>
                    </form>
            </div>
        </div>
             
    </body>
</html>
