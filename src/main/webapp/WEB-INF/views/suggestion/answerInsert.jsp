<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 답변 등록</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:800px;">
		<div style="height:100px;"></div>
		<div align="center">
			<h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;">건의사항 답변 등록</h3>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br><br>
	<form action="insertAnswer.do" method="post">
      <input type="hidden" name="suggestionKey" value="${suggestionKey}"/>
      <article>
			<div class="container" style="font-family:'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label><input type="text" name="answerTitle" placeholder="답변 제목을 입력해주세요" required class="col-md-8 form-control align-self-center" style="width : 564px;">
				</div><br><br>
				<div class="col-md-2"></div>
			</div>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label><textarea name="answerContent" placeholder="답변 내용을 입력해주세요" class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 325px; resize: none;" required></textarea>
				</div>
            <div class="container" style="font-family: 'Sunflower', sans-serif;"></div>
            	<div class="col-md-2"></div>
            	<div class="col-md-8" style="margin-left:400px;">
            	<br><br>
               <button type="button" class="col-md-2 btn btn-default" style="font-family: 'Sunflower', sans-serif; font-weight:bold; height: 40px;" onclick="back();">뒤로가기</button>
               <div class="col-md-2"></div>
               <input type="submit" class="col-md-2 btn btn-info" style="font-family: 'Sunflower', sans-serif; font-weight:bold; height: 40px;" onclick="return Add();" value="답변 등록"> &nbsp;
               </div>
               <div class="col-md-2"></div>
               </div>
               </article>
	</form>
	</section>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	<script>
	function Add() {
		return confirm("답변을 등록하시겠습니까?")
		}
	
	function back() {
		location.href="javascript:history.go(-1);"
	}
	</script>
</body>
</html>