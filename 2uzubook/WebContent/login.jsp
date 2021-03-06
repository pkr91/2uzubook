<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("id");
	String serialKey = (String) session.getAttribute("serialKey");
	System.out.println(id);
%>
<!DOCTYPE HTML>
<html>
<head>
<title>2UZUBOOK DSM</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
</head>
<body class="left-sidebar">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header">
			<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="index.jsp" id="logo">DSM 2UZUBOOK</a>
					</h1>
				</header>
			</div>
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li id="login_status">
						<%
							if (id == null && serialKey==null) {
						%><a href="login.jsp">로그인 / 회원가입</a> <%
							} else {
						%><a href="logoutAction">로그아웃</a> <%
							}
						%>
					</li>
					<li><a href="#">For Student</a>
						<ul>
						<%
							if(id==null){
						%>
						<li><a href="login.jsp">내 레주메 보기</a></li>	
						<li><a href="login.jsp">레주메 내용 관리</a></li>	
						<%
						}else{
						%>
						<li><form action="/2uzubook/myresume" method="post" id="frm1"><a href="#" onClick="go();">내 레주메 보기</a></form></li>	
						<li><a href="myresume_manage.jsp">레주메 내용 관리</a></li>
						<li><form action="/2uzubook/OneInput" method="post" id="oneInput"></form><a href="#" onClick="input_go()">한번에 입력하기</a></li>
						<%} %>
						</ul></li>
					<li><a href="#">For Company</a>
						<ul>
						<%if(serialKey==null){ %>
							<li><a onclick="com_alert();" href="login.jsp">학생찾기</a></li>	
						<%} else{%>
							<li><a href="search.jsp">학생 찾기</a></li>
						<%} %>
						</ul>
					</li>
				</ul>
			</nav>
		</div>

		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row 200%">
					<div class="3u 12u(mobile)" id="sidebar">
						<hr class="first" />
						<section>
							<header>
								<h3>로그인 해주세요</h3>
							</header>
						</section>
						<hr />
					</div>
					<div class="9u 12u(mobile) important(mobile)" id="content">
						<article id="main">
							<header>
								<h2>
									<a href="#">Login</a>
								</h2>
								<p>로그인하시면 2UZUBOOK의 수많은 기능을 모두 사용하실 수 있습니다.</p>
							</header>
							<div class="row">
								<div class="6u 12u(mobile)">
									<h3 class="text-center mb-3">Student</h3>
									<div class="row">
										<div class="8u form1">
											<form id="frm1" action="/2uzubook/loginAction/student"
												method="post">
												<input class="form-control mb-2" type="text"
													placeholder="userName" name="id" id="id" style="height: 52px;">
												<input class="form-control mb-2" type="password"
													placeholder="Password" name="password" id="password"
													style="height: 52px;">
													</form>
											<a href="register.jsp" style="margin-top: 10px;">
												<p style="margin-top: 10px;">Don't have an account?</p>
											</a>
										</div>
										<div class="4u">
											<button class="btn btn-outline-primary mb-2"
												onclick="$('#frm1').submit();"
												style="height: 118px; margin-top: 10px;">Sign in</button>
										</div>
									</div>
								</div>
								<div class="6u 12u(mobile)">
									<h3 class="text-center mb-3">Company</h3>
									<div class="row">
										<div class="8u form2">
											<form id="frm2" action="/2uzubook/loginAction/company" method="post">
												<input class="form-control"
													style="margin-bottom: 63px; height: 52px;" type="text"
													placeholder="Serial" name="serialKey" id="serial">
												
											</form>	
											<a href="register_serial.jsp">
												<p style="margin-top: 10px;">Don't have a Serial?</p>
											</a>
										</div>
										<div class="4u">
											<button class="btn btn-outline-success mb-2" onclick="$('#frm2').submit();"
												style="height: 54px; margin-top: 10px;">Sign in</button>
										</div>
									</div>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>

		</div>

		<!-- Footer -->
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="12u">

						<!-- Contact -->
						<section class="contact">
							<header>
								<h3>2UZUBOOK 학생과 기업을 이어주는 책</h3>
							</header>
							<p>대덕소프트웨마이스터고등학교 34111)대전광역시 유성구 가정북로 76(장동 23-9) 교무실 ☎ :
								042-866-8822</p>
							<ul class="icons">
								<li><a href="https://www.facebook.com/%EB%8C%80%EB%8D%95%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EB%A7%88%EC%9D%B4%EC%8A%A4%ED%84%B0%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90-463920667081098/" class="icon fa-facebook"><span
										class="label">Facebook</span></a></li>
								<li><a href="https://github.com/DSM-HS/StudentCouncil" class="icon fa-github"><span
										class="label">Twitter</span></a></li>
							</ul>
						</section>

						<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; DSM 2UZUBOOK. All rights reserved.</li>
							</ul>
						</div>

					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.dropotron.min.js"></script>
	<script src="js/jquery.scrolly.min.js"></script>
	<script src="js/jquery.onvisible.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/util.js"></script>
	<!--[if lte IE 8]><scri pt src="js/ie/respond.min.js"></script><![endif]-->
	<script src="js/main.js"></script>
	<script>
	 function go(){
			var frm=document.getElementById('frm1');
			console.log('hel');
			frm.submit();
		}
	 function input_go(){
			var frm=$('#oneInput');
			console.log('hel');
			frm.submit();
		}
	
	</script>
</body>
</html>