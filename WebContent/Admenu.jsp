<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html><head>

<style>

.login100-form-btn {
  font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;
  margin-left:6px;
  margin-top:6px;

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  min-width: 100px;
  height: 25px;
  border-radius: 25px;

  background: #9152f8;
  background: -webkit-linear-gradient(bottom, #7579ff, #b224ef);
  background: -o-linear-gradient(bottom, #7579ff, #b224ef);
  background: -moz-linear-gradient(bottom, #7579ff, #b224ef);
  background: linear-gradient(bottom, #7579ff, #b224ef);
  position: relative;
  z-index: 1;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn::before {
  content: "";
  display: block;
  position: absolute;
  z-index: -1;
  width: 100%;
  height: 100%;
  border-radius: 25px;
  background-color: #fff;
  opacity: 1;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn:hover {
  color: #fff;
}

.login100-form-btn:hover:before {
  opacity: 0;
}

   input {
  border: 1px solid #c4c4c4;
  border-radius: 5px;
  background-color: #fff;
  padding: 3px 5px;
  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
  width: 190px;
  margin: 0 Auto;

}
label{
  padding: 3px 5px;
  width: 190px;
  font-family: candara;
  font-style: bold;
  margin-left: 30px;
  color: black;
}
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a { 
    float: none;
    display: block;
    text-align: left;
  }
}

.search{
        padding-top: 80px;
        
}
body{
	margin: 0;
  	font-family: Arial, Helvetica, sans-serif;
  	overflow-x: hidden; 
    overflow-y: scroll;
}

.limiter {
  width: 0 Auto;
  margin: 0 auto;
}

.container-table100 {
  width: 100%;
  margin-right: 30px;
  background: linear-gradient(45deg, #4158d0, #c850c0);
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  overflow-x: scroll; 
  overflow-y: scroll;
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
  margin: 0 auto;
  position: relative;
  overflow-x:scroll;
  overflow-y:scroll;
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

  <div class="topnav" id="myTopnav">
<a href="/Hotel_Booking_System/Adhome.jsp" >Home</a>
  <a href="/Hotel_Booking_System/Adhotels.jsp">New</a>
  <a href="/Hotel_Booking_System/Admenu.jsp">view</a>
  <a href="#about">About</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<%

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<form id="search"  action=Admenu.jsp method="post">
	
	<div style="text-align: center;background: linear-gradient(45deg, #4158d0, #c850c0);"><h4 style="margin: 0px; color: White; font-family: Concert One; font-size: 30">Hotel Details</h4></div>
		<div class = "col-md-12" style="background: linear-gradient(45deg, #4158d0, #c850c0);padding-top: 6vh">
	<div class = "row" >
	
	<div class="col-md-8" style="text-align: center"><label style="text-align: center; color: White; font-family: Concert One" >Hotel Name:</label><input type="text" name="HotelName" required="required"></div>
	
	<div class="col-md-4" style="text-align: right;">
       <button class="login100-form-btn" >Search</button></div>
     
	</div> 	
	</div>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
	
<table class="col-md-10" id=form>
<tr bgcolor="#a6a6a6">
<td align="center"><b>id</b></td>
<td align="center"><b>Hotel Name</b></td>
<td align="center"><b>Location</b></td>
<td align="center"><b>contact</b></td>
<td align="center"><b>Email</b></td>
<td align="center"><b>Action</b></td>
</tr>
<%
try{ 
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
String Hotelname=request.getParameter("HotelName");
statement=connection.createStatement();
String sql ="select id, hotelname, address1, contact, email from hotels where hotelname like'%"+Hotelname+"%'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tr>

<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><%=resultSet.getString(4) %></td>
<td><%=resultSet.getString(5) %></td>
<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;width:60px;" onclick="AdeditRecord(<%=resultSet.getString(1)%>);" >
<input type="button" name="Delete" value="Delete" style="background-color:green;font-weight:bold;color:white;width:60px;" onclick="AddeleteRecord(<%=resultSet.getString(1)%>);" ></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
			</div>
		</div>
	</div>
</form>

<script>
		function myFunction() {
 		 var x = document.getElementById("myTopnav");
 		 if (x.className === "topnav") {
  		  x.className += " responsive";
  } else {
   		 x.className = "topnav";
  }
}
</script>
<script>
function AdeditRecord(id){
    var f=document.getElementById("search");
    f.action='AdeditRecord.jsp?id='+id;
    f.method='post';
    f.submit();
}
</script>
<script>
function AddeleteRecord(id){
    var f=document.getElementById("search");
    f.action='AdeditRecord.jsp?id='+id;
    f.method='post';
    f.submit();
}
</script>
</body>
</html>