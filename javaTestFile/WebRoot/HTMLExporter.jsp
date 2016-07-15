<pre class="html" name="code">
<%@ page contentType="text/html;charset=gb2312"%>

<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.util.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@ page import="net.sf.jasperreports.engine.data.JRCsvDataSource"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<html>
<head>
<title> html Exporter</title>
<script type="text/javascript">
function ExportPdf() {

}
</script>
</head>
<body>
<div>
<button onClick="ExportPdf()"> Exporter pdf</button>
</div>
<div>
<%
	String reportFileName = request
			.getRealPath("/reports/CSVDataSource.jasper");
	File reportFile = new File(reportFileName);
	if (!reportFile.exists()) {
		return;
	}

	HashMap params = new HashMap();
	params.put("title", "Data Source From CSV Data Source");

	String[] columnNames = new String[] { "job_id", "job_desc",
			"min_lvl", "max_lvl" };
	JRCsvDataSource ds = new JRCsvDataSource(JRLoader
			.getLocationInputStream(request
					.getRealPath("/reports/CSVDataSource.csv")));
	ds.setRecordDelimiter("\r\n");
	ds.setColumnNames(columnNames);

	JasperPrint jasperPrint = JasperFillManager.fillReport(
			reportFileName, params, ds);

	JRHtmlExporter exporter = new JRHtmlExporter();
	exporter
			.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
	exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, request
			.getContextPath()
			+ "/servlets/image?image=");
	exporter.exportReport();
%>
</div>
</body>
</html>


