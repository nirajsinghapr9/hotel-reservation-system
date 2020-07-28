<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	background-color: #9152f8;
	overflow:hidden;	
	margin: 0;
  	font-family: Arial, Helvetica, sans-serif;
}
h1{
	text-align: center;
	position: fixed;
  	top: 30px;
  	left: 0;
  	width: 100%;
  	height: 88px;
}
    .container {
        width: 0 Auto;;
        height: 100%;
        margin: 0 auto;
        padding-top: 80px;
        padding-left: 80px;
        background: #c299ff;
        margin-top: 0 Auto;
        border-radius: 0px;
        color: #fff;
        background: #9152f8;
  

 -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
        
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
  margin: 0 Auto;
  
	}


.login100-form-btn {
  font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;
  margin-left:o auto;
  margin-top:40px;
  

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  min-width: 100px;
  height: 30px;
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
  top: 0;
  left: 0;
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
.login100{
	font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;
  margin-left:o auto;
  margin-top:40px;
  

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  min-width: 100px;
  height: 30px;
  border-radius: 25px;
  position: relative;
  z-index: 1;
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
</style>
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
   
        <form id="regForm"  action=Uploaddetails method="post" enctype='multipart/form-data'>
<div class="container">
<h1>Hotel Details</h1><table>
	<tr><td>
	<label>Hotel Name</label></td><td>
	<input type="text" name="HotelName" required="required"></td><td>
	<label>Single Room:</label></td><td>
	<input type="number" name="sr" required="required"></td><td>
	<label>Double Room:</label></td><td>
	<input type="number" name="dr" required="required"></td></tr><tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr>
	<tr><td>
	<label>Deluxe Room:</label></td><td>
	<input type="number" name="der" required="required"></td><td>
	<label>Single Room Price:</label></td><td>
	<input type="number" name="srp" required="required"></td><td>
	<label>Double Room price</label></td><td>
	<input type="number" name="drp" required="required"></td></tr><tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr>
	<tr><td>
	<label>Deluxe Room Price</label></td><td>
	<input type="number" name="derp" required="required"></td><td>
	<label>City:</label></td><td>
	<input type="text" name="city" required="required"></td><td>
	<label>Address:</label></td><td>
	<input type="text" name="add" required="required"></td></tr><tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr>
	<tr><td>
	<label>Contact:</label></td><td>
	<input type="tel" name="mobile" required="required"></td><td>
	<label>Email:</label></td><td>
	<input type="email" name="email" required="required"></td><td>
	<label>Image upload:</label></td><td>

	<input type="file" name="photo"></td></tr><tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr>
	
	</table>
	</div> 
          <div class="login100">
                    
                        <button class="login100-form-btn" >
							Add
						</button>
						<button class="login100-form-btn" type="reset">
							Reset
						</button></div>
							
						
           
        </form>
    
</body>
</html>