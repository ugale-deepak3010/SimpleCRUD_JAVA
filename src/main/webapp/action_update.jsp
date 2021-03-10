<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,com.deepsoft.jerseyProject.*" %>
<%
    String officer_id_temp= (String)session.getAttribute("officer_id");
    int officer_id=Integer.parseInt(officer_id_temp);
    DeepDbLib dbconn = (DeepDbLib) request.getSession().getAttribute("dbconn");

    String student_no_ipS=request.getParameter("student_no_ip_up");
   //out.println("HH ="+student_no_ipS);
    int student_no_ip_up=Integer.parseInt(student_no_ipS);
    
    String student_name_ip_up=request.getParameter("student_name_ip_up");
    //java.util.Date student_dob_ip = new java.util.Date();
    
    String student_dob_ip_up=request.getParameter("student_dob_ip_up");
    String student_doj_ip_up=request.getParameter("student_doj_ip_up");



String qry8="UPDATE student_db SET student_name='"+student_name_ip_up+"',student_dob='"+student_dob_ip_up+"',student_doj='"+student_doj_ip_up+"' WHERE student_no="+student_no_ip_up;
dbconn.executorUpdate(qry8);
		//out.println(qry8);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "student_list.jsp");

%>