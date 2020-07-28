package codes;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig
public class Uploaddetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String hotelName = request.getParameter("HotelName");
	        String SingleRoom = request.getParameter("sr");
	        String DoubleRoom = request.getParameter("dr");
	        String DeluxeRoom = request.getParameter("der");
	        String SingleRoomP = request.getParameter("srp");
	        String DoubleRoomP = request.getParameter("drp");
	        String DeluxeRoomP = request.getParameter("derp");
	        String City = request.getParameter("city");
	        String Address = request.getParameter("add");
	        String Contact = request.getParameter("mobile");
	        String Email = request.getParameter("email");
	
	        InputStream inputStream = null; // input stream of the upload file
	        PrintWriter pw=response.getWriter();
	        // obtains the upload file part in this multipart request
	        javax.servlet.http.Part filePart = request.getPart("photo");
	        System.out.println(filePart);
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
	         
	        String message = null;  // message will be sent back to client
	         
	        try {
	            // connects to the database
	        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
	 
	            // constructs SQL statement
	            String sql = "INSERT INTO hotels (hotelname, singleroomqty,doubleroomqty,deluxedbleqty, single_room_price,double_room_price,deluxe_room_price, address1,address2,contact,email, img) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, hotelName);
	            statement.setString(2, SingleRoom );
	            statement.setString(3, DoubleRoom  );
	            statement.setString(4, DeluxeRoom  );
	            statement.setString(5, SingleRoomP  );
	            statement.setString(6, DoubleRoomP  );
	            statement.setString(7, DeluxeRoomP   );
	            statement.setString(8, City   );
	            statement.setString(9, Address   );
	            statement.setString(10, Contact   );
	            statement.setString(11, Email    );
	             
	            if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                statement.setBinaryStream(12, inputStream);
	            }
	 
	            // sends the statement to the database server
	            
	            int row = statement.executeUpdate();
	            
	            if (row > 0) {
	            	response.setContentType("text/html");
		            pw.println("<script type=\"text/javascript\">");
		   			 pw.println("alert('Registration completed');"); pw.println("</script>");
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } 
	        response.setContentType("text/html");
	        pw.println("<script type=\"text/javascript\">");
  			 pw.println("alert('Registration completed');"); pw.println("</script>");
	            
	            getServletContext().getRequestDispatcher("/Adhotels.jsp").forward(request, response);
	        }
	}


