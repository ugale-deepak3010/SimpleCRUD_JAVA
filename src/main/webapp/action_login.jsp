<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.lang.*,java.util.*,com.deepsoft.jerseyProject.*"%>

<%    
    String officer_id=request.getParameter("officer_id");
    String pass=request.getParameter("password");
    
    DeepDbLib dbconn=new DeepDbLib();
try{
	

ResultSet rs;
String qry="select * from register where officer_id='"+officer_id+"' and password='"+pass+"'";
rs=dbconn.executorSelect(qry);
rs.next();

//out.print("<br>"+qry+"<br>connected="+dbconn.getConnectionStatus()+"<br> Exception='"+dbconn.errorDisplay()+"'");

if(rs.getString("password").equals(pass)&&rs.getString("officer_id").equals(officer_id))
{

    //login
         session.setAttribute("officer_id", officer_id); 
/**************** Object Setting ***********/
         session.setAttribute("dbconn", dbconn);
/*****************************************/
		//out.println("<br><h1>Password is correct </h1>");
         //forwording...
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "insert.jsp");   
}
else
{
//not work because resultset exception creat in if (empty resultset on operation not perform..)
}

} catch(SQLException sqle){
   out.println("<script>alert('Invalid password or username.');</script>");
}catch (Exception e) {
//out.println("error  "+dbconn.errorDisplay());
out.println("<br>Error=="+e+"<br>");
e.printStackTrace();
}finally{
    out.println("<br><h1><a href='index.jsp'>Go Back</a></h1>");
}
%>