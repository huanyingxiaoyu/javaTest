<%@ page language="java"  contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>

<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="net.sf.jasperreports.j2ee.servlets.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.engine.data.JRCsvDataSource" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="net.sf.jasperreports.engine.JRException" %>
<%
   //Ìî³ä±¨±í
   //System.out.println("");
	//String reportFileName = request.getRealPath("/reports/CSVDataSource.jasper");
	String reportFileName = this.getServletContext().getRealPath("/reports/CSVDataSource.jasper");
	String dataName = this.getServletContext().getRealPath("/reports/CSVDataSource.csv");
	File reportFile = new File(reportFileName);
    if (!reportFile.exists())
		{
		return;
		//throw new JRRuntimeException("false");
		}

    HashMap<String,String> params = new HashMap<String,String>();
    params.put("title", "Data Source From CSV Data Source");
	
	String[] columnNames = new String[] { "job_id", "job_desc", "min_lvl","max_lvl" };
	JRCsvDataSource ds = new JRCsvDataSource(JRLoader.getLocationInputStream(dataName));
	ds.setRecordDelimiter("\r\n");
	ds.setColumnNames(columnNames);

	JasperPrint jasperPrint = JasperFillManager.fillReport(reportFileName, params, ds);
%>