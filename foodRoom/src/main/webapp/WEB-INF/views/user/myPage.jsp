<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<link href="${contextPath}/css/foodroom.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
</head>
<body>
	<div id="myPageField">
		<form method="get" action="${contextPath}/myPageUpdate.do">
			<table class="myPageTable">
				<tr>
					<th colspan=2><span>MyPage</span></th>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="fr_id" value="${fr_id}" readonly/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="fr_name" value="${fr_name}" readonly/></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="fr_p_number" value="${fr_p_number}" readonly/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="fr_email" value="${fr_email}" readonly/></td>
				</tr>
				<tr>	
					<td colspan=2><input type="submit" value="수정하기"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>