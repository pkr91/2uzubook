<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ page import="org.json.simple.*"%>
        <%@ page import="java.util.*"%>
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
                                    <li><a href="logoutAction">로그아웃</a></li>
                                    <li> <a href="#">For Student</a>
                                        <ul>
                                            <li>
                                                <form action="/2uzubook/myresume" method="post" id="frm1"><a href="#" onClick="go();">내 레주메 보기</a></form>
                                            </li>
                                            <li><a href="myresume_manage.html">레주메 내용 관리</a></li>
                                        </ul>
                                    </li>
                                    <li> <a href="#">For Company</a>
                                        <ul>
                                            <li><a href="search.html">학생 찾기</a></li>
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
                                                <h3>봉사활동 추가</h3> </header>
                                        </section>
                                        <hr /> </div>
                                    <div class="9u 12u(mobile) important(mobile)" id="content">
                                        <article id="main">
                                            <header>
                                                <h2>봉사활동을 추가해주세요 </h2>
                                                <p>자신의 개발 활동을 기록해서 기업에게 보여주세요! 확실하고 솔직하게 자신을 나타낼 수 있도록 정성스럽게 적어주세요.</p>
                                            </header>
                                            <h3 class="text-center mb-3">추가된 봉사활동</h3>
                                            <br>
                                            <div id="volunteer_loc" class="row">
                                                <% for(int i=0;i<jsonArray.size();i++)
								{	
									JSONObject award=(JSONObject)jsonArray.get(i);
								%>
                                                    <div class="4u 12u(mobile)">
                                                        <div class="row" id="modal_pop" style="cursor:pointer;">
                                                            <div class="5u">
                                                                <a class="image fit" onclick="volunteer_delete(this);"> <img src="images/student/etc.png" alt="" /></a>
                                                            </div>
                                                            <div class="7u">
                                                                <h3 class="text-center" id="delete_name"><%=award.get("name")%></h3>
                                                                <%=(Date)award.get("startdate")%>~
                                                                    <%=(Date)award.get("enddate")%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% 
								}
								%>
                                            </div>
                                            <br>
                                            <script></script>
                                            <div class="row" id="license_loc">
                                                <div class="10u form1">
                                                    <h3 class="text-center mb-3">봉사활동 추가</h3>
                                                    <form action="" method="post">
                                                        <input name="mode" type="hidden" value="1">
                                                        <div class="form-group">
                                                            <label class="control-label" for="volunteer_name">봉사 이름</label>
                                                            <input id="name" name="volunteer_name" placeholder="ex) 중랑천 쓰레기 줍기" type="text" class="form-control" required> </div>
                                                        <div class="form-group">
                                                            <label class="control-label" for="volunteer_cert">봉사 인증 기관</label>
                                                            <input id="ins" name="volunteer_cert" placeholder="ex) 중랑구청" type="text" class="form-control" required> </div>
                                                        <div class="form-group">
                                                            <label class="control-label" for="volunteer_startdate">시작 날짜</label>
                                                            <input id="startdate" name="volunteer_startdate" type="date" class="form-control" required> </div>
                                                        <div class="form-group">
                                                            <label class="control-label" for="volunteer_enddate">종료 날짜</label>
                                                            <input id="enddate" name="volunteer_enddate" type="date" class="form-control" required> </div>
                                                        <div class="form-group">
                                                            <label class="control-label" for="License_keyword">키워드</label>
                                                            <div class="col-md-4">
                                                                <select id="keyword" name="volunteer_keyword" class="form-control">
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
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="Submit"></label>
                                                            <div class="col-md-4">
                                                                <button onclick="volunteer_add();" class="btn btn-primary">추가하기</button>
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
                                                <li><a href="#" class="icon fa-github"><span class="label">Twitter</span></a></li>
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
                        function volunteer_add() {
                            var temp = new Object();
                            var name = $("#name").val();
                            var ins = $("#ins").val();
                            var startdate = $("#startdate").val();
                            var enddate = $("#enddate").val();
                            var keyword = $("#keyword").val();
                            temp.part = "7";
                            temp.name = name;
                            temp.ins = ins;
                            temp.startdate = startdate;
                            temp.enddate = enddate;
                            temp.keyword = keyword;
                            $.ajax({
                                url: '/2uzubook/ResumeAdd'
                                , type: 'post'
                                , data: temp
                                , success: function (data) {
                                    if (data > 0 && data != null && data.length != 0) {
                                        alert("add_success");
                                        //성공처리
                                        var tag_div = '<div class="4u 12u(mobile)"><div class="row" id="modal_pop" style="cursor:pointer;"><div class="5u"><a class="image fit" onclick="volunteer_delete(this);"><img src="images/student/etc.png"\ alt="" /></a></div><div class="7u"><h3 class="text-center" id="delete_name">' + name + '</h3>' + startdate + '~' + enddate + '</div></div></div>';
                                        $("#volunteer_loc").prepend(tag_div);
                                        $("#name").val('');
                                        $("#ins").val('');
                                        $("#startdate").val('');
                                        $("#enddate").val('');
                                        $("#keyword").val('');
                                    }
                                    else {
                                        alert("add_fail");
                                    }
                                }
                                , dataType: 'json'
                            });
                        }

                        function volunteer_delete(obj) {
                            $(obj).parent().parent().parent().css('background-color', 'red');
                            var flag = 0;
                            var delete_name = $(obj).parent().next(".7u").children("#delete_name");
                            var name = $(delete_name).text();
                            console.log(name);
                            if (confirm('삭제 하시겠습니까?')) {
                                flag = 1;
                                volunteer_del(obj, flag, name);
                                return;
                            }
                            else {
                                volunteer_del(obj, flag, name);
                                return;
                            }
                        }

                        function volunteer_del(obj, flag, name) {
                            if (flag == 1) {
                                $(obj).parent().parent().parent().remove();
                                var temp = new Object();
                                temp.name = name;
                                temp.part = "7";
                                $.ajax({
                                    url: '/2uzubook/ResumeRemove'
                                    , type: 'post'
                                    , data: temp
                                    , success: function (data) {
                                        console.log("delete_success");
                                    }
                                    , dataType: 'json'
                                });
                            }
                            else {
                                $(obj).parent().parent().parent().css('background-color', '');
                            }
                        }

                        function go() {
                            var frm = document.getElementById('frm1');
                            console.log('hel');
                            frm.submit();
                        }
                    </script>
                </body>

                </html>