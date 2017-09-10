<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");	
	System.out.println(id);
%>
<!DOCTYPE html>

<head>
<meta charset="utf8">
<link rel="stylesheet" type="text/css" href="../CSS/search.css">
<link rel="stylesheet" type="text/css" href="../CSS/input2.css">

</head>
<body>

	<! Nav >
	<nav id="nav">
		<ul>
			<li class="one"><a href="index.jsp">Home</a></li>
			<li class="one"><a href="index.jsp">Resume</a>
				<ul>
					<li><a href="#">1학년 resume &hellip;</a>
						<ul>
							<li><a href="firstcommon.jsp">공통과</a></li>
						</ul></li>
					<li><a href="#">2학년 resume &hellip;</a>
						<ul>
							<li><a href="secondsoftware.jsp">소프트웨어 개발과</a></li>
							<li><a href="secondembeded.jsp">임베디드 개발과</a></li>
							<li><a href="secondsecurity.jsp">정보보안과</a></li>
						</ul></li>
					<li><a href="#">3학년 resume &hellip;</a>
						<ul>
							<li><a href="thirdsoftware.jsp">소프트웨어 개발과</a></li>
							<li><a href="thirdembeded.jsp">임베디드 개발과</a></li>
							<li><a href="thirdsecurity.jsp">정보보안과</a></li>
						</ul></li>

				</ul></li>

			<li id="login_after"></li>
		</ul>
	</nav>



	<center class="p1 one">원하는 인재를 찾고 싶은가요?</center>
	<center>
		<div class="searchdiv">
			<form action="/2uzubook/searchAction" method="post">
				<input type="text" class="searchbox"
					placeholder="  ex) 3학년, 남자, 보안, java">
				<button type='submit' class="searchicon">
					<img src="../Image/Search/searchicon.png" class="img1">
				</button>
			
		</div>

		<div class="checks">
			<input type="checkbox" id="ex_chk1"> <label for="ex_chk1">1학년</label>
			<input type="checkbox" id="ex_chk2"> <label for="ex_chk2">2학년</label>
			<input type="checkbox" id="ex_chk3"> <label for="ex_chk3">3학년</label>

			<select>
				<option value="서버로 넘길 값">남자</option>
				<option value="서버로 넘길 값">여자</option>
			</select> <select name>
				<option value="서버로 넘길 값">서울</option>
				<option value="서버로 넘길 값">경기</option>
				<option value="서버로 넘길 값">인천</option>
				<option value="서버로 넘길 값">강원</option>
				<option value="서버로 넘길 값">충남</option>
				<option value="서버로 넘길 값">부산</option>
				<option value="서버로 넘길 값">울산</option>
				<option value="서버로 넘길 값">대구</option>
				<option value="서버로 넘길 값">경북</option>
				<option value="서버로 넘길 값">경남</option>
				<option value="서버로 넘길 값">광주</option>
				<option value="서버로 넘길 값">전북</option>
				<option value="서버로 넘길 값">제주</option>
			</select> <select class="language">

				<option value="서버로 넘길 값">PYTHON</option>
				<option value="서버로 넘길 값">JAVA</option>
				<option value="서버로 넘길 값">C</option>
				<option value="서버로 넘길 값">C++</option>
				<option value="서버로 넘길 값">C#</option>
				<option value="서버로 넘길 값">HTML</option>
				<option value="서버로 넘길 값">기타</option>
			</select>
			</form>

		</div>


	</center>

	</div>



	</div>
	<script src="../JS/js/jquery.min.js"></script>
		<script>
			window.onload=function(){
				var tag1  = "<a href=login.jsp>Login</a>";
				var tag2 = "<a href=profile.jsp>MY PAGE</a>";
				var val="<%=id%>";
				if(val=="null")
					{
						$("#login_after").html(tag1);
						
					}
				else
				{
					$("#login_after").html(tag2);
					
				}
				
					
			};
			
			
			</script>
</body>