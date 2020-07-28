<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	background: linear-gradient(45deg, #4158d0, #c850c0);
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

.custom-select, .date {
	position: relative;
	font-family: Candara;
	margin-top: 10px;
	margin-left: 200px;
	display: inline-block;
}

.custom-select select {
	display: none; /*hide original SELECT element:*/
}

.select-selected {
	background-color: DodgerBlue;
}

/*style the arrow inside the select element:*/
.select-selected:after {
	position: absolute;
	content: "";
	top: 14px;
	right: 10px;
	width: 0;
	height: 0;
	border: 6px solid transparent;
	border-color: #fff transparent transparent transparent;
}

/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
	border-color: transparent transparent #fff transparent;
	top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div, .select-selected {
	color: #ffffff;
	padding: 8px 16px;
	border: 1px solid transparent;
	border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
	cursor: pointer;
	user-select: none;
}

/*style items (options):*/
.select-items {
	position: absolute;
	background-color: DodgerBlue;
	top: 100%;
	left: 0;
	right: 0;
	z-index: 99;
}

/*hide the items when the select box is closed:*/
.select-hide {
	display: none;
}

.select-items div:hover, .same-as-selected {
	background-color: rgba(0, 0, 0, 0.1);
}

.date {
	margin-left: 10px;
	font-family: candara;
	color: white;
}

[type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}

[type="date"]::-webkit-inner-spin-button {
	display: none;
}

[type="date"]::-webkit-calendar-picker-indicator {
	opacity: 0;
}

input {
	border: 1px solid #c4c4c4;
	border-radius: 5px;
	background-color: #fff;
	padding: 3px 5px;
	box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1);
	width: 190px;
}
#form {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#form td, #form th {
  border: 1px solid #ddd;
  padding: 1px;
}
#form td {
	color: black;
}
 #form th {
 	color: White;
 }

#form tr:nth-child(even){background-color: #d6dbf5;}
#form tr:nth-child(odd){background-color: #d6dbf5;}
#form tr:hover {background-color: #ebedfa;}

#form th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #4158d0;
  color: white;
}
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="topnav" id="myTopnav">
		<a href="/Hotel_Booking_System/Uprofile.jsp"><i
			class="material-icons">&#xe8a6;</i></a> <a href="javascript:void(0);"
			class="icon" onclick="myFunction()"> <i class="fa fa-bars"></i>
		</a>
	</div>
	<form name=search action=hotels.jsp method="post">
		<div class="custom-select" style="width: 200px;">
			<select id="1" name="location">
				<option value="0">Select Location:</option>
				<option value="Bangalore">Bangalore</option>
				<option value="2">Delhi</option>
				<option value="3">Pune</option>
				<option value="4">Jamshedpur</option>
				<option value="5">Ranchi</option>
				<option value="6">Gujrat</option>
				<option value="7">Lucknow</option>
				<option value="8">Chennai</option>
				<option value="9">Mysuru</option>
				<option value="10">Patna</option>
				<option value="11">Assan</option>
				<option value="12">Sikiim</option>
			</select>

		</div>
		&nbsp;&nbsp;&nbsp;
		<div class="date">
			<label for="male">From:</label>&nbsp;&nbsp;&nbsp; <input type="date"
				id="2" name="from">&nbsp;&nbsp;&nbsp; To:&nbsp;&nbsp;&nbsp;
			<input type="date" id="3" name="to">&nbsp;&nbsp;&nbsp; <input
				type="submit" id="4" name="submit" Value="Search">
		</div>
	</form>
	<script>
		var x, i, j, selElmnt, a, b, c;
		/*look for any elements with the class "custom-select":*/
		x = document.getElementsByClassName("custom-select");
		for (i = 0; i < x.length; i++) {
			selElmnt = x[i].getElementsByTagName("select")[0];
			/*for each element, create a new DIV that will act as the selected item:*/
			a = document.createElement("DIV");
			a.setAttribute("class", "select-selected");
			a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
			x[i].appendChild(a);
			/*for each element, create a new DIV that will contain the option list:*/
			b = document.createElement("DIV");
			b.setAttribute("class", "select-items select-hide");
			for (j = 1; j < selElmnt.length; j++) {
				/*for each option in the original select element,
				create a new DIV that will act as an option item:*/
				c = document.createElement("DIV");
				c.innerHTML = selElmnt.options[j].innerHTML;
				c
						.addEventListener(
								"click",
								function(e) {
									/*when an item is clicked, update the original select box,
									and the selected item:*/
									var y, i, k, s, h;
									s = this.parentNode.parentNode
											.getElementsByTagName("select")[0];
									h = this.parentNode.previousSibling;
									for (i = 0; i < s.length; i++) {
										if (s.options[i].innerHTML == this.innerHTML) {
											s.selectedIndex = i;
											h.innerHTML = this.innerHTML;
											y = this.parentNode
													.getElementsByClassName("same-as-selected");
											for (k = 0; k < y.length; k++) {
												y[k].removeAttribute("class");
											}
											this.setAttribute("class",
													"same-as-selected");
											break;
										}
									}
									h.click();
								});
				b.appendChild(c);
			}
			x[i].appendChild(b);
			a.addEventListener("click", function(e) {
				/*when the select box is clicked, close any other select boxes,
				and open/close the current select box:*/
				e.stopPropagation();
				closeAllSelect(this);
				this.nextSibling.classList.toggle("select-hide");
				this.classList.toggle("select-arrow-active");
			});
		}
		function closeAllSelect(elmnt) {
			/*a function that will close all select boxes in the document,
			except the current select box:*/
			var x, y, i, arrNo = [];
			x = document.getElementsByClassName("select-items");
			y = document.getElementsByClassName("select-selected");
			for (i = 0; i < y.length; i++) {
				if (elmnt == y[i]) {
					arrNo.push(i)
				} else {
					y[i].classList.remove("select-arrow-active");
				}
			}
			for (i = 0; i < x.length; i++) {
				if (arrNo.indexOf(i)) {
					x[i].classList.add("select-hide");
				}
			}
		}
		/*if the user clicks anywhere outside the select box,
		 then close all select boxes:*/
		document.addEventListener("click", closeAllSelect);
	</script>


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
	<%
		String place = request.getParameter("location");
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Blob image = null;
		byte[] imgData = null;
	%>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
	
<table class="col-md-10" id=form style="margin-top:30px; margin-left:100px;">
<tr>
<th align="center"><b>Hotel Name</b></th>
<th align="center"><b>Location</b></th>
<th align="center"><b>Address</b></th>
<th align="center"><b>contact</b></th>
<th align="center"><b>Photo</b></th>
</tr>
<%
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager
					.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS;user=sa;password=welcome@123");
			String location = request.getParameter("location");
			statement = connection.createStatement();
			String sql = "select hotelname, address1, address2, contact, img from hotels where address1 like'%"
					+ location + "%'";

			resultSet = statement.executeQuery(sql);
while (resultSet.next()) {


				out.println("<td>" + resultSet.getString(1) + "</td>");
				out.println("<td>" + resultSet.getString(2) + "</td>");
				out.println("<td>" + resultSet.getString(3) + "</td>");
				out.println("<td>" + resultSet.getString(4) + "</td>"); 
				
				image = resultSet.getBlob(5);

				InputStream inputStream = image.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				inputStream.close();
				outputStream.close();

				

				out.println("	<td style='width:50px; height:50px;'><img src=\"data:image/jpg;base64," + base64Image + "\" width=\"150\" height=\"150\"/></td></tr>");
 		
			}
		} finally {

		}
%>	
</body>
</html>