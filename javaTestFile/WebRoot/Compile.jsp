<%@ page language="java"  contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import="net.sf.jasperreports.engine.JRException" %>
<%@ page import="net.sf.jasperreports.engine.JasperCompileManager" %>
<%
	try
	{
	    JasperCompileManager.compileReportToFile(request.getRealPath("/reports/CSVDataSource.jrxml"));
	    out.print("报表编译成功，已经在<br>"+request.getRealPath("reports")+"目录下生成.jasper文件。");
	}
	catch (JRException e)  
	{
	    out.print("报表编译出错，具体错误信息如下：<br>");
	    out.print(e.getMessage());
	}
%>
<html>
<head>
<title>编译报表</title>
</head>
<body>

</body>
</html>