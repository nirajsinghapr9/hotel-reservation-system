package codes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Adupdaterecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ide=request.getParameter("id");
		int num=Integer.parseInt(ide);
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String action=request.getParameter("action");
		if("update".equals(action)) {
		try{
		Connection conn = null;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");	
		conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
		Statement st=null;
		st=conn.createStatement();
		st.executeUpdate("update hotels set hotelname='"+name+"',address1='"+address+"',contact="+contact+",email='"+email+"' where id='"+num+"'");
		response.sendRedirect("/Hotel_Booking_System/Admenu.jsp");
		}
		catch(Exception e){
		System.out.println(e);
		}
	}else if ("Delete".equals(action)) {
		try{
			Connection conn = null;
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");	
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
			Statement st=null;
			st=conn.createStatement();
			st.executeUpdate("delete from hotels where id='"+num+"'");
			response.sendRedirect("/Hotel_Booking_System/Admenu.jsp");
			}
			catch(Exception e){
			System.out.println(e);
			}
	}
		

}
}