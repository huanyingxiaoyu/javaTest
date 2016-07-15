<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="cy.test.*" %>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.util.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@ page import="net.sf.jasperreports.engine.data.JRBeanArrayDataSource"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String reportFileName = request
			.getRealPath("/reports/BeanReport.jasper");
	File reportFile = new File(reportFileName);
	if (!reportFile.exists()) {
		return;
	}

	HashMap params = new HashMap();
	//params.put("title", "Data Source From CSV Data Source");
	DataBean db = new DataBean();
	DataBean[] dataList = db.GetData();

	JasperPrint jasperPrint = JasperFillManager.fillReport(
			reportFileName, params, new JRBeanArrayDataSource(dataList));

	JRHtmlExporter exporter = new JRHtmlExporter();
	exporter
			.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
	exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, request
			.getContextPath()
			+ "/servlets/image?image=");
	exporter.exportReport();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'BeanData.jsp' starting page</title>

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
		&quot;gThis is my JSP page. 
		<br>
	</body>
</html>
