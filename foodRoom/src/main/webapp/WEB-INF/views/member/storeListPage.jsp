<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="storeViewList"		value="${storeViewList}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약하기</title>
		<link href="${contextPath}/css/ezen.css" rel="stylesheet">    
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="">
	<!-- 지역검색 -->
	<div id="menu">
		<ul class="main1">
			<li><a href="#">지역</a>
				<ul class="main2">
					<li><a href="${contextPath}/findStoreList.do?findBigStore=서울&findSmallStore=모두">서울</a>
						<ul class="main3">
							<li><a href="${contextPath}/findStoreList.do?findBigStore=서울&findSmallStore=강동">강동</a></li>
							<li><a href="${contextPath}/findStoreList.do?findBigStore=서울&findSmallStore=강서">강서</a></li>
							<li><a href="${contextPath}/findStoreList.do?findBigStore=서울&findSmallStore=강남">강남</a></li>
							<li><a href="${contextPath}/findStoreList.do?findBigStore=서울&findSmallStore=강북">강북</a></li>
						</ul>
					</li>
					<li><a href="#">경기</a>

					</li>
					<li><a href="#">지방1</a>

					</li>
					<li><a href="#">지방2</a>

					</li>	
				</ul>
			</li>
		</ul>
	</div>
	
	<div>
		<form method="post" class="" name="">
			<input type="hidden" name="fr_address" value="" />
			<input type="checkbox" name="fr_menu1" id="fr_menu1" value="한식"/>한식
			<input type="checkbox" name="fr_menu2" id="fr_menu2" value="중식"/>중식
			<input type="checkbox" name="fr_menu3" id="fr_menu3" value="일식"/>일식
			<input type="checkbox" name="fr_menu4" id="fr_menu4" value="양식"/>양식
			<input type="checkbox" name="fr_menu5" id="fr_menu5" value="기타"/>기타 <br/>
			예약가능인원 : <input type="number" min="1" max="20" name="">
			<input type="button" id="" value="검색"> 
		</form>
	</div>
    <!-- 업체목록 -->
    <div>	
		<span class="">업체목록</span>		
		<table class="">           		
			<tr>
				<th><b>주소</b></th>
				<th><b>업체명</b></th>
				<th><b>연락처</b></th>
				<th><b>주메뉴</b></th>
			</tr>
			<c:forEach var="storeViewList" items="${storeViewList}">
				<tr>
					<td>${storeViewList.fr_address}</td>
					<td><a href="">${storeViewList.fr_store_name}</a></td>
					<td>${storeViewList.fr_store_p_number}</td>
					<td>${storeViewList.fr_menu}</td>
				</tr>  				
			</c:forEach>
		</table>
	</div>	

</div>
</body>
</html>