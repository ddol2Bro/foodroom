<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>승인된 업체관리</title>
		<link href="${contextPath}/css/foodroom.css" rel="stylesheet">   
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<script>

$(document).on('click', '.deleteRoom', function(){
	if (confirm("정말 룸을 삭제 하시겠습니까?") == true) {
		var deleteRoom = $(this);
		
		var row = deleteRoom.parent();
		var tr	= row.children();
		
		var rfr_room_no		= tr.eq(0).text();
		var rfr_no			= tr.eq(1).text();
		var rfr_room_name	= tr.eq(2).text();
		alert(rfr_room_no+ ", " + rfr_no);
		
		$.ajax({
			type:		"POST",
			url:		"${contextPath}/room/delete.do",
			dataType:	"json",
			async:		false,
			success:	function(data){
				alert(rfr_room_name + "방이 삭제 처리 되었습니다.");
				location.reload();
			}
		});
	}else{
		return;
	}
});

</script>

<body>
<div class="">
	<div><a href="${contextPath}/addRoomInfo.do?fr_no=${room_no}" 
					   class=""><button type="button">룸 추가</button></a></div>
	<div>
		<div><span class="">룸 목록</span></div>          		
		<c:forEach var="roomList" items="${roomList}" varStatus="status">
			<c:if test="${status.index % 2 == 0}">
				<div class="lookRoomView1">
					<img src="${contextPath}/roomImg/${roomList.fr_no}/${roomList.fr_room_image}" width="300" height="100" style="float:left;">
					<span>룸 이름 : </span>${roomList.fr_room_name}<br/>
					<span>룸 정원 : </span>${roomList.fr_room_person_no}
					<div>
						<button type="button" class="">수정</button>
						<button type="button" class="deleteRoom">삭제</button>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index % 2 == 1}">
				<div class="lookRoomView2">
					<img src="${contextPath}/roomImg/${roomList.fr_no}/${roomList.fr_room_image}" width="300" height="100" style="float:left;">
					<span>룸 이름 : </span>${roomList.fr_room_name}<br/>
					<span>룸 정원 : </span>${roomList.fr_room_person_no}
					<div>
						<button type="button" class="">수정</button>
						<button type="button" class="deleteRoom">삭제</button>
					</div>
				</div>
			</c:if>
		</c:forEach>
			
			
			
			
	</div>	
</div>
</body>
</html>