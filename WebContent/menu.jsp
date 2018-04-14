<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/menu.css">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<div class="logo">
			<img src="images/5.png">
		</div>

		<div>
			<%
				
			%>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="#">Browse</a>
					<ul>
						<li><a href="#">Discover </a></li>
						<li><a href="#">PopularPhotos</a></li>
						<li><a href="#">PopularSearches</a></li>
						<li><a href="#">Leaderboard</a></li>
					</ul></li>
				<li><a href="about.jsp">About</a> <li><a href="#">More as</a>
				<ul>
					<li><a href="login.jsp">Login</a></li>
					<li><a href="signin">Sign i</a></li>
					<li><a href="#">Language</a></li>
					<li><a href="faq.jsp">FAQ</a></li>
				</ul>
		
			</ul>
	</div>
</nav>
<script type="text/javascript">
	$(window).on("scroll", function() {
		if ($(window).scrollTop()) {
			$('nav').addClass('black');
		}

		else {
			$('nav').removeClass('black');
		}
	})
</script></
				body>
</html>