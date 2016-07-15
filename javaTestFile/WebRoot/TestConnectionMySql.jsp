<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestConnectionMySql.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <labe>测试连接MySQL：</labe>
    <%   
Connection con = null;   
  
Statement stmt = null;   
  
ResultSet rs = null;   
  
try{   
  
Class.forName("com.mysql.jdbc.Driver");   
  
String dbUrl = "jdbc:mysql://localhost:3306/mysqltest?useUnicode=true&characterEncoding=GB2312";   
  
String dbUser = "root";   
  
String dbPwd = "admin";   
  
con = DriverManager.getConnection(dbUrl,dbUser,dbPwd);   
  
out.print("已连接。。。。。");   
}catch(Exception ex)   
{   
  
out.print("连接失败！！<br>"+ex.toString());   
  
}   
  
%>   
  </body>
</html>
