<%@page language="java"%>
<%@page import="java.sql.*"%>
<html>
<head>
<style>
body{
	background: linear-gradient(45deg, #4158d0, #c850c0);
}
.limiter {
  width: 0 Auto;
  margin: 0 auto;
}

.container-table100 {
  margin-top: 100px;
  background: linear-gradient(45deg, #4158d0, #c850c0);
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  overflow-x: scroll; 
  overflow-y: hidden;
  
}

.wrap-table100 {
  width: 1000px;
  float: left;
}

table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 10px;
  width: 100%;
  height: 50%;
  margin: 0 auto;
  position: relative;

}
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}

table tbody tr {
  height: 50px;
}
table tbody tr:last-child {
  border: 0;
}

.table100-head th{
  font-family: OpenSans-Regular;
  font-size: 18px;
  color: #fff;
  line-height: 1.2;
  font-weight: unset;
}

tbody tr:nth-child(even) {
  background-color: #f5f5f5;
}

tbody tr {
  font-family: OpenSans-Regular;
  font-size: 15px;
  color: #808080;
  line-height: 1.2;
  font-weight: unset;
}

tbody tr:hover {
  color: #555555;
  background-color: #f5f5f5;
  cursor: pointer;
}


</style>
<link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet"
    type="text/css" />
</head>
<body>
<%
	String uname=request.getParameter("username");
	if(session.getAttribute("username")==null)
	{
		response.sendRedirect("/Hotel_Booking_System/Admin.jsp");
	}
%>
<h1 style="text-align: center;
	position: absolute;
  	top: 30px;
  	left: 0;
  	width: 100%;
  	height: 88px;
  	color: white;">Edit Hotel Details</h1>
<form method="post" action=Adupdaterecord>
		<div class="container-table100">
<div class="limiter">
			<div class="wrap-table100">
				<div class="table100">
<table>
<tr><th>Hotel Name</th><th>Location</th><th>Contact</th><th>Email</th>
<th>Single Room</th><th>Double Room</th><th>Deluxe Room</th><th>Single price</th><th>Double Price</th>
<th>Deluxe Price</th><th>Address</th></tr>
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
String query = "select id, hotelname, address1, contact, email, singleroomqty, doubleroomqty,deluxedbleqty,single_room_price,double_room_price,deluxe_room_price,address2 from hotels where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><input type="text" name="name" value="<%=rs.getString(2)%>"></td>
<td><input type="text" name="address" value="<%=rs.getString(3)%>"></td>
<td><input type="tel" name="contact" value="<%=rs.getString(4)%>"></td>
<td><input type="email" name="email" value="<%=rs.getString(5)%>"></td>
<td><input type="number" name="srq" value="<%=rs.getString(6)%>"></td>
<td><input type="number" name="drq" value="<%=rs.getString(7)%>"></td>
<td><input type="number" name="derq" value="<%=rs.getString(8)%>"></td>
<td><input type="number" name="srp" value="<%=rs.getString(9)%>"></td>
<td><input type="number" name="drp" value="<%=rs.getString(10)%>"></td>
<td><input type="number" name="derp" value="<%=rs.getString(11)%>"></td>
<td><input type="text" name="address2" value="<%=rs.getString(12)%>"></td>
<td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
</tr>
<tr>
<td><input type="submit" name="action" value="Update" style="background-color: green;font-weight:bold;color:#ffffff; border-radius: 25px;"></td>
<td><input type="submit" name="action" value="Delete" style="background-color: green;font-weight:bold;color:#ffffff;border-radius: 25px;"></td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</div></div></div></div>
</form>
</body>
</html>