<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>명소 추가</title>
      <!-- 상단 아이콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af&libraries=services"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
      <script>
         function daumPostcode() {
            new daum.Postcode({
               oncomplete : function(data) {
                  var jibunAddr = data.jibunAddress;

                  /* document.getElementById('zonecode').value = data.zonecode; */
                  document.getElementById('jibunAddress').value = data.jibunAddress;
                  
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                  mapOption = { 
                      center: new kakao.maps.LatLng(37.695918, 127.640103), // 지도의 중심좌표
                      level: 3 // 지도의 확대 레벨
                  };
	               // 지도를 생성합니다    
	                  var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	               // 주소-좌표 변환 객체를 생성합니다
	                  var geocoder = new kakao.maps.services.Geocoder();
	                  // 주소로 좌표를 검색합니다
	                  geocoder.addressSearch(jibunAddr, function(result, status) {
	                     // 정상적으로 검색이 완료됐으면 
	                     if (status === kakao.maps.services.Status.OK) {
	                        var geoCode = result[0].y+", "+result[0].x;
	                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
	                        /* map.setCenter(coords); */
	                        document.getElementById('pGeoCode').value = geoCode;
	                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                          map.setCenter(coords);
	                     }
	                  });
               }
            }).open();
         }
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
</style>
   </head>
   <body>
   <div class="bannerLogin" id="home" style="color: #FFFFFF;">
   <jsp:include page="../../../WEB-INF/views/common/nav.jsp"/>
      <div class="insertBox" align="center">
         <div style="background-color: rgba(12, 12, 12, 0.4); width:1400px; height:1250px; margin-top:50px;" align="center">
         	<h1 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h1">명소 추가</h1>
         	<div style="width: 350px; border-bottom: 2px solid #FFFFFF;"></div>
         	<br>
            <form action="insertPlace.do" method="post" enctype="multipart/form-data">
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3" align="center">명소이름</h3>
               <input class="form-control" style="width:400px;" type="text" name="placeName" required>
               <div style="width: 600px;">
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">주소찾기</h3>
               <input class="form-control" style="margin-left:100px; width:400px;float:left;" type="text" id="jibunAddress" name="placeAddress" required>
               <input class="loginBtn" style="font-family: 'Sunflower', sans-serif; font-weight:bold; float:left; width:80px; height:35px;" type="button" onclick="daumPostcode()" value="찾기">
               <br><br>
               <div id="map" style="width:100%;height:250px;"></div>
               </div>
               <input class="form-control" type="hidden" id="pGeoCode" name="placeGeoCode">
               <div align="center" style="display:inline-block">
                  <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">편의시설</h3>
                  <br>
                  <input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" id="chkBox1" type="checkbox" name="placeToilet" value="1"> 화장실&nbsp;&nbsp;
                  <input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" id="chkBox2" type="checkbox" name="placeGS25" value="1"> 편의점&nbsp;&nbsp;
                  <input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" id="chkBox3" type="checkbox" name="placeParking" value="1"> 주차장&nbsp;&nbsp;
               </div>
               <br><br>
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">기타사항</h3>
               <textarea class="form-control" name="placeEtc" cols="50" rows="5" style="resize: none; color:black; width:400px;"></textarea>
               <br>
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">사진 첨부</h3>
               <input class="loginBtn" type="file" name="uploadFile" required>
               <br>
               <br>
               <input class="loginBtn" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:80px; height:35px;" type="submit" value="등록">
            </form>
         </div>
      </div>
      </div>
      <!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
   </body>
</html>