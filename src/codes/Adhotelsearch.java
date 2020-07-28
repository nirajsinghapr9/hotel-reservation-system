package codes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Adhotelsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Adhotelsearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String Hotelname=request.getParameter("HotelName");
		out.println("<table><tr><th>hotelname</th></tr>");
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("select hotelname from hotels where hotelname='"+Hotelname+"'");
			while(rs.next())
			{
				out.println("<tr><td>");
				out.println(rs.getString(1));
				out.println("</td>");
				out.println("</tr>");
				
			}
			
		}catch(Exception p){
			System.out.println(p);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
