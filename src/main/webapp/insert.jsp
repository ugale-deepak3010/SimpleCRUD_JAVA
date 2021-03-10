<%@page import="java.sql.*,java.util.*,com.deepsoft.jerseyProject.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Courtyard Shelter</title>
<link rel="shortcut icon" href="img/diya.png" type="image/x-icon" />
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Add Data</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./student_list.jsp">Student List</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./student_list.jsp">Update Data</a>
  </li>
    <li class="nav-item">
    <a class="nav-link" href="./student_list.jsp">Delete Data</a>
  </li>
</ul>

<center>
<br>
<h2>Insert Student Data</h2>
</center>
<%
// GIVE STUDENT NUMBER
		int student_highest_no=1;
      String officer_id = (String)session.getAttribute("officer_id");
      DeepDbLib dbconn = (DeepDbLib) request.getSession().getAttribute("dbconn");

if (officer_id == null){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "index.jsp");
}
else{ }

          try{
        
              ResultSet rs;
              int max=0;
              rs=dbconn.executorSelect("SELECT MAX(student_no) from student_db");
              //rs.next();
              //
              while(rs.next()){
                max=rs.getInt(1);  //Very Important
              }
              //out.print(max+1);
              student_highest_no=max+1;

              //out.print(dbconn.errorDisplay());//connections
             // out.print(MyDatabaseLib.connections);//value="<% out.println(student_highest_no);
          }catch(Exception e_insert){
              out.print("errror"+e_insert);
          }finally{
            }
        %>
 
 
 <form action="action_insert.jsp" method="post">
 
 
 <div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student No.</span>
  <input type="text" name="student_no_ip"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required value="<% out.println(student_highest_no);%>"  readonly>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student Name</span>
  <input type="text" name="student_name_ip"  maximum="30" pattern="^\D*$" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student DOB</span>
  <input type="date" name="student_dob_ip" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Student DOJ</span>
  <input type="date" name="student_doj_ip" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
</div>

<center>
 <button type="submit" class="btn btn-success" >Add Student Data</button>
</center>

</form>

</body>
</html>