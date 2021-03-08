<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Project todos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2><i>Project Details</i></h2>         
  <table class="table table-bordered" >
       <tr class="table-danger" style="background-color:#f5f5f5">
       <th>Id</th>
        <th>Project Title</th>
        <th>Created Date</th>
        <th>Updated Date</th>
        <th>view</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
      <c:forEach var="p" items="${project}">
      <tr>
        <td>${p.getId()}</td>
        <td>${p.getTitle()}</td>
        <td>${p.getCreatedDate()}</td>
        <td>${p.getLastModifiedDate()}</td>
        <td><button type="button" class="btn btn-primary"><a href="viewtask${p.getId()}" style="color:white">View task</a></button></td>
        <td><button type="button" class="btn btn-success"><a href="updateproject${p.getId()}" style="color:white">Update</a></button></td>
        <td><button type="button" class="btn btn-danger"><a href="deleteproject${p.getId()}" style="color:white">Delete</a></button></td>
      </tr>
      </c:forEach>
  </table>
  <button class="btn btn-primary"><a href="addproject" style="color:white">Add Project</a></button>
</div>

</body>
</html>