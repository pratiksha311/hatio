<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Project Todos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<%-- <h2>Pending</h2>
<table>
<tr>
<c:forEach var="p" items="${project.getTask()}">
<tr>
               <td>task${p.getId()} <input type="checkbox" name="status" 
            value="task" <c:if test="${t.isStatus()=='false'}">checked</c:if>></td> 
</tr>      
</c:forEach>
 </tr> 
</table> --%>
  <h3><i>Pending Task</i></h3>         
  <table class="table table-bordered">
      <tr  style="background-color:#f5f5f5">
       <th>Id</th>
        <th>Task Description</th>
        <th>Status</th>
        <th>Created Date</th>
        <th>Updated Date</th>
        <th>Edit</th>
         <th>Delete</th>
         <th>Pending</th>
      </tr>
      <c:forEach var="t" items="${project.getTask()}">
      <c:if test="${t.status}">
      <tr>
      <td>${t.getId()}</td>
        <td>${t.getDescription()}</td>
        <td>${t.isStatus()}</td>
        <td>${t.getCreatedDate()}</td>
        <td>${t.getLastModifiedDate()}</td>
         <td><button type="button" class="btn btn-success"><a href="updatetask${t.getId()}update${project.getId()}" style="color:white">Update</a></button></td>
        <td><button type="button" class="btn btn-danger"><a href="deletetask${t.getId()}delete${project.getId()}" style="color:white">Delete</a></button></td>
        <td><button type="button" class="btn btn-primary"><a href="closetask${t.getId()}close${project.getId()}" style="color:white">Complete</a></button></td>
      </tr>
      </c:if>
      </c:forEach>
  </table>
  <br>
  <h3><i>Completed Task</i></h3> 
     <table class="table table-bordered">
      <tr  style="background-color:#f5f5f5">
      <th>Task Description</th>
        <th>Task Description</th>
        <th>Status</th>
        <th>Created Date</th>
        <th>Updated Date</th>
        <th>Edit</th>
         <th>Delete</th>
         <th>Closed</th>
      </tr>
      <c:forEach var="t" items="${project.getTask()}">
      <c:if test="${t.status==false}">
      <tr>
        <td>${t.getId()}</td>
        <td>${t.getDescription()}</td>
        <td>${t.isStatus()}</td>
        <td>${t.getCreatedDate()}</td>
        <td>${t.getLastModifiedDate()}</td>
        <td><button type="button" class="btn btn-success"><a href="updatetask${t.getId()}update${project.getId()}" style="color:white">Update</a></button></td>
        <td><button type="button" class="btn btn-danger"><a href="deletetask${t.getId()}delete${project.getId()}" style="color:white">Delete</a></button></td>
        <td><button type="button" class="btn btn-link">completed</button></td>
      </tr>
      </c:if>
      </c:forEach>
  </table>
  <button class="btn btn-primary"><a href="addtask${project.getId()}" style="color:white">Add Task</a></button>
</div>

</body>
</html>