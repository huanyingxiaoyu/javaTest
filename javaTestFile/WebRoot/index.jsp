<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	.firstTd{
	width:150px;
	}
	.btnStyle{
	height:40px;
	width:200px;
	margin-top:8px;
	margin-left:50px;
	font-Size:18;
	
	}
	</style>
	<script>
    function TestConnection(){
     window.location.href="TestConnectionMySql.jsp";
     }
    function jump(){
     window.location.href="DBTest.jsp";
     }
    function ExpPdf(){
     window.location.href="PDFExporter.jsp";
     }
    function ExpHtml(){
     window.location.href="HTMLExporter.jsp";
     }
    function ExpExcel(){
     window.location.href="ExcelExporter.jsp";
     }
    function JavaBeanDt(){
     window.location.href="BeanData.jsp";
     }
    function ChartReport(){
     window.location.href="ChartReport.jsp";
     }
</script>
  </head>
  
  <body>
  <div>
    <label>This is my JSP page cy .</label>
    </div>
    <div>
    <table>
    <tr>
    <td>    <button name="btnReport" onClick="TestConnection()" class="btnStyle">测试连接数据库</button></td>
    <td>    <button name="btnReport" onClick="ChartReport()" class="btnStyle">图例报表(PDF)</button></td>
    </tr>
    <tr>
    <td>    <button name="btnReport" onClick="jump()" class="btnStyle">连接数据库报表</button><br/></td>
    </tr>
    <tr>
    <td>    <button name="btnReportDemo" onClick="ExpPdf()" class="btnStyle">导出PDF</button></td>
    </tr>
    <tr>
    <td>    <button name="btnReportDemo" onClick="ExpHtml()" class="btnStyle">导出html</button></td>
    </tr>
    <tr>
    <td>    <button name="btnReportDemo" onClick="ExpExcel()" class="btnStyle">导出Excel</button></td>
    </tr>
    <tr>
    <td>    <button name="btnReportDemo" onClick="JavaBeanDt()" class="btnStyle">JavaBean数据源报表</button></td>
    </tr>
    </table>
    </div>
    
    
     
  </body>
</html>
