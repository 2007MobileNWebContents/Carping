<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명소 리뷰게시판 검색</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:1000px;">
		<article>
		<div style="height:100px; display:block;"></div>
		<div align="center">
			<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">명소 검색</h2>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br>
	<form action="placeReviewSearch.do" method="get">
	<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8" style="float:left;">
		<select id="searchCondition" name="searchCondition" class="form-control col-sm-2" style="width:20%; text-align:center;font-weight:bold; font-family: 'Sunflower', sans-serif;"> 
			<option value="명소이름" <c:if test="${search.searchCondition == '명소이름'}">selected</c:if>>명소 이름</option>
			<option value="주소" <c:if test="${search.searchCondition == '주소'}">selected</c:if>>주소</option>
		</select>&nbsp;&nbsp;
		<input type="text" class="form-control col-sm-7" style="font-weight:bold; font-family: 'Sunflower', sans-serif; width:50%;" id="searchValue" name="searchValue" value="${search.searchValue }" required/>&nbsp;
		<input type="submit" class="btn btn-default col-sm-1" style="font-weight:bold; font-family: 'Sunflower', sans-serif;" value="검색" id="search"/>
	</div>
	<div class="col-sm-2"></div>
	</div>
	</div>
	</form>
	<br>
	<!-- 검색 결과 출력  -->
	<form action="placeReviewListView.do" method="get">
	<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-7">
		<table class="table table-striped">
			<tr>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-3 text-center">장소명</th>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-7 text-center">주소</th>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 text-center">선택</th>
		</tr>
		<c:forEach items="${pList }" var="list" varStatus="status">
		<tr>
			<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${list.placeName }</td>
			<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${list.placeAddress }</td>
			<c:if test="${status.count eq 1 }">
				<td class="text-center"><input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="radio" name="placeKey" value="${list.placeKey }" class="radio" checked="checked"></td>
			</c:if>
			<c:if test="${status.count ne 1 }">
				<td class="text-center"><input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="radio" name="placeKey" value="${list.placeKey }" class="radio"></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	</div>
	<div class="col-sm-3"></div>
	</div>
	</div>
	<c:if test="${pList ne null || !empty pList }">
	<div class="container">
				<div class="col-md-12 text-center">
					<ul class="pagination pagination-sm">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="javascript:void(0);" class="page-link">이전</a></li>
					</c:if>
					<c:if test="${pi.currentPage>1}">
						<c:url var="before" value="placeReviewSearch.do">
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
							<c:param name="searchValue" value="${search.searchValue }"></c:param>
							<c:param name="page" value="${pi.currentPage-1}"></c:param>
						</c:url>
							<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${before}" class="page-link">이전</a></li>
					</c:if>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<c:if test="${pi.currentPage == p }">
							<li class="page-item"><a href="javascript:void(0);" class="page-link">${p}</a></li>
						</c:if>
						<c:if test="${pi.currentPage != p }">
							<c:url var="pagination" value="placeReviewSearch.do">
								<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
								<c:param name="searchValue" value="${search.searchValue }"></c:param>
								<c:param name="page" value="${p}"></c:param>
							</c:url>
							<li class="page-item"><a href="${pagination}" class="page-link">${p}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pi.currentPage>=pi.maxPage}">
						<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="javascript:void(0);" class="page-link">다음</a></li>
					</c:if>
					<c:if test="${pi.currentPage<pi.maxPage }">
						<c:url var="after" value="placeReviewSearch.do">
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
						<c:param name="page" value="${pi.currentPage + 1}"></c:param>
						</c:url>
						<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${after}" class="page-link">다음</a></li>
					</c:if>
					</ul>
				</div>
			</div>
			</c:if>
			
			<div class="container"><br>
		<div class="col-sm-2"></div>
			<div class="col-sm-7">
			<c:if test="${pList ne null || !empty pList }">
			<input type="submit" class="btn btn-success" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width: 140px; margin-left:48%;" value="리뷰 보러 가기!" onsubmit="return chk();"/>
			</c:if>
		</div>
			<div class="col-sm-3"></div>
			</div>
			</form>
			</article>
			</section>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>