<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
<!--/script-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById('jibunAddress').value = data.jibunAddress;
        }
    }).open();
};
</script>

<style>
.bannerLogin {
	background: url(../../../resources/images/fallStreet2.jpg) no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	min-height: 950px;
	position: relative;
}
span.guide {
		display:none;
		font-size : 15px;
		top : 12px;
		right : 10px;
		margin-left: 20px;
		font-weight: bold;
	}
	
span.guide2 {
		display:none;
		font-size : 15px;
		top : 12px;
		right : 10px;
		margin-left: 20px;
		font-weight: bold;
	}
	
span.ok{color:#FFFFFF}
span.error{color:red}
</style>

</head>
<body>
	<div class="bannerLogin" id="home" style="color: #FFFFFF;">
	<jsp:include page="../../../WEB-INF/views/common/nav.jsp"/>
		<div class="loginBox">
			<div class="loginBox3">
			<form action="updateMember.do" method="post">
				<table class="enrollTable">
					<tr>
						<td colspan="3" align="center">
							<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2" align="center">정보수정</h2>
							<div style="width: 350px; border-bottom: 2px solid #FFFFFF;"></div>
							<input class="form-control" style="margin-left: 20px; width:300px;" type="hidden" name="memberId" id="memberId" value="${loginUser.memberId }" readonly>
							
						</td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">비밀번호</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="password" name="memberPwd" id="password" value="${loginUser.memberPwd }" required></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">이름</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="text" name="memberName" value="${loginUser.memberName }" required></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">전화번호</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="text" name="phone" maxlength="13" value="${loginUser.phone }" required></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">이메일</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="text" name="email" value="${loginUser.email }" required></td>
					</tr>
					<c:forTokens var="addr" items="${loginUser.memberAddress }" delims="," varStatus="status">
								<c:if test="${status.index eq 0 }">
									<tr>
										<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">주소</td>
										<td style="width:320px;">
											<input type="text" id="jibunAddress" name="jibunAddress" class="form-control" style="width:300px; margin-left: 20px;" value="${addr}" required>
										</td>
										<td style="width:160px;"><button class="loginBtn" style="font-family: 'Sunflower', sans-serif; font-weight:bold; float:left; margin-left: 20px; width:70px;" type="button" onclick="daumPostcode()">검색</button></td>
									</tr>
								</c:if>
								<c:if test="${status.index eq 1 }">
									<tr>
										<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">상세주소</td>
										<td style="width:320px;">
											<input type="text" id="detailAddress" name="detailAddress" class="form-control" value="${addr}" style="width:300px; margin-left: 20px;" required>
										</td>
									</tr>
								</c:if> 
					</c:forTokens>
					<tr>
						<td colspan="3" align="center">
							<input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="submit" class="btnLogin" value="수정하기">
							<button style="font-family: 'Sunflower', sans-serif; margin-left:10px;" class="btnLogin" type="button" onclick="location.href='home.do';">메인으로</button>
						</td>
					</tr>
				</table>
			</form>
			</div>
		</div>
	 <!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>