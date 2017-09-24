<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	JSONObject jsonObject= (JSONObject) request.getAttribute("JSONObject");
	JSONArray licenses=(jSONArray)jsonObject.get("licenses");
	JSONArray awards=(jSONArray)jsonObject.get("awards");
	JSONArray contests=(jSONArray)jsonObject.get("contests");
	JSONArray projects=(jSONArray)jsonObject.get("projects");
	System.out.println(jsonObject);//log
	String name=(String)jsonObject.get("name");
	String major=(String)jsonObject.get("major");
	int student_id=(Integer)jsonObject.get("student_id");
	String gender=(String)jsonObject.get("gender");
	String email=(String)jsonObject.get("email");
	
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
                    <h1><a href="index.html" id="logo">DSM 2UZUBOOK</a></h1> </header>
            </div>
            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="login.html">로그인 / 회원가입</a></li>
                    <li> <a href="#">For Student</a>
                        <ul>
                            <li><a href="myresume.html">내 레주메 보기</a></li>
                            <li><a href="myresume_manage.html">레주메 내용 관리</a></li>
                        </ul>
                    </li>
                    <li> <a href="#">For Company</a>
                        <ul>
                            <li><a href="search.html">학생 찾기</a></li>
                            <li><a href="right-sidebar.html">시리얼 관리</a></li>
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
                        <section>
                            <header>
                                <h3><a href="#">"세상과 소통하는 게임 개발자"</a></h3> </header>
                            <p> <strong>관심 분야</strong>
                                <br> 게임 개발, C++, 언리얼엔진 </p>
                               <%for(int i=0;i<licenses.size();i++)
                                {
                            	   JSONObject licen=(JSONObject)licenses.get(i);
                                %>
                            <div class="row 50%">
                                <div class="4u">
                                    <a class="image fit"><img src="images/student/license.png" alt="" /></a>
                                </div>
                                <div class="8u">
                                    <h4><%=(String)licen.get("licencseName") %></h4>
                                    <p><%=(String)licen.get("licenseDate") %> </p>
                                </div>
                            </div>
                            <%} %>
                            <br>
                            <p> <strong><h3>Awards</h3></strong></p>
                            <%for(int i=0;i<awards.size();i++){
                            	JSONObject awd=(JSONObject)awards.get(i);
                            	%>
                            
                            <div class="row 50%">
                                <div class="4u">
                                    <a class="image fit"><img src="images/student/trophy.png" alt="" /></a>
                                </div>
                                <div class="8u">
                                    <h4><%=awd.get("awardName") %> <br><strong><%=awd.get("award") %></strong></h4>
                                    <p> <%=awd.get("awardDate") %> </p>
                                </div>
                            </div>
                            <%} %>
                 
                            <footer> <a href="onesee.html" class="button">한눈에 보기</a> </footer>
                        </section>
                    </div>
                    <div class="9u 12u(mobile) important(mobile)" id="content">
                        <article id="main">
                            <header>
                                <h2><strong><%=name %></strong></h2>
                                <h3><%=major %>- <%=student_id%></h3>
                                <p> </p>
                            </header>
                            <a href="#" class="image featured"><img src="images/debate3.jpg" alt="" /></a>
                            <header>
                                <h3>대회 공모전 참여 경력</h3> </header>
                            <p> 
                            <%for(int i=0;i<contests.size();i++)
                            {
                            	JSONObject contest=(JSONObject)contests.get(i);
                            
                            	%>
                            <strong>⦁<%=contest.get("contestName") %> (<%=contest.get("contestDate") %>)</strong>
                                <br> - 의견충돌을 줄이기 위한 토론앱 개발 
                                <br>
                                <%} %>
                              </article>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <article class="4u 12u(mobile) special">
                        <a href="#" class="image featured"> <img src="images/cording.jpg" alt="" /> </a>
                        <header>
                            <h3><a href="#">프로젝트</a></h3> </header>
                        <p> c++를 통한 다수의 게임 프로젝트 진행 및 개발하였습니다. 처음에는 쉬운 게임만 개발하였지만 이제는 진짜로 게임같은 게임을 개발을 하고 있습니다. 깃에 들어가 제 프로젝트를 구경하세요!
                            <br>
                            <a href="https://github.com/yjh5424"> <strong>https://github.com/yjh5424</strong> </a>
                        </p>
                    </article>
                    <article class="4u 12u(mobile) special">
                        <a href="#" class="image featured"><img src="images/club.jpg" alt="" style="height: 100%; width:100%;" /></a>
                        <header>
                            <h3><a href="#">동아리 활동</a></h3> </header>
                        <p> 대덕 sw 마이스터고등학교 최고의 게임 동아리 "Tricks"에서 2년동안 부장을 맡아왔습니다. 우리 동아리는 c++를 이용한 게임 개발을 1년에 3개를 목표로 하며 여러 공모전을 나가고 있습니다. </p>
                    </article>
                    <article class="4u 12u(mobile) special">
                        <a href="#" class="image featured"><img src="images/hobby.jpg" alt="" /></a>
                        <header>
                            <h3><a href="#">봉사 & 독서</a></h3> </header>
                        <p> 평소에 책을 즐겨 읽습니다. 가장 좋아하고 추천하고 싶은 책은 데미안. 감명깊게 읽고 삶의 교훈이 많은 책 입니다. 봉사 활동도 꾸준히 하여 150시간을 채웠습니다.</p>
                    </article>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <div id="footer">
            <div class="row">
                <div class="12u">
                    <!-- Contact -->
                    <section class="contact">
                        <header>
                            <h3>저와 함께 개발을 하고 싶거나 궁금한 사항이 있으면 연락주세요</h3> </header>
                        <p>pkrjd926@gmail.com</p>
                        <ul class="icons">
                            <li><a href="https://www.facebook.com" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="https://github.com/yjh5424" class="icon fa-github"><span class="label">Github</span></a></li>
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
    <!--[if lte IE 8]><script src="js/ie/respond.min.js"></script><![endif]-->
    <script src="js/main.js"></script>
</body>

</html>