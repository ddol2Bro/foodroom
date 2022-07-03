<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="${contextPath}/css/foodroom.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
	
	function fnc_process() { // 아이디 중복 검사
		
       	var tid 		= document.getElementById('fr_id');
        var id_RegExpCn = /^[a-zA-Z0-9]{4,12}$/;
	    var	_id1		= $("#fr_id").val();
	    
	        
				$.ajax({	// 아이디 중복 체크 기능
						type:		"post",
						url:		"${contextPath}/checkId.do",
						dataType:	"json",
						async : 	false,
						data:		{fr_id: _id1},	
						success:	function(data) {
							
							// 서버에서 전송된 결과에 따라 메시지를 표시한다.
						
							if (tid.value == '' || tid.value == null) {				// 아이디 입력란이 공백인 경우.
								$("#idChkMsg").html("아이디를 입력해주세요.");
								$("#idChkMsg").css("color","white")
								$("#signUpBtn").prop("disabled", true);								
							} else if (!id_RegExpCn.test(tid.value)) {				// 아이디에 특수문자나 공백이 들어간 경우.
								$("#idChkMsg").html("영문&숫자 4~12자리만 가능합니다");
								$("#idChkMsg").css("color","pink")
								$("#signUpBtn").prop("disabled", true);
					        } else if (data == 0) {							// 아이디가 DB와 겹치지 않는 경우.
								$("#idChkMsg").html("등록 가능한 아이디 입니다.");	
								$("#idChkMsg").css("color","skyblue")
								$("#signUpBtn").prop("disabled", false);
							} else {												// 아이디가 DB와 겹치는 경우.
								$("#idChkMsg").html("이미 사용중인 아이디 입니다.");
								$("#idChkMsg").css("color","pink")
								$("#signUpBtn").prop("disabled", true);
							}
						}
				});
			}

	$(document).ready(function() {				
		
		$("#signUpBtn").on("click", function() {
			var RegExp = /^[a-zA-Z0-9]{4,12}$/; // 비밀번호 유효성 검사
			var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 유효성 검사
		    var n_RegExp = /^[가-힣]{2,12}$/; //이름 유효성검사
		    var p_RegExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/; // 연락처
		    
		    
		    var objPwd = document.getElementById("fr_pwd"); // 비밀번호 입력값 받기
		    var objEmail = document.getElementById("fr_email"); // 이메일 입력값 받기
		    var objName = document.getElementById("fr_name"); // 이름 입력값 받기	
		    var objPnumber = document.getElementById("fr_p_number"); // 전화번호 입력값 받기
		    
		    // 비밀번호 유효성 검사 영역
			if($("#fr_pwd").val() == '') {
				alert("비밀번호를 입력하십시오");
				$("#ef_pwd").focus();
				return false;
			}
			if(!RegExp.test(objPwd.value)) {
	            alert("비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");   
	            $("#fr_pwd").focus();
	            return false;
	        }
			if($("#repwd").val() == '') {
				alert("비밀번호 확인을 입력하십시오");
				$("#repwd").focus();
				return false;
			}
			if($("#fr_pwd").val() != $("#repwd").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#repwd").focus();
				return false;
			}		
			
			// 이름 유효성 검사 영역
			if($("#fr_name").val() == '') {
				alert("이름을 입력하십시오");
				$("#fr_name").focus();
				return false;
			}
			if(!n_RegExp.test(objName.value)) {
	            alert("특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.");
	            $("#fr_name").focus();
	            return false;
	        }
			
			// 전화번호 유효성 검사 영역
			if($("#fr_p_number").val() == '') {
				alert("전화번호를 입력하십시오");
				$("#fr_p_number").focus();
				return false;
			}
			if(!p_RegExp.test(objPnumber.value)) {
		         alert("올바른 전화번호를 입력해 주세요. ex)010-9999-9999");
		         $("#fr_p_number").focus();
		         return false;
		     }
			
			// 이메일 주소 유효성 검사 영역
			if($("#fr_email").val() == '') {
				alert("이메일을 입력하십시오");
				$("#fr_email").focus();
				return false;
			}        
	        if(!e_RegExp.test(objEmail.value)) {
	            alert("올바른 이메일 주소를 입력해 주세요. ex) ezenfit@ezenfit.com");
	            $("#fr_email").focus();
	            return false;
	        }
	        
			document.signUpForm.action = "${contextPath}/loginGO.do";
			document.signUpForm.submit();
		
		}); // submit버튼		
		
	}); // function	
	
	function pwTest() {
		   if($("#fr_pwd").val() == $("#repwd").val() && $("#fr_pwd").val()!="" ) {
		      $("#pwdSuccess").html("비밀번호가 일치합니다.");
		      $("#pwdSuccess").css("color","blue")
		   }
		   else if($("#fr_pwd").val() != $("#repwd").val()) {
		      $("#pwdSuccess").html("비밀번호가 일치하지 않습니다.");
		      $("#pwdSuccess").css("color","red")
		   }
		   else{
		      $("#pwdSuccess").html("비밀번호를 입력해주세요.");
		      $("#pwdSuccess").css("color","black")
		   }
	}
</script>

<body>
	<div id="signUpField">
		
		<form id="signUpForm" name="signUpForm" method="post">	
			<table class="signUpTable">
				<tr>
					<th colspan=2><span>회원가입</span></th>
				</tr>
				<tr>
					<td colspan=2>
						<label><input type="radio" name="fr_class" id="" value="13" checked /> 일반회원</label>
						<label><input type="radio" name="fr_class" id="" value="02" /> 업체</label>					
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="fr_id" id="fr_id" class="joinInput" maxlength="12" placeholder="아이디 입력" oninput="fnc_process();"/></td>	
				</tr>
				<tr>
					<td><span class="">√ 아이디 중복 체크 : </span></td>
					<td id="idChkMsg">아이디를 입력해주세요.</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="fr_pwd" id="fr_pwd" oninput="pwTest();"/></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="repwd" id="repwd" oninput="pwTest();"/></td>
				</tr>
				<tr>
					<td><span class="">√ 비밀번호 일치 체크 : </span></td>
					<td id="pwdSuccess">비밀번호를 입력해주세요.</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="fr_name" id="fr_name" /></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="fr_p_number" id="fr_p_number" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="fr_email" id="fr_email" /></td>
				</tr>
				<tr>
					<td><button type="button" id="signUpBtn" >가입하기</button></td>
					<td><button type="button" id="" onclick="location.href='${contextPath}/loginForm.do'">가입취소</button></td>					
				</tr>
			</table>
		</form>
	</div>
</body>
</html>