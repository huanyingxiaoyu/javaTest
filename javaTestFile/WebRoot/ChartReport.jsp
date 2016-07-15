<pre class="html" name="code">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@ page import="net.sf.jasperreports.j2ee.servlets.*"%>
<%@ page import="net.sf.jasperreports.engine.util.*"%>
<%@ page import="net.sf.jasperreports.engine.data.JRCsvDataSource"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<%
	//图例报表
	//String reportFileName = request			.getRealPath("/reports/ChartReport.jasper");
	String msg = "Start";
	String reportFileName = this.getServletContext().getRealPath(
			"/reports/ChartReport.jasper");
	File reportFile = new File(reportFileName);
	if (!reportFile.exists()) {
		return;
	}
	String driver = "com.mysql.jdbc.Driver";
	String connectString = "jdbc:mysql://localhost:3306/mysqltest?useUnicode=true&characterEncoding=gbk";//://localhost:1433;DatabaseName=pubs
	String user = "root";
	String password = "admin";
	Connection conn = null;
	try {
		Class.forName(driver);
		msg = msg + "\r\n" + "Driver.";
	} catch (java.lang.ClassNotFoundException e) {
		msg = msg + "\r\n" + "Driver Exception." + e.getMessage();
		System.err.println("Driver Error" + e.getMessage());
	}

	try {
		conn = DriverManager.getConnection(connectString, user,
				password);
		msg = msg + "\r\n" + "Conn init.";
	} catch (Exception e) {
		msg = msg + "\r\n" + "数据库连接错误" + e.getMessage();
		System.err.println("数据库连接错误:" + e.getMessage());
	}
	HashMap<String, String> params = new HashMap<String, String>();

	JasperPrint jasperPrint = JasperFillManager.fillReport(
			reportFileName, params, conn);

	JRPdfExporter exporter = new JRPdfExporter();
	response.reset();
	response.setContentType("application/pdf");
	response.setHeader("Content-disposition",
			"attachment; filename=ChartReport.pdf");
	exporter
			.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter
			.setParameter(JRExporterParameter.CHARACTER_ENCODING, "GBK");
	exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response
			.getOutputStream());
	exporter.exportReport();
	out.clear();
	out = pageContext.pushBody();
	/*JRHtmlExporter exporter = new JRHtmlExporter();
	exporter
			.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
	exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, request
			.getContextPath()
			+ "/servlets/image?image=");
	exporter.exportReport();*/
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'FillReport.jsp' starting page</title>

		

	</head>

	<body>
		This is Report
		<br>


	</body>
</html>
