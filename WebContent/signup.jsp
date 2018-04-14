<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/createAc.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="container-box">
		<div class="left">
			<form action="HandingRegister" method="post">
				<h1>Sign up</h1>
				<input type="text" name="username" placeholder="Username" />
				<%
					if (request.getAttribute("user_err") != null) {
						out.print("<font color=\"red\">" + (String) request.getAttribute("user_err") + "</color>");
					}
				%>
				<input type="text" name="email" placeholder="E-mail" />
				<%
					if (request.getAttribute("email_err") != null) {
						out.print("<font color=\"red\">" + (String) request.getAttribute("email_err") + "</color>");
					}
				%>
				<input type="password" name="password" placeholder="Password"
					required /> <input type="password" name="password2"
					placeholder="Retype password" required />
				<%
					if (request.getAttribute("pass_err1") != null) {
						out.print("<font color = \" red\">" + (String) request.getAttribute("pass_err1") + "</color>");
					}
				%>
				<br> <input type="checkbox"> I accept all terms <input
					type="submit" name="signup_submit" value="Sign me up" />
			</form>
		</div>
		<div class="right">
			<span class="loginwith">Sign in with<br />social network
			</span>
			<button class="social-signin facebook">Log in with facebook</button>
			<button class="social-signin twitter">Log in with Twitter</button>
			<button class="social-signin google">Log in with Google+</button>
		</div>
		<div class="or">OR</div>
</body>
</html>