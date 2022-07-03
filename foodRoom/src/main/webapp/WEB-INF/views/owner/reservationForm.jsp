<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약내역</title>
	<link href="${contextPath}/css/foodroom.css" rel="stylesheet">    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
$(document).ready(function() {	
	// 파라메터로 받아온 날짜 변수 저장해서 사용하기.
var url = window.location.search;
var param = new URLSearchParams(url);
var fr_reservation_date = param.get('fr_reservation_date');
});

</script>
<body>
	<div style="width:100%; height:100%;">
		<div style="width:100%; height:4%;">
			<!-- 휴일 지정 버튼 누르면 휴일지정 버튼 안보여주고 휴일취소버튼 보여주기 <> 반대로도 활성화 시키기 
				 휴일 지정은 예약된 정보가 없는 경우만 가능
				 휴일 지정하면 달력에 날짜표시 빨간색으로 변경하기 -->
			<button type="button" style="float:right;">휴일 지정</button>
			<button type="button" style="display:none; float:right;">휴일 취소</button>
		</div>
		<div class="reservationPossible">
			<span>예약 가능</span><hr/>
			<!-- for문 조건:예약가능한 -->
			<div>
			       <table class="k">           		
						<tr>
							<th><b>룸이미지</b></th>
							<th><b>룸번호</b></th>
							<th><b>업체번호</b></th>
							<th><b>룸이름</b></th>
							<th><b>룸정원</b></th>
							<th><b>오프라인 예약</b></th>
						</tr>
						
						<c:forEach var="frRoomNoList" items="${frRoomNoList}">
										<tr>
											<td><img src="${contextPath}/roomImg/${frRoomNoList.fr_no}/${frRoomNoList.fr_room_image}" width="120" height="120"/></td>
											<td>${frRoomNoList.fr_room_no}</td>
											<td>${frRoomNoList.fr_no}</td>
											<td>${frRoomNoList.fr_room_name}</td>
											<td>${frRoomNoList.fr_room_person_no}</td>
											<td><a href="${contextPath}/ownerRevOk.do?fr_room_no=${frRoomNoList.fr_room_no}&fr_reservation_date=${fr_reservation_date}" 
									  			 onclick="return confirm('[${frRoomNoList.fr_room_name}] 룸을 예약 처리 하시겠습니까?');" class="">예약완료처리</a></td>
										</tr>
						</c:forEach>
						
					</table> 
			</div>		
		</div>
					
	<div class="reservatioinImpossible">
			<span>예약 완료</span><hr/>
			<!-- for문 조건:예약불가능한 -->

				<c:forEach var="revRoomList" items="${revRoomList}">
								<div class="testBox">
									<img src="${contextPath}/roomImg/${revRoomList.fr_no}/${revRoomList.fr_room_image}" width="120" height="120" style="float:left;"/>
									<span>룸이름 : </span>
									<span>${revRoomList.fr_room_name}</span><br/>	
									<span>룸정원 : </span>
									<span>${revRoomList.fr_room_person_no} 명</span>						
									<div>
										<button type="button" id="">예약현황</button>
										<button type="button" id="">예약취소</button>
									</div>
								</div>
				</c:forEach>
				
	</div>
				
				
	</div>
	
	<div id="reservatioinList" style="display:none;">
		<table>
			<tr>
				<th>예약 일자</th>
				<th>예약 회원</th>
				<th>연락처</th>
			</tr>
			<!-- for문 -->
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	
	</div>
</body>
</html>