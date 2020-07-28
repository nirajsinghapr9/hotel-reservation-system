package codes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("username");
		String mobile=request.getParameter("mobile");
		String pass=request.getParameter("pass");
		System.out.println(pass);
		PrintWriter pw=response.getWriter();
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
				Statement st=conn.createStatement();
				/*String query=("insert into users (username, password, mobile) values(?,?,?)");*/
				String strQuery = "SELECT COUNT(*) FROM users where username='"+email+"'";
				ResultSet rs = st.executeQuery(strQuery);
				rs.next();
				String Countrow = rs.getString(1);
				
				if(Countrow.equals("0")){
				st.executeUpdate("insert into users(username,password,mobile)values('"+email+"','"+pass+"','"+mobile+"')");
				
			 HttpSession session = request.getSession(); session.setAttribute("username",
			 request.getParameter("username")); response.setContentType("text/html");
			  
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert('Registration completed');"); pw.println("</script>");
			  
			 RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			 rd.include(request, response);
			}else			
				 pw.println("<script type=\"text/javascript\">");
				 pw.println("alert('User is already registered with same email address');"); pw.println("</script>");
				  
				 RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
				 rd.include(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
	}
}
