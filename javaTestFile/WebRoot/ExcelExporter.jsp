<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="net.sf.jasperreports.engine.data.JRCsvDataSource" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String reportFileName = application.getRealPath("/reports/CSVDataSource.jasper");
	File reportFile = new File(reportFileName);
	if (!reportFile.exists())
		{return;}
	
	HashMap params = new HashMap();
	params.put("title", "Data Source From CSV Data Source");
	
	String[] columnNames = new String[] { "job_id", "job_desc", "min_lvl",
	"max_lvl" };
	JRCsvDataSource ds = new JRCsvDataSource(JRLoader
	    .getLocationInputStream(request.getRealPath("/reports/CSVDataSource.csv")));
	ds.setRecordDelimiter("\r\n");
	ds.setColumnNames(columnNames);
	
	JasperPrint jasperPrint = 
		JasperFillManager.fillReport(reportFileName, params, ds);
    
	JRXlsExporter exporter = new JRXlsExporter();
	response.reset();
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-disposition","attachment; filename=CsvDataSource.xls");
	exporter.setParameter(JRXlsExporterParameter.IS_AUTO_DETECT_CELL_TYPE, new Boolean(false));
	exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, "GBK");
	exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream());
	exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);
	exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);
	exporter.exportReport();
    out.clear();
    out = pageContext.pushBody();
%>