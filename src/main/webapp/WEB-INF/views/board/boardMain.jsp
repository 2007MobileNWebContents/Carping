<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<div style="width:100%; height:1000px;">
	<div style="height: 100px;"></div>
	<div class="blogs" id="blogs" style="padding: 30px; 30px;">
		<div class="container">
		    <h3 class="tittle" style="font-family: 'Poor story', cursive;">자유게시판</h3>
		    <br>
		    <p style="font-family: 'Sunflower', sans-serif; font-weight: bold;" class="wel-text wow fadeInDown"  data-wow-duration=".8s" data-wow-delay=".4s">회원들과 자유롭게 소통을 나눠보세요</p>
		</div>
		<br>
		<br>
		<div class="container">
			<div class="col-md-1"></div>
					<div class="col-md-10">
						<table class="table table-striped">
							<tr>
								<th style="font-family: 'Sunflower', sans-serif; font-weight: bold;" class="col-md-1 text-center">글 번호</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight: bold;" class="col-md-7 text-center">제목</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight: bold;" class="col-md-1 text-center">작성자</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight: bold;" class="col-md-1 text-center">조회수</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight: bold;" class="col-md-2 text-center">작성날짜</th>
							</tr>
							<c:if test="${bList eq null || empty bList}">
								<tr>
									<td style="font-family: 'Sunflower', sans-serif; font-weight: bold;" colspan="5" class="col-md-12 text-center">등록된 글이 없어요~</td>
								</tr>
							</c:if>
							<c:if test="${bList ne null && !empty bList }">
								<c:forEach items="${bList}" var="bList" varStatus="status">
									<tr>
										<td style="font-family: 'Sunflower', sans-serif; font-weight: bold;">${pageNum - status.index }</td>
										<td>
											<c:url var="boardDetail" value="boardDetail.do">
												<c:param name="boardKey" value="${bList.boardKey}"></c:param>
											</c:url>
											<a style="font-family: 'Sunflower', sans-serif; font-weight: bold;" href="${boardDetail }">${bList.boardTitle}</a>
										</td>
										<td style="font-family: 'Sunflower', sans-serif; font-weight: bold;">${bList.memberId }</td>
										<td style="font-family: 'Sunflower', sans-serif; font-weight: bold;">${bList.boardCount }</td>
										<td style="font-family: 'Sunflower', sans-serif; font-weight: bold;">${bList.boardEnrollDate}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				<div class="com-md-1"></div>
				</div>
			<form action="BoardInsertForm.do" method="get">
				<div class="container" style="margin-left: 210px;">
					<div class="col-md-10"></div>
					<div class="col-md-1"><input style="font-family: 'Sunflower', sans-serif; font-weight: bold;" type="submit" class="btn btn-info" value="글 작성"></div>
					<div class="col-md-1"><%-- <input type="hidden" name="foodZoneKey" value="${foodZoneKey}"> --%></div>
				</div>
			</form>
			<div class="container">
				<div class="col-md-12 text-center">
					<ul class="pagination pagination-sm">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="page-item"><a href="javascript:void(0);" class="page-link">이전</a></li>
					</c:if>
					<c:if test="${pi.currentPage>1}">
						<c:url var="before" value="BoardInfo.do">
							<c:param name="page" value="${pi.currentPage-1}"></c:param>
						</c:url>
						
							<li class="page-item"><a href="${before}" class="page-link">이전</a></li>
					</c:if>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<c:if test="${pi.currentPage == p }">
							<li class="page-item"><a href="javascript:void(0);" class="page-link">${p}</a></li>
						</c:if>
						<c:if test="${pi.currentPage != p }">
							<c:url var="pagination" value="BoardInfo.do">
								<c:param name="page" value="${p}"></c:param>
							</c:url>
							<li class="page-item"><a href="${pagination}" class="page-link">${p}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pi.currentPage>=pi.maxPage}">
						<li class="page-item"><a href="javascript:void(0);" class="page-link">다음</a></li>
					</c:if>
					<c:if test="${pi.currentPage<pi.maxPage }">
						<c:url var="after" value="BoardInfo.do">
							<c:param name="page" value="${pi.currentPage + 1}"></c:param>
						</c:url>
						<li class="page-item"><a href="${after}" class="page-link">다음</a></li>
					</c:if>
					</ul>
					
				</div>
			</div>
			<br><br>
			
			 <form action="searchBoard.do">
				  	<div class="container">
				  	<div class="row2">
				  	<div class="col-sm-2"></div>
				  	<div class="col-sm-8" style="float:left;">
				  		<select class="col-sm-2 form-control" id="searchCondition" name="searchCondition" style="font-family: 'Sunflower', sans-serif; font-weight:bold;width: 12%; text-align: center;">
				  			<option value="제목" <c:if test="${search.searchCondition == '제목'}">selected</c:if>>제목</option>
							<option value="내용" <c:if test="${search.searchCondition == '내용'}">selected</c:if>>내용</option>
							<option value="작성자" <c:if test="${search.searchCondition == '작성자'}">selected</c:if>>작성자</option>
				  		</select>
				  		<input type="text" class="form-control col-sm-6" style="font-family: 'Sunflower', sans-serif; font-weight:bold;width : 50%;" id="searchValue" name="searchValue" value="${search.searchValue }" required="required">
				  		<button type="submit"style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="btn btn-default col-sm-1" id="search">검색</button>
				  	</div>
				  	<div class="col-md-2"></div>
				  	</div>
				  	
				  </div>
			  </form>
		</div>    
	</div>
	<br>
	<br>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>