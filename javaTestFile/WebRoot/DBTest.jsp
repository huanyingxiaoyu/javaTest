<pre class="html" name="code">
<%@ page contentType="text/html;charset=gb2312"%>

<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.util.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@ page import="net.sf.jasperreports.engine.data.JRCsvDataSource"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.sql.*"%>

<%
	/*报表连接数据库，显示数据*/
	String msg = "Start;";
	String reportFileName = request
			.getRealPath("/reports/DBTest.jasper");
	File reportFile = new File(reportFileName);
	if (!reportFile.exists()) {
		msg = msg + "\r\n" + "File not exists.";
		System.err.println("File not exists.");

	}
	//String driver = "org.gjt.mm.mysql.Driver";
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
	HashMap params = new HashMap();
	params.put("UserEnergy", "东莞");

	JasperPrint jasperPrint = JasperFillManager.fillReport(
			reportFileName, params, conn);

	JRHtmlExporter exporter = new JRHtmlExporter();
	exporter
			.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
	exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, request
			.getContextPath()
			+ "/servlets/image?image=");
	exporter.exportReport();
%>
<html>
<head>
		<title>My JSP 'DBTest.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
</head>
<body>
</body>
</html>
