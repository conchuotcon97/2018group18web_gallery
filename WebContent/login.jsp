<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html P>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log in</title>
<link rel="stylesheet" href="css/createAc.css">

</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="container-box">
		<form action="HandingLogin" method="post">

			<div class="left">
				<h1>Login</h1>
				<input type="text" name="email" placeholder="E-mail" /> <input
					type="password" name="password" placeholder="Password" />


				<p class="bottom">
					<a href="forgot.jsp">Forgot Password ?</a>&nbsp&nbsp&nbsp&nbsp <a
						href="signup.jsp">Create an Account</a>
				</p>
			</div>
		</form>

		<div class="right">
			<span class="loginwith">Login with<br />social network
			</span>
			<button class="social-signin facebook">Login with facebook</button>
			<button class="social-signin twitter">Login with Twitter</button>
			<button class="social-signin google">Login with Google+</button>
		</div>
		<div class="or">OR</div>

	</div>
</body>
</html>