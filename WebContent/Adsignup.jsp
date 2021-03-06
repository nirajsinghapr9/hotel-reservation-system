<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	background-color: #f0e6ff;
}
h1{
	
	text-align: center;
}
    .container {
        width: 20%;
        height: 400px;
        margin: 0 auto;
        padding: 20px;
        background: #c299ff;
        margin-top: 100px;
        border-radius: 25px;
        color: #fff;
        background: #9152f8;
  

 -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
        
    }
    .container::before {
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

.container:hover {
  color: #fff;
}

.container:hover:before {
  opacity: 0;
}
   input {
  border: 1px solid #c4c4c4;
  border-radius: 5px;
  background-color: #fff;
  padding: 3px 5px;
  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
  width: 190px;
  margin-left: 32px;
  
}

	label{
  padding: 3px 5px;
  width: 190px;
  font-family: candara;
  font-style: bold;
  margin-left: 32px;
  
	}


.login100-form-btn {
  font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;
  margin-left:83px;
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

</style>
</head>
<body>
<form id="regForm" onsubmit="return myFunction()" action=AdSignup method="post">
<div class="container">
<h1>Login</h1>
<label>Email:</label><p>
<input type="email" name="username"><p>
<label>Mobile:</label><p>
<input type="tel" name="mobile" maxlength="10" size="10"><p>
<label>Password:</label><p>
<input type="password" name="pass" id="pass"><p>
<label>Confirm Password:</label><p>
<input type="password" name="rpass" id="rpass"><p>
<button class="login100-form-btn" >
							Sign Up
						</button>	
</div></form>
 <script>
    function myFunction() {
        var pass1 = document.getElementById("pass").value;
        var pass2 = document.getElementById("rpass").value;
        if (pass1 != pass2) {
           alert("Password & Confirm password must match");
            document.getElementById("pass").style.borderColor = "#E34234";
            document.getElementById("rpass").style.borderColor = "#E34234";
        }
        else {
            document.getElementById("regForm").submit();
        }
    }
</script>
</body>
</html>