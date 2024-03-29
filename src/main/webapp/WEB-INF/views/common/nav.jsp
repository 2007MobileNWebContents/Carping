<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Outdoors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="applisalonion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="resources/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<!-- Custom Theme files -->
<link href="resources/css/iconeffects.css" rel='stylesheet'
	type='text/css' />
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="resources/css/swipebox.css">
<script src="resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="resources/js/move-top.js"></script>
<script type="text/javascript" src="resources/js/easing.js"></script>
<!--/web-font-->
<link
	href='//fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>

<link
	href='//fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700'
	rel='stylesheet' type='text/css'>
	
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">	
<!--/script-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
         jQuery(document).ready(function($) {
            $(".scroll").click(function(event){      
               event.preventDefault();
               $('html,body').animate({scrollTop:$(this.hash).offset().top},900);
            });
         });
</script>
<!-- swipe box js -->
<script src="resources/js/jquery.swipebox.min.js"></script>
<script type="text/javascript">
         jQuery(function($) {
            $(".swipebox").swipebox();
         });
   </script>
<!-- //swipe box js -->
<!--animate-->
<link href="resources/css/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="resources/js/wow.min.js"></script>
<script>
       new WOW().init();
   </script>
</head>
<body>
	<div id="home" class="header-bottom">
		<div class="container">
			<div class="fixed-header">
				<!-- logo -->
				<div class="logo">
					<a style="font-weight:bold; font-family: 'Sunflower', sans-serif;" href="home.do"><img src="resources/images/CarpingNav.png"></a>
				</div>
				<!-- //logo -->
				<div class="top-menu">
					<span class="menu"> </span>
					<nav class="link-effect-4" id="link-effect-4">
						<ul>
							<li class="active"><a style="font-weight:bold; font-family: 'Sunflower', sans-serif;" data-hover="Home" href="home.do">Home</a>

							</li>
							<li><a style="font-weight:bold; font-family: 'Sunflower', sans-serif;" data-hover="추천장소" href="#" class="scroll">추천장소</a>
								<ul class="subNav">
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="areaInfoView.do">차박 장소 추천</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="foodZoneView.do">맛집 추천</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="placeView.do">명소 추천</a></li>
								</ul></li>
							<li><a style="font-weight:bold; font-family: 'Sunflower', sans-serif;" data-hover="쇼핑몰" href="tentListView.do" >쇼핑몰</a></li>
							<li><a style="font-weight:bold; font-family: 'Sunflower', sans-serif;" data-hover="커뮤니티" href="#" class="scroll">커뮤니티</a>
								<ul class="subNav">
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="BoardInfo.do">자유 게시판</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="reviewInfo.do">리뷰 게시판</a></li>
								</ul></li>
							<li><a style="font-weight:bold; font-family: 'Sunflower', sans-serif;" data-hover="마이페이지" href="#" class="scroll">마이페이지</a>
								<ul class="subNav">
								<c:if test="${!empty sessionScope.loginUser }">
									<c:if test="${loginUser.admin == 'N' }">
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="myOrderView.do">구매내역</a></li>
									<li style="float: left;"><a
									style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="myReserve.do">포장 예약내역</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="myInfoPwCheckForm.do">회원정보 수정</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="memberDeletePwCheckForm.do">회원탈퇴</a></li>
									</c:if>
									<c:if test="${loginUser.admin == 'Y' }">
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="myInfoPwCheckForm.do">회원정보 수정</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="memberDeletePwCheckForm.do">회원탈퇴</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="insertInfo.do">장소추가</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="foodZoneMenuInsertView.do">맛집 메뉴 등록</a></li>
									</c:if>
								</c:if>
								</ul>
							</li>
							<li><a style="font-weight:bold; font-family: 'Sunflower', sans-serif;" data-hover="고객센터" href="#" class="scroll">고객센터</a>
								<ul class="subNav">
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="noticeList.do">공지사항</a></li>
									<li style="float: left;"><a
										style="font-weight:bold; font-family: 'Sunflower', sans-serif;display: block; padding: 1px 5px;" href="selectList.do">건의사항</a></li>
								</ul>
							</li>
							<li class="loginTBox scroll" style="width:300px; height:40px; margin-top:-10px;">
								<c:if test="${!empty sessionScope.loginUser }">
									<c:if test="${loginUser.admin == 'N' }">
										<span class="h5" style="font-weight:bold; font-family: 'Sunflower', sans-serif;color: #FFFFFF;">${loginUser.memberName } 님</span>&nbsp;&nbsp;
										<button class="loginBtn h5" onclick="location.href='myInfoPwCheckForm.do';">정보수정</button>
										<button class="enrollBtn h5" onclick="location.href='logout.do';">로그아웃</button>
									</c:if>
									<c:if test="${loginUser.admin == 'Y' }">
										<span class="h5" style="font-weight:bold; font-family: 'Sunflower', sans-serif;color: #FFFFFF;">${loginUser.memberName } 님</span>&nbsp;&nbsp;
										<button class="loginBtn h5" onclick="location.href='adminEnrollForm.do';">관리자 추가</button>
										<button class="enrollBtn h5" onclick="location.href='logout.do';">로그아웃</button>
									</c:if>								
								</c:if>
							</li>
						</ul>
						
					</nav>
				
				</div>
				<!-- script-for-menu -->
				<script>
                           $("span.menu").click(function(){
                              $(".top-menu ul").slideToggle("slow" , function(){
                              });
                           });
                        </script>
				<!-- script-for-menu -->

				<div class="clearfix"></div>
				<script>
            $(document).ready(function() {
                var navoffeset=$(".header-bottom").offset().top;
                $(window).scroll(function(){
                  var scrollpos=$(window).scrollTop(); 
                  if(scrollpos >=navoffeset){
                     $(".header-bottom").addClass("fixed");
                  }else{
                     $(".header-bottom").removeClass("fixed");
                  }
                });
                
            });
            </script>
			</div>
		</div>
	</div>
</body>
</html>