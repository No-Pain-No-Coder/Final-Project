<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="NPNC"%>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<style>
i {
	cursor: pointer;
}

.insertReplyBtn {
	text-align: center;
	width: 100px;
	font-size: 12px;
	padding: 10px;
	margin-bottom: 7px;
	margin-right: 12px;
}

/* 프로필 스타일 */
.useId {
	line-height: 0px;
	text-align: center;
	box-sizing: border-box;
	font-size: 35px;
	font-weight: 700;
	color: #1e1e23;
}

.useEmail {
	padding: 2px 20px 8pxpx;
	text-align: center;
	box-sizing: border-box;
	font-size: 25px;
	color: #929294;
}

.useId, .useEmail {
	margin: 0.5em 0;
}

#mypageprofile {
	text-align: center;
	position: relative;
}

.image-container {
	display: flex;
	justify-content: center;
}

.centered-image {
	width: 500px;
	height: auto;
	border-radius: 50%;
}

/* 사진첨부 모달 */
#updateProfileModal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.update-profile-content {
	width: 500px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
	margin: auto;
	margin-top: 10%;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	text-align: center;
}

.update-profile-content .close {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	color: #555; /* 변경된 색상 */
	cursor: pointer;
	transition: color 0.3s;
}

.update-profile-content label {
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
	color: #333; /* 변경된 색상 */
}

.update-profile-content form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.update-profile-content .file-label {
	display: inline-block;
	background-color: #3498db;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-bottom: 0px;
	align-self: center;
}

.update-profile-content .file-label:hover {
	background-color: #2980b9;
}

.update-profile-content .file-icon {
	margin-right: 10px;
}

.update-profile-content .file-input {
	display: none;
}

.update-profile-content button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	margin-top: 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
	align-self: center;
	width: 100%;
	box-sizing: border-box;
}

.update-profile-content button:hover {
	background-color: #45a049;
}

/* 이미지 컨테이너 스타일 */
#selectedImageContainer {
	text-align: center;
	margin-bottom: 20px;
	width: 180px;
}

#selectedImage {
	max-width: 180px;
	min-width: 180px;
	max-height: 180px;
	min-height: 180px;
	border: 2px solid #3498db;
	border-radius: 50%;
}

/* 모달 스타일 */
label {
	text-align: center;
}

button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin-top: 10px;
	cursor: pointer;
	border-radius: 4px;
	text-transform: none;
	font-family: inherit;
	line-height: inherit;
	-webkit-appearance: button;
	overflow: visible;
	box-sizing: border-box !important;
}

.modal {
	box-sizing: border-box !important;
	transition: ease all 0.5s;
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	font-weight: bold;
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	max-width: 500px;
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	width: 100%;
	pointer-events: auto;
	background-clip: padding-box;
	border-radius: 0.3rem;
	outline: 0;
}

.close {
	color: #aaa;
	text-align: right;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	box-sizing: border-box !important;
	transition: ease all 0.5s;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

a {
	cursor: pointer;
}

#passwordMember {
	border: 1px solid rgba(0, 0, 0, .2);
	border-width: 2px;
	border-style: inset;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
	box-sizing: border-box !important;
	transition: ease all 0.5s;
	overflow: visible;
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

label {
	box-sizing: border-box !important;
	transition: ease all 0.5s;
	display: inline-block;
}

/* 첨부파일 css */
.file-label {
	text-align: center;
	width: 180px;
	display: inline-block;
	background-color: #3498db;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.file-label:hover {
	background-color: #2980b9;
}

.icon.solid.fa-cog:hover {
	transform: rotate(45deg);
	transition: transform 0.3s ease;
	cursor: pointer;
}

.file-icon {
	margin-right: 10px;
}

.file-input {
	display: none;
}
</style>
<head>
<title>HealthDuo</title>
<meta charset="utf-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" /> -->
<link rel="icon" href="assets/css/images/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1 id="logo">회원 프로필</h1>
				</div>
			</div>
		</header>

		<!-- Nav -->
		<NPNC:healthDuo_nav />

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-3 col-12-medium">
						<div class="sidebar">

							<!-- Sidebar -->

							<!-- Recent Posts -->
							<section>
								<h2 class="major">
									<span>Recent Posts</span>
								</h2>
								<ul class="divided">
									<li>
										<article class="box post-summary">
											<h3>
												<a href="#">A Subheading</a>
											</h3>
											<ul class="meta">
												<li class="icon fa-clock">6 hours ago</li>
												<li class="icon fa-comments"><a href="#">34</a></li>
											</ul>
										</article>
									</li>
									<li>
										<article class="box post-summary">
											<h3>
												<a href="#">Another Subheading</a>
											</h3>
											<ul class="meta">
												<li class="icon fa-clock">9 hours ago</li>
												<li class="icon fa-comments"><a href="#">27</a></li>
											</ul>
										</article>
									</li>
									<li>
										<article class="box post-summary">
											<h3>
												<a href="#">And Another</a>
											</h3>
											<ul class="meta">
												<li class="icon fa-clock">Yesterday</li>
												<li class="icon fa-comments"><a href="#">184</a></li>
											</ul>
										</article>
									</li>
								</ul>
								<a href="#" class="button alt">Archives</a>
							</section>

							<!-- Something -->
							<section>
								<h2 class="major">
									<span>Ipsum Dolore</span>
								</h2>
								<a href="#" class="image featured"><img
									src="images/pic03.jpg" alt="" /></a>
								<p>Donec sagittis massa et leo semper scele risque metus
									faucibus. Morbi congue mattis mi. Phasellus sed nisl vitae
									risus tristique volutpat. Cras rutrum sed commodo luctus
									blandit.</p>
								<a href="#" class="button alt">Learn more</a>
							</section>

							<!-- Something -->
							<section>
								<h2 class="major">
									<span>Magna Feugiat</span>
								</h2>
								<p>Rhoncus dui quis euismod. Maecenas lorem tellus, congue
									et condimentum ac, ullamcorper non sapien. Donec sagittis massa
									et leo semper scele risque metus faucibus. Morbi congue mattis
									mi. Phasellus sed nisl vitae risus tristique volutpat. Cras
									rutrum sed commodo luctus blandit.</p>
								<a href="#" class="button alt">Learn more</a>
							</section>

						</div>
					</div>

					<div class="col-9 col-12-medium imp-medium">
						<div class="content">

							<!-- Content -->
							<article class="box page-content">
								<section id="mypageprofile">

									<h2 style="color: #bead7c;">회원 프로필</h2>
									<div class="imageContainer">
										<img class="centered-image" src="images/default.png"
											alt="프로필이미지">
									</div>
									<p class="useId">${mpdata.nickName}</p>
									<p class="useEmail" style="margin-bottom: 50px;">
										${mpdata.address}</p>
									<ul class="meta" style="font-size: 1.5em;">
										<c:if test="${not empty memberID}">
											<li><i id="rc" class="icon fa-heart"
												style="color: #f22202;" title="추천"></i>
												<p class="cnt" style="display : inline-block;">${mpdata.recommendCnt}</p></li>
											<li><i id="ph" class="icon solid fa-ban" title="신고"></i></li>
										</c:if>
									</ul>
								</section>

								<section id="mypageintroduction">
									<h2 style="color: #bead7c;">소개글</h2>
									<textarea> ${mpdata.intro}</textarea>
								</section>

								<button style="float: right;" type="button"
									onclick="location.href='';">매칭 신청</button>

							</article>

						</div>
					</div>

					<div class="col-12"></div>
				</div>
			</div>
		</section>
		<button id="scrollToTop" onclick="scrollToTop()"
			class="icon solid fa-chevron-up"></button>
		<!-- Footer -->
		<footer id="footer">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- About -->
						<section>
							<h2 class="major">
								<span>What's this about?</span>
							</h2>
							<p>
								This is <strong>TXT</strong>, yet another free responsive site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a>
								for <a href="http://html5up.net">HTML5 UP</a>. It's released
								under the <a href="http://html5up.net/license/">Creative
									Commons Attribution</a> license so feel free to use it for whatever
								you're working on (personal or commercial), just be sure to give
								us credit for the design. That's basically it :)
							</p>
						</section>

					</div>
					<div class="col-12">

						<!-- Contact -->
						<section>
							<h2 class="major">
								<span>Get in touch</span>
							</h2>
							<ul class="contact">
								<li><a class="icon brands fa-facebook-f" href="#"><span
										class="label">Facebook</span></a></li>
								<li><a class="icon brands fa-twitter" href="#"><span
										class="label">Twitter</span></a></li>
								<li><a class="icon brands fa-instagram" href="#"><span
										class="label">Instagram</span></a></li>
								<li><a class="icon brands fa-dribbble" href="#"><span
										class="label">Dribbble</span></a></li>
								<li><a class="icon brands fa-linkedin-in" href="#"><span
										class="label">LinkedIn</span></a></li>
							</ul>
						</section>

					</div>
				</div>

				<!-- Copyright -->
				<div id="copyright">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>

			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<!-- <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/translations/ko.js"></script>
	<script>
		ClassicEditor.create(document.querySelector('#editor'), {
		  toolbar: false ,
		  language: 'ko'
		});
	</script>  -->
	<script type="text/javascript">
   $(document).ready(function(){
   		var recommend = parseInt(${recommend});
   		var prohibit = parseInt(${prohibit});

      if(recommend > 0){
         $("#rc").removeClass("fa-heart").addClass("solid fa-heart");
      } else {
         $("#rc").removeClass("solid fa-heart").addClass("fa-heart");
      }

      if(prohibit > 0){
         $("#ph").css("color", "#f58300");
      } else {
         $("#ph").css("color", "#e7e4e4");
      }

      $("#rc").on("click", function(){
         $.ajax({
            url: 'profileRecommend.do?rcresult=' + recommend + '&profileNum=' + parseInt(${mpdata.profileNum}),
            type: 'GET',
            success: function(rcresult){
               console.log('rcresult [' + rcresult + ']');
               if (rcresult == 1) {
                  $("#rc").removeClass("fa-heart").addClass("solid fa-heart");
                  recommend = 1;
                  var cnt = parseInt($('.cnt').text()) + 1;
                  console.log(cnt);
                  $('.cnt').text(cnt);
               } else if (rcresult == 0) {
                  $("#rc").removeClass("solid fa-heart").addClass("fa-heart");
                  recommend = 0;
                  var cnt = parseInt($('.cnt').text()) - 1;
                  console.log(cnt);
                  $('.cnt').text(cnt);
               }
            },
            error: function(error){
               history.go(goback.jsp);
            }
         });
      });

      $("#ph").on("click", function(){
         $.ajax({
            url: 'profileProhibit.do?phresult=' + prohibit + '&profileNum=' + parseInt(${mpdata.profileNum}),
            type: 'POST',
            success: function(phresult){
               console.log('phresult [' + phresult + ']');
               if (phresult == 1) {
                  $("#ph").css("color", "#f58300");
                  prohibit = 1;
               } else if (phresult == 0) {
                  $("#ph").css("color", "#e7e4e4");
                  prohibit = 0;
               }
            },
            error: function(error){
               alert('error [' + error + ']');
            }
         });
      });
      
      
   });
   
   const boardButton = document.getElementById('boardButton');
   const menuList = document.getElementById('menuList');

   let menuVisible = false;
	if(boardButton != null && boardButton != undefined){
   		boardButton.addEventListener('click', () => {
    	menuVisible = !menuVisible;
     
	     if (menuVisible) {
	 	      menuList.style.display = 'block';
	     } else {
 		      menuList.style.display = 'none';
	     }
	   });
	}

	document.addEventListener("DOMContentLoaded", function() {
	    const insertReplyBtns = document.querySelectorAll('.insertReplyBtn');

	    insertReplyBtns.forEach(function(insertReplyBtn) {
	      const insertReplyContainer = insertReplyBtn.parentElement;
	      const insertReply = insertReplyContainer.querySelector('.insertReply');

	      insertReplyBtn.addEventListener('click', () => {
	        if (insertReply.style.display === 'none') {
	          insertReplyBtn.textContent = "작성 취소";
	          insertReply.style.display = 'block';
	        } else {
	          insertReplyBtn.textContent = "대댓글 작성";
	          insertReply.style.display = 'none';
	        }
	      });
	    });
	  });
	
	console.log(window.location.pathname);
	function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth' // 부드러운 스크롤 효과 사용
        });
    }
    // 스크롤 위치에 따라 버튼을 표시 또는 숨깁니다.
    window.onscroll = function() {
        var button = document.getElementById("scrollToTop");
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            button.style.display = "block";
        } else {
            button.style.display = "none";
        }
    };
   </script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/nav.util.js"></script>
	<c:choose>
		<c:when test="${empty memberID}">
			<script src="assets/js/main.js"></script>
		</c:when>
		<c:otherwise>
			<c:if test="${role eq 3}">
				<script src="assets/js/main2.js"></script>
			</c:if>
			<c:if test="${role eq 2}">
				<script src="assets/js/main3.js"></script>
			</c:if>
		</c:otherwise>
	</c:choose>
</body>
</html>