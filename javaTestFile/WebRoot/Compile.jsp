<%@ page language="java"  contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import="net.sf.jasperreports.engine.JRException" %>
<%@ page import="net.sf.jasperreports.engine.JasperCompileManager" %>
<%
	try
	{
	    JasperCompileManager.compileReportToFile(request.getRealPath("/reports/CSVDataSource.jrxml"));
	    out.print("�������ɹ����Ѿ���<br>"+request.getRealPath("reports")+"Ŀ¼������.jasper�ļ���");
	}
	catch (JRException e)  
	{
	    out.print("�������������������Ϣ���£�<br>");
	    out.print(e.getMessage());
	}
%>
<html>
<head>
<title>���뱨��</title>
</head>
<body>

</body>
</html>