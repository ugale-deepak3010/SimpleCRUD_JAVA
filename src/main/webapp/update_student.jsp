<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,com.deepsoft.jerseyProject.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Anytime Developer Assignment</title>
<link rel="shortcut icon" href="img/diya.png" type="image/x-icon" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta charset="ISO-8859-1">
</head>
<body>



 
    <%
    String officer_id = (String)session.getAttribute("officer_id");
    DeepDbLib dbconn = (DeepDbLib) request.getSession().getAttribute("dbconn");
if (officer_id == null){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "index.jsp");
}
else{ }
    %>
    <%!
        String sn="",s_dob="", s_doj="";
      
    %>
<%
    String student_no_temp=request.getParameter("student_no");
    int student_no=Integer.parseInt(student_no_temp);
    

    try{
              ResultSet rs;

              rs=dbconn.executorSelect("SELECT * from student_db WHERE student_no="+student_no);
              while(rs.next()){
                 sn=rs.getString("student_name");
                 s_dob=rs.getString("student_dob");
                 s_doj=rs.getString("student_doj");
                 //student_no=rs.getInt("student_no");
              }
    }catch(Exception e){
              out.print("errror"+e);
          }
    
%>


<div class="container">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="./insert.jsp">Add Data</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./student_list.jsp">Student List</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Update Data</a>
  </li>
    <li class="nav-item">
    <a class="nav-link" href="./student_list.jsp">Delete Data</a>
  </li>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="./logout.jsp">Logout</a>
  </li>
</ul>
<center>
<br>
<h2>Update Student Data</h2>
</center>
 
 <form action="action_update.jsp" method="post">
 
 
 <div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student No.</span>
  <input type="text" name="student_no_ip_up"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required value="<% out.print(student_no); %>"  readonly>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student Name</span>
  <input type="text" value="<% out.print(sn); %>" name="student_name_ip_up"  maximum="30"  pattern="^\D*$"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student DOB</span>
  <input type="date" name="student_dob_ip_up" value="<% out.print(s_dob); %>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student DOJ</span>
  <input type="date" name="student_doj_ip_up" value="<% out.print(s_doj); %>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
</div>

<center>
 <button type="submit" class="btn btn-success" >Update Student Data</button>
</center>

</form>




</div>
</body>
</html>