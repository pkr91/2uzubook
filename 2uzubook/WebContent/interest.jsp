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
<%
request.setCharacterEncoding("UTF-8");
JSONArray jsonArray= (JSONArray) request.getAttribute("JSONArray");
JSONArray keywordArray= (JSONArray) request.getAttribute("KeywordArray");

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
                                <h3>관심분야 & 사진을 추가해주세요</h3> </header>
                        </section>
                        <hr />
                        <footer> </footer>
                    </div>
                    <div class="9u 12u(mobile) important(mobile)" id="content">
                        <article id="main">
                            <header>
                                <h2>관심분야 & 사진을 추가해주세요 </h2>
                                <p>자신의 개발 활동을 기록해서 기업에게 보여주세요! 확실하고 솔직하게 자신을 나타낼 수 있도록 정성스럽게 적어주세요.</p>
                            </header>
                            <h3 class="text-center mb-3">추가된 관심분야</h3>
                            <br>
                            <div class="row">
                            <% for(int i=0;i<jsonArray.size();i++)
								{	
									JSONObject licen=(JSONObject)jsonArray.get(i);
								%>
                            		<div class="4u 12u(mobile)">
                            			<div class="row" id="modal_pop" style="cursor:pointer;">
                            				<div class="5u">
                            					<a class="image fit" id="color_con" onclick="licen_delete(this);">
                            					<img src="images/student/license2.png" alt="" /></a>
                            				</div>
                            				<div class="7u">
                            					<h3 class="text-center" id="delete_name"><%=(String)licen.get("name")%></h3><%=(Date)licen.get("date")%>
                            				</div>
                            			</div>
                            		</div>
								<%
								}
								%>
                                <div class="4u 12u(mobile)">
                                    <div class="row" id="modal_pop" OnClick="location.href='licenseadd'" style="cursor:pointer;">
                                        <div class="5u">
                                            <a class="image fit"><img src="images/student/interest.png" alt="" /></a>
                                        </div>
                                        <div class="7u">
                                            <h3 class="text-center">c언어 </h3> 2017.03.06 </div>
                                    </div>
                                </div>
                                <div class="10u form1">
                                    <h3 class="text-center mb-3">관심분야 추가</h3>
                                    <form action="" method="post">
                                        <input name="mode" type="hidden" value="1">
                                        <div class="form-group">
                                            <label class="control-label" for="license_name">관심분야</label>
                                            <div class="col-md-4">
                                                <select id="keyword" name="license_keyword" class="form-control">
                                                    <%
                                                    for(int i=0;i<keywordArray.size();i++)
                                                    {
                    									JSONObject keyword=(JSONObject)keywordArray.get(i);
                    								%>
                                                        <option value="<%=keyword.get(" id ")%>">
                                                            <%=keyword.get("name")%>
                                                        </option>
                                                        <% 
                                                    }
                                                    %>
                                                </select>
                                            </div>
                                        </div> <div class="form-group">
                                            <label class="col-md-4 control-label" for="Submit"></label>
                                            <div class="col-md-4">
                                                <button onclick="reading_add();" class="btn btn-primary">추가하기</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="interest_add">사진 추가(컨셉 사진)</label>
                                            <div class="filebox bs3-primary preview-image">
                                                <input class="upload-name" value="파일선택" disabled="disabled" style="width: 500px;">
                                                <label for="input_file">업로드</label>
                                                <input type="file" id="input_file" class="upload-hidden"> </div>
                                        </div>
                                            <div class="form-group">
                                            <label class="control-label" for="interest_add">사진 추가(증명 사진)</label>
                                            <div class="filebox bs3-primary preview-image">
                                                <input class="upload-name" value="파일선택" disabled="disabled" style="width: 500px;">
                                                <label for="input_file">업로드</label>
                                                <input type="file" id="input_file" class="upload-hidden"> </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="Submit"></label>
                                            <div class="col-md-4">
                                                <button id="Submit" name="Submit" class="btn btn-primary">저장하기</button>
                                            </div>
                                        </div>
                                    </form>
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
                                <h3>2UZUBOOK 학생과 기업을 이어주는 책</h3> </header>
                            <p>대덕소프트웨마이스터고등학교 34111)대전광역시 유성구 가정북로 76(장동 23-9) 교무실 ☎ : 042-866-8822</p>
                            <ul class="icons">
                                <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                                <li><a href="https://github.com/DSM-HS/StudentCouncil" class="icon fa-github"><span class="label">Twitter</span></a></li>
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
    <script>
        $(document).ready(function () {
            var fileTarget = $('.filebox .upload-hidden');
            fileTarget.on('change', function () {
                if (window.FileReader) {
                    // 파일명 추출
                    var filename = $(this)[0].files[0].name;
                }
                else {
                    // Old IE 파일명 추출
                    var filename = $(this).val().split('/').pop().split('\\').pop();
                };
                $(this).siblings('.upload-name').val(filename);
            });
            //preview image 
            var imgTarget = $('.preview-image .upload-hidden');
            imgTarget.on('change', function () {
                var parent = $(this).parent();
                parent.children('.upload-display').remove();
                if (window.FileReader) {
                    //image 파일만
                    if (!$(this)[0].files[0].type.match(/image\//)) return;
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var src = e.target.result;
                        parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
                else {
                    $(this)[0].select();
                    $(this)[0].blur();
                    var imgSrc = document.selection.createRange().text;
                    parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
                    var img = $(this).siblings('.upload-display').find('img');
                    img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
                }
            });
        });
        function go(){
			var frm=document.getElementById('frm1');
			console.log('hel');
			frm.submit();
		}   
    </script>
    
</body>

</html>