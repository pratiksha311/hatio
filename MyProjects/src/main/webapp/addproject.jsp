<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
   <head>
      <title>Bootstrap - Form Controls</title>
       <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
   </head>
 <body>
        <div class="container">	
   <h2 align="center" style="font-style: italic;">Project Details Form</h2>
        <form:form method="POST"  class="form-horizontal" role="form" align="center"
          action="saveProject" modelAttribute="project">
           <form:hidden path="id"/></td>
                     <div class="row">  
                    <div class="form-group">
                    <div class="col-md-2">
                    <form:label path="title" for="title" class="control-label">Project Title</form:label>  
                    </div>
                     <div class="col-md-10">
                    <form:input path="title" class="form-control" id="title" name="title"
                    placeholder="Enter  Project Title"/>
                    </div>
                    </div>
                    </div>
       
               <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button class="btn btn-primary" type="submit">Submit</button>
      </div>
    </div>
        </form:form>
        </div>
    </body>
    
   
</html>