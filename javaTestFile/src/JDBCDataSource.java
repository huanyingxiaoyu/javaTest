import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

public class JDBCDataSource
{
    /**
     * ȡ�����ݿ�����
     * 
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static Connection getConnection() throws ClassNotFoundException,
            SQLException
    {
    	
        String driver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
        String connectString = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=pubs";
        String user = "sa";
        String password = "sa";

        Class.forName(driver);
        Connection conn = DriverManager.getConnection(connectString, user,
                password);
        return conn;
    }

    /**
     * JDBCDataSource���������
     * 
     * @param args
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static void main(String[] args) throws ClassNotFoundException,
            SQLException
    {
        try
        {
            // (1) ���ر������ģ���ļ�
            JasperDesign jasperDesign = JRXmlLoader.load("JDBC.jrxml");
            // (2) ���뱨��ģ��
            JasperReport jasperReport = JasperCompileManager
                    .compileReport(jasperDesign);
            // (3) ��䱨��

            JasperPrint jasperPrint = JasperFillManager.fillReport(
                    jasperReport, new HashMap(), getConnection());
            // (4) ��������
            JasperExportManager.exportReportToPdfFile(jasperPrint, "JDBC.pdf");
        }
        catch (JRException e)
        {
            e.printStackTrace();
        }
    }
}
