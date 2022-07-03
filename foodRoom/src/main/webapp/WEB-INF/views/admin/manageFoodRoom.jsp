<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>승인된 업체관리</title>
		<link href="${contextPath}/css/ezen.css" rel="stylesheet">    
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="">

	<form id="" name="" method="post" action="${contextPath}/findStoreList.do">
		<select name="selectChk" id="">
			<option value="fr_store_name" selected>업체명</option>
			<option value="fr_address">업체주소</option>
		</select>
		<input class="" type="text" name="selectText" maxlength=100/>
		<button type="submit" id="" >검색</button>
		
	</form>

    <!-- 업체등록 승인요청란 -->
		
	<span class="">승인업체 목록</span>		
       <table class="">           		
		<tr>
			<th><b>아이디</b></th>
			<th><b>업체명</b></th>
			<th><b>업체주소</b></th>
			<th><b>업체연락처</b></th>
			<th><b>업체주메뉴</b></th>
			<th><b>룸정보 추가</b></th>
		</tr>
		<c:forEach var="approveOk" items="${approveOk}">
			<tr>
				<td>${approveOk.fr_id}</td>
				<td>${approveOk.fr_store_name}</td>
				<td>${approveOk.fr_address}</td>
				<td>${approveOk.fr_store_p_number}</td>
				<td>${approveOk.fr_menu}</td>
				<td><a href="${contextPath}/lookRoomList.do?fr_no=${approveOk.fr_no}" 
					   onclick="return confirm('[${approveOk.fr_store_name}] 룸 정보를 보겠습니까?');" class="">룸정보 보기</a></td>
			</tr>
		</c:forEach>
	</table>
	

</div>
</body>
</html>