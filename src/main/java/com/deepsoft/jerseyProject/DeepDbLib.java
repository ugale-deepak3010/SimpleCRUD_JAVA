package com.deepsoft.jerseyProject;
import java.sql.*;


public class DeepDbLib {

	   public static int connections=0;
	    public static boolean already_connected=false;
	    Connection cn;
	    Statement stmt;
	    ResultSet rs;
	    public boolean connectionState;
	    /* not necessory to set final */

	/********* credentials *****/
	    String Host="localhost";
	    String Database="javaweb";
	    String User="root";
	    String Port="3306";

	    final String host="jdbc:mysql://localhost:3306/javaweb";   /*"jdbc:postgresql://"+Host+":"+Port+"/"+Database+"?sslmode=require";*/         /*//only postgresql for sslmode require*/
	    final String user="root";
	    final String pwd="";
	/****************************/

	    String errorDisp="";
	    String space="<br>";
	    StringBuilder sb1 = new StringBuilder();
	    
	    public DeepDbLib(){
	        try{

	        //if(already_connected==false){
	        this.connectionState=this.getConnection(this.host,this.user,this.pwd);
	        connections++;
	       // }

	        }catch(Exception e){
	        errorDisp=errorDisp+e.getMessage();
	        }
	    }
	    
	    public boolean getConnection(String host,String user,String pwd){
	        try{
	           Class.forName("com.mysql.jdbc.Driver");
	            //Class.forName("org.postgresql.Driver");
	            this.cn=DriverManager.getConnection(host,user,pwd);
	            this.connectionState=true;
	            this.already_connected=true;
	        }catch(Exception e){
	            this.connectionState=false;
	            //"Check Library Jar file added or Not<br>""<br> Full Error"+e;
	            errorDisp=errorDisp+e.getMessage();
	           
	        }
	        return this.connectionState;
	    }
	    
	    public boolean getConnectionStatus(){
	        return this.connectionState;
	    }
	    
	    public ResultSet executorSelect(String sql){
	        try{
	            this.stmt=this.cn.createStatement();
	            this.rs=this.stmt.executeQuery(sql);
	        }catch(Exception e){
	            errorDisp=errorDisp+e.getMessage();
	        }
	        return this.rs;
	    }
	    
	    public void executorUpdate(String sql){
	        try{
	            this.stmt=this.cn.createStatement();
	            this.stmt.execute(sql);
	        }catch(Exception e){
	            errorDisp=errorDisp+e.getMessage();
	        }
	    }
	    
	    public boolean closeConnection(){
	        try{
	            this.cn.close();
	            if(this.connectionState==true)
	            connections--;  //not need already_connected because.. 
	            this.connectionState=false;
	        }catch(Exception e){
	            this.connectionState=true;
	            errorDisp=errorDisp+e.getMessage();
	        }
	        return this.connectionState;
	    }
	    
	    public String generatePrimaryKey(String tableName,String attrName){
	        String attrVal="";
	        String sql="SELECT MAX ("+attrName+") +1 FROM "+tableName+"";
	        try{
	            this.stmt=this.cn.createStatement();
	            this.rs=this.stmt.executeQuery(sql);
	            while(rs.next()){
	                attrVal=rs.getString(1);
	            }
	        }catch(Exception e){
	            errorDisp=errorDisp+e.getMessage();
	        }
	        return attrVal;
	    }
	    
	    public String errorDisplay(){
	        return this.errorDisp;
	    }

}
