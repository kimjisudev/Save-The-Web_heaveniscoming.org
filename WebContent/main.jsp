<%@page import="jdbc.PostDTO"%>
<%@page import="jdbc.NewsDTO"%>
<%@page import="jdbc.PostDAO"%>
<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 		<meta name="viewport" content="width=device-width, initial-scale=1">
 -->		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="favicon.ico">
		<title>나라가 임하는 교회</title>
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="css/owl.carousel.css" rel="stylesheet">
		<link href="css/owl.theme.default.min.css"  rel="stylesheet">
		<link href="css/animate.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		
<%@ include file="include/head.jsp"%>
	</head>
	<body id="page-top">
<%@ include file="include/login.jsp"%>
<% 
	NewsDTO recentNews = null; 
	PostDTO recentPost = null;
	String newsPath = "";
	String postPath = "";
	String newsTitle = "";
	String postTitle = "";
	
	if( (recentNews = NewsDAO.select()) == null) {
		newsPath = "images/newsThumb.jpg";
		newsTitle = "업로드된 교회 소식이 없습니다.";
	} else {
		newsPath = recentNews.getNupfolder() +"/"+ recentNews.getNuuid() +"_" + recentNews.getNfilename();
		newsTitle = recentNews.getNtitle();
	}
	if( (recentPost = PostDAO.select()) == null) {
		postPath = "images/postThumb.jpg";
		newsTitle = "업로드된 주보가 없습니다.";
	} else {
		postPath = recentPost.getPupfolder() +"/"+ recentPost.getPuuid() +"_" + recentPost.getPfilename();
		postTitle = recentPost.getPtitle();
	}

%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/header.jsp"%>
<%@ include file="include/sectionWelcome.jsp"%>
<%@ include file="include/sectionIntroduction.jsp"%>
<%@ include file="include/sectionVision.jsp"%>
<%@ include file="include/sectionWorship.jsp"%>

		<!-- 교회 소식 섹션-->
		<section id="portfolio">
			<br>
			<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>교회 소식</h2>
					</div>
				</div>
			</div>
			<div class="row row-0-gutter text-center">
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<p style="font-weight:bold; color:#747474;">교회 소식</p>
						<figure class="effect-bubba">
							<img src="images/newsThumb.jpg" alt="img02" class="img-responsive" style="width:100%; height:400px;" />
							<figcaption>
								<h2>교회 소식</h2>
								<p>예배 날짜와 시간</p>
								<a href="#" data-toggle="modal" data-target="#Modal-1">View more</a>
							</figcaption>
						</figure>
						<%if(admin) { %>
						<button style="border-radius:10px;" class="btn btn-sm btn-outline-secondary" type="button" onclick="regNews()">소식 등록</button><br>
						<%} %>
					</div>
				</div>
				<!-- end portfolio item -->
			<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<p style="font-weight:bold; color:#747474;">주보</p>
						<figure class="effect-bubba">
								<img src="images/postThumb.jpg" alt="img02" class="img-responsive" style="width:100%; height:400px;" />
							<figcaption>
								<h2>주보</h2>
								<p>2월 21일 주보</p>
								<a href="#" data-toggle="modal" data-target="#Modal-2">View more</a>
							</figcaption>
						</figure>
						<%if(admin) { %>
						<button style="border-radius:10px;" class="btn btn-sm btn-outline-secondary" type="button" onclick="regPost()">주보 등록</button><br>
						 <%} %>
					</div>
				</div>
				<!-- end portfolio item -->
			<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<p style="font-weight:bold; color:#747474;">갤러리</p>
						<figure class="effect-bubba">
							<div id="imgList" style="width:100%; height:400px;"></div>
							<figcaption>
								<h2>갤러리</h2>
								<p>갤러리 보기</p>
								<a href="gallery.jsp">View more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
			</div>
			
			</div><!-- end container -->
		</section>
		
		<%@ include file="include/sectionPeople.jsp"%>
		<section id="contact" class="dark-bg">
			<br>
			<div class="container">
				<%@ include file="include/sectionMap.jsp"%>
			<!-- 관리자 로그인 (비밀번호 입력) -->
			<%if(admin) { %>
			<button type="button" style="background-color:black;" onclick="location.href='logout.jsp'">관리자 로그아웃</button>
			<%}else{ %>
			<button type="button" style="background-color:black;" id="loginBtn" >관리자 로그인</button>	
			<%}%>
			</div>
		</section>

			
		<p id="back-top">
			<a href="#top"><i class="fa fa-angle-up"></i></a>
		</p>

		<!-- Modal for portfolio item 1 -->
		<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content" >
					<div class="modal-header"  >
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-1"><%=newsTitle %></h4>
					</div>
					<div class="modal-body">
						<img src="<%=newsPath %>" alt="img01" class="img-responsive" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
				</div>
			</div>
		<!-- Modal for portfolio item 2 -->
		<div class="modal fade" id="Modal-2" tabindex="-1" role="dialog" aria-labelledby="Modal-label-2">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-2"><%=postTitle %></h4>
					</div>
					<div class="modal-body">
						<img src="<%=postPath %>" alt="img01" class="img-responsive" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

<!-- 관리자로그인 모달 -->
<div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" style="border-radius:10px;">
      <div class="modal-header" >
        <h1 class="modal-title fs-5" id="msgModalLabel">관리자 로그인</h1>
      </div>
      <div class="modal-body" id="newsmsgModalBody" style="padding:30px;">
		<form action="login.jsp" method="post" id="loginForm">
			<label class="form-label" for="pw">비밀번호</label>
			<input class="form-control mb-3" type="password" name="pw" id="pw">
		</form>
      </div>
      <div class="modal-footer">
        <button style="border-radius:10px;" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		<button style="border-radius:10px;" type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="login()">로그인</button>
      </div>
    </div>
  </div>
</div>


<!-- 소식 등록 모달 -->
<div class="modal fade" id="newsUploadModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" style="border-radius:10px;">
      <div class="modal-header" >
        <h1 class="modal-title fs-5" id="msgModalLabel">사진 등록</h1>
      </div>
      <div class="modal-body" id="newsmsgModalBody" style="padding:30px;">
		<form action="newsUpload.jsp" method="post" enctype="multipart/form-data" id="newsimgForm">
			<label class="form-label" for="title">제목</label>
			<input class="form-control mb-3" type="text" name="title" id="title">
			<label class="form-label" for="image">사진 선택</label>
			<input class="form-control" type="file" accept="image/*" name="image" id="image" >
		</form>
      </div>
      <div class="modal-footer">
        <button style="border-radius:10px;" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		<button style="border-radius:10px;" type="button" class="btn btn-warning" data-bs-dismiss="modal" id="newsdoneBtn">등록</button>
      </div>
    </div>
  </div>
</div>


<!-- 주보 등록 모달 -->
<div class="modal fade" id="postUploadModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content"  style="border-radius:10px;">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="msgModalLabel">주보 등록</h1>
      </div>
      <div class="modal-body" id="postmsgModalBody" style="padding:30px;">
		<form action="postUpload.jsp" method="post" enctype="multipart/form-data" id="postimgForm">
			<label class="form-label" for="title">제목</label>
			<input class="form-control mb-3" type="text" name="title" id="title">
			<label class="form-label" for="image">사진 선택</label>
			<input class="form-control" type="file" accept="image/*" name="image" id="image">
		</form>
      </div>
      <div class="modal-footer" id="modal-footer">
        <button style="border-radius:10px;" type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-dismiss="modal">취소</button>
		<button style="border-radius:10px; "type="button" class="btn btn-warning" data-bs-dismiss="modal" id="postdoneBtn">등록</button>
      </div>
    </div>
  </div>
</div>

		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/cbpAnimatedHeader.js"></script>
		<script src="js/jquery.appear.js"></script>
		<script src="js/SmoothScroll.min.js"></script>
		<script src="js/theme-scripts.js"></script>
		
		<!-- 카카오맵 -->
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d944d4a9cb22483964d7e130a9b4c2a"></script>
		<script>
			var position = new kakao.maps.LatLng(37.6442, 126.6273);
			
			var container = document.getElementById('map');
			var options = {
				center: position,
				level: 3
			};
		
			var map = new kakao.maps.Map(container, options);
			
			map.setZoomable();
			
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			
			//관리자로그인모달 보이게
			$('#loginBtn').on('click', function(){
				$('#loginModal').modal('show');
			});	
			// 로그인 모달 폼 전송
			function login(){
				$('#loginForm').submit();
			};
			
			//모달
			function regNews(){
				$('#newsUploadModal').modal('show');
			}
			
			$('#newsdoneBtn').on('click', function(){
				if ($('#title').val() != '' && $('#image').val() != '') {
					$('#newsimgForm').submit();
				} else {
					//popModal('사진 등록 실패', '입력 값이 없는 항목이 있습니다.')
				}
			});			
			
			function regPost(){
				$('#postUploadModal').modal('show');
			}

			$('#postdoneBtn').on('click', function(){
				if (true) {
					$('#postimgForm').submit();
				} else {
					//popModal('사진 등록 실패', '입력 값이 없는 항목이 있습니다.')
				}
			});
			
			function searchFunction() {
				//TODO: 리스트 출력 처리 하세요
					$.ajax({
						type:'post',
						url:'galleryProc.jsp',

						success:function(data){
							
							var data = JSON.parse(data.trim());
							
							var str = '';
							var img0 = data[0].gupfolder + '/' +data[0].guuid + '_' + data[0].gfilename;
							var img1 = data[1].gupfolder + '/' +data[1].guuid + '_' + data[1].gfilename;
							var img2 = data[2].gupfolder + '/' +data[2].guuid + '_' + data[2].gfilename;
							var img3 = data[3].gupfolder + '/' +data[3].guuid + '_' + data[3].gfilename;
							str += ''
								+'<img src="'+img0 +'" alt="image/demo/author-2.jpg" class="img-responsive" style="width:50%; height:200px;float: right;" />'
								+'<img src="'+img1 +'" alt="image/demo/author-2.jpg" class="img-responsive" style="width:50%; height:200px;float: left;" />'
								+'<img src="'+img2 +'" alt="image/demo/author-2.jpg" class="img-responsive" style="width:50%; height:200px;float: left;" />'
								+'<img src="'+img3 +'" alt="image/demo/author-2.jpg" class="img-responsive" style="width:50%; height:200px;float: right;" />'
							$("#imgList").html(str);
						}
					});	
			}
			window.onload = function() {
				searchFunction();
			}
		</script>
	</body>
</html>