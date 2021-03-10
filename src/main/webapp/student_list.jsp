<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,com.deepsoft.jerseyProject.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Anytime Developer Assignment</title>
<link rel="shortcut icon" href="img/diya.png" type="image/x-icon" />
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link"  href="./insert.jsp">Add Data</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Student List</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Update Data</a>
  </li>
    <li class="nav-item">
    <a class="nav-link" href="#">Delete Data</a>
  </li>
</ul>


    <%
    String officer_id = (String)session.getAttribute("officer_id");
    DeepDbLib dbconn = (DeepDbLib) request.getSession().getAttribute("dbconn");

if (officer_id == null){
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location","index.jsp");
}
else{
}
    %>
    <br>
    <h2 align="center"> Student List</h2>
<table class="table table-striped">
  <thead>
  <tr>
  	<th>#</th>
  	<th> Student No. </th>
  	<th> Student Name </th>
  	<th> Student Date of Birth </th>
  	<th> Student Date of Joining </th>
  	<th> Actions </th>
  </tr>
  </thead>
  
  <tbody>
  <%
          try{

              ResultSet rs;
              int student_no;
              int i=0;
              rs=dbconn.executorSelect("SELECT * from student_db");
              while(rs.next()){
            	  i++;
                out.print("<tr>");
                out.print("<td>"+i+"</td>");
                out.print("<td>"+rs.getInt("student_no")+"</td>");
                student_no=rs.getInt("student_no");
                out.print("<td>"+rs.getString("student_name")+"</td>");
                out.print("<td>"+rs.getString("student_dob")+"</td>");
                out.print("<td>"+rs.getString("student_doj")+"</td>");
                out.print("<td><div class='btn-group-sm'><a href='update_student.jsp?student_no="+student_no+"' class='btn btn-small btn-warning'>Update</a>&nbsp;&nbsp;&nbsp;<a href='delete_student.jsp?student_no="+student_no+"'  class='btn btn-danger'>Delete</a></div></td>");
                out.print("</tr>");
              }
              i=0;
              //out.print(max+1);
          }catch(Exception e){
              out.print("errror"+e);
          }
        %>
  </tbody>
</table>


</body>
</html>