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
  	color: #fff;

}
    .container {
        width: 0 Auto;;
        height: 100%;
        margin: 0 auto;
        padding: 8%;
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
    .login100{
	font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  min-width: 100px;
  height: 30px;
  border-radius: 25px;
  position: relative;
 
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
	.search{
        padding-top: 80px;
        padding-left: 40px;
        border-radius: 0px;
        color: #fff;
}
.login100-form-btn {
  font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;
  margin-left:200px;
  margin-top:10px;
  

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

   <div class="topnav" id="myTopnav">
  <a href="/Hotel_Booking_System/Admenu.jsp" class="active">Home</a>
  <a href="/Hotel_Booking_System/Adhotels.jsp">New</a>
  <a href="/Hotel_Booking_System/Adview.jsp">view</a>
  <a href="#about">About</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<form id="search"  action=NewFile.jsp method="post">
		<div class="search">
<h1>Hotel Details</h1><table>
	<tr><td>
	<label>Hotel Name:</label></td><td>
	<input type="text" name="HotelName" required="required"></td><td>
	
	</div> 
          <div class="login100">
                    
                        <button class="login100-form-btn" >Search</button></div></td></tr></table>
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

</body>
</html>