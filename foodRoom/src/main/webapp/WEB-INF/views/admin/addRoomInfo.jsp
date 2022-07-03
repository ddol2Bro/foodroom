<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set  var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>룸정보 추가</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script> 
	// jQuery를 이용하여 이미지 파일을 첨부할 때 미리보기 기능을 구현한다. 		
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#addd').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$(document).ready(function() {
		
		   // 기입한 룸정보에 대한 유효성 검사
		   $("#addBtn").on("click", function() {
		      
		      
		      document.addRoomInfoForm.action="${contextPath}/addRoomInfoGo.do";
		      document.addRoomInfoForm.submit();   
		      
		   });
		   
		});
	</script>
</head>

<body>
	<div class="">
		<p/>
		<span class="">룸정보 추가</span><p/>
		<div class="">
			<form name="addRoomInfoForm" method="post" enctype="multipart/form-data">
				<div style="display:none;"><input type="text" name="" value="">업체번호</div>
						<input class="" type="text" name="fr_no" value="${approve_no}" readonly style="display:none;"/>
				<table class="">
					<tr>
						<td class="">룸 이름</td>
						<td><input class="" type="text" maxlength="94" name="fr_room_name" id="fr_room_name" placeholder="룸 이름을 입력해 주세요."/></td>
						<td class="">룸 정원</td>
						<td><input class="" type="text" maxlength="94" name="fr_room_person_no" id="fr_personNo" placeholder="룸 정원을 입력해 주세요."/></td>
					</tr>		
					<tr>
						<td class="">
								<span class="">[미리보기]</span><br/>
								<div class="">
								<input id="asd" type="file" name="fr_room_image" onchange="readURL(this);" style="display:none;"/>
								</div>	
								<img id="addd" width="120" height="120"/>
								<label for="asd" class="">▶파일 첨부</label>
						</td>
					</tr>
					<tr>
						<td class="">
								<div class="">
									<br/>
									<button id="addBtn" class="">룸 추가하기</button>
									<button type="button" id="" onclick="location.href=''">취소하기</button>
								</div>
						</td>
					</tr>	
				</table>	
			</form>
		</div>
	</div>
</body>
</html>