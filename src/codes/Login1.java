package codes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("username");
		String password=request.getParameter("password");

				try {
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
					String query=("select * from users where username=? and password=?");		
					PreparedStatement psm=conn.prepareStatement(query);
					psm.setString(1, uname);
					psm.setString(2, password);
					ResultSet rs=psm.executeQuery();
					if(rs.next()) {	
						HttpSession session = request.getSession();
						session.setAttribute("username", request.getParameter("username"));
						response.sendRedirect("Index.jsp");
						
					}else {
						 
		                    request.setAttribute("errorMessage", "Invalid user or password");
		                    RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
		                    rd.forward(request, response);
				/* response.sendRedirect("Login.jsp"); */
						
					}
					
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			}
				}

	
