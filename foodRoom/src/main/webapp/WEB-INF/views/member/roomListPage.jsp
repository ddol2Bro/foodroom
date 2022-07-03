<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>룸 목록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link href="${contextPath}/css/ezen.css" rel="stylesheet">    		
</head>
<script>
$(function() {
	//오늘 날짜를 출력
	$("#today").text(new Date().toLocaleDateString());
	
	// 강의 시작일자
	$("#dd").datepicker({

	});

});

// 데이트피커의 기본설정
$(function() {
	$.datepicker.setDefaults({
		changeYear:		true,		// 년도를 바꿀 수 있는 셀렉트 박스를 보여준다.
		changeMonth:	true,		// 월을 바꿀 수 있는 셀렉트 박스를 보여준다.
		showAnim:		"slide",	// 애니메이션을 적용한다.
		dateFormat:		'yy-mm-dd',	// 날짜 포맷. 보통 yy-mm-dd를 많이 사용한다.
		prevText:		'이전 달',	// ◀ 버튼에 마우스 오버시 이전달 텍스트를 보여준다.
		nextText:		'다음 달',	// ▶ 버튼에 마우스 오버시 다음달 텍스트를 보여준다.
		closeText:		'닫기',		// 닫기 버튼의 텍스트 변경
		currentText:	'오늘',		// 오늘 텍스트 변경
		// 한들 캘린더 중 월 표시를 위한 부분
		monthNames:		['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames:		['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort:	['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin:	['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:	true,	// true : 년 월, false : 월 년 순으로 보여준다.
		yearSuffix:		'년',		// 년도 뒤에 글자
		showButtonPanel:	true,	// 오늘로 가는 버튼과 달력의 닫기 버튼 보기 옵션
		// buttonImageOnly:		true,	// input 옆에 조그마한 아이콘으로 캘린더 선택가능하게 하기
		// buttonImage:			"images/calendar.gif"	// 조그마한 아이콘 이밎
		// buttonText:			"Select Date"			// 조그마한 아이콘 툴팁
	});
});
</script>
<body>
<div class="" style="width=100%; height:100%;">

	<div>룸 목록</div>

	<div style="width=100%; height:4%;">
		<form method="post" name="ef_alter">
			<table id="">
				<tr>
					<td>예약날짜 : </td>
		      		<td><input type="text" id="dd" class="" name="" value="" placeholder="날짜선택" readonly/></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<div>	
		
		<div class="reservationPossible">
			<span>예약 가능</span><hr/>
			<!-- for문 조건:예약가능한 -->
			<div>
				<img id="loomImage" usemap="" width="120" height="120" src="" style="float:left;"/>
				<span class="">룸이름 : </span>
				<span class=""></span><br/>							
				<span class="">룸정원 : </span>
				<span class=""></span>
				<form>
					예약인원<input type="number"  name="fr_room_person_no" min="1" max=""> <!-- max는 룸 정원인원 -->
					<input type="hidden" name="fr_room_no" value="">
					<input type="hidden" name="fr_reservation_date" id="fr_reservation_date">
					<button type="button" id="">예약하기</button>
					
				</form>
			</div>		
		</div>
					
		<div class="reservatioinImpossible">
			<span>예약 불가</span><hr/>
			<!-- for문 조건:예약불가능한 -->
			<div>
				<img id="loomImage" usemap="" width="120" height="120" src="" style="float:left;"/>
				<span class="">룸이름 : </span>
				<span class=""></span><br/>	
				<span class="">룸정원 : </span>
				<span class=""></span>
				<div>
					<button type="button" id="">예약대기</button>
				</div>	
			</div>
		</div>
				
	</div>	
	
</div>
</body>
</html>