<%@page import="java.sql.*,java.util.*,com.deepsoft.jerseyProject.*"%>
<%
    String student_no_temp=request.getParameter("student_no");
    int student_no=Integer.parseInt(student_no_temp);
    DeepDbLib dbconn = (DeepDbLib) request.getSession().getAttribute("dbconn");

    try{
              dbconn.executorUpdate("DELETE  FROM student_db WHERE student_no="+student_no);
              response.setStatus(response.SC_MOVED_TEMPORARILY);
              response.setHeader("Location", "student_list.jsp");
    }catch(Exception e){
        out.print("Error=="+e);
    }
%>