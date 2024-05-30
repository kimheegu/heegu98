<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkMember(){
		
		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가=힣]/;
		var regExpName = /^[가-힣]*$/;
		var regExpPwd = /^[0-9]*$/;
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		var form = document.member;
		
		var id = form.id.value;
		var pwd = form.pwd.value;
		var name = form.name.value;
		var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		var email = form.email.value;
		
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요!");
			form.id.select();
			return;
		}
		if(!regExpPwd.test(pwd)){
			alert("비밀번호는 숫자만 입력해주세요!");
			form.pwd.select();
			return;
		}
		if(!regExpName.test(name)){
			alert("이름은 한글만 입력해주세요!");
			form.name.select();
			return;
		}
		if(!regExpPhone.test(phone)){
			alert("연락처 입력을 확인해주세요!");
			return;
		}
		if(!regExpEmail.test(email)){
			alert("이메일 입력을 확인해주세요!");
			form.email.select();
			return;
		}
		
		form.submit();
		
		}
		
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form action="${contextPath }/vali05_process.do" name="member" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="pwd"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>연락처: <input type="text" name="phone1" maxlength="3" size="3">-
					<input type="text" name="phone2" maxlength="4" size="4">-
					<input type="text" name="phone3" maxlength="4" size="4">
		</p>
		<p>이메일: <input type="text" name="email"></p>
		<p><input type="button" value="가입하기" onclick="checkMember()">
	</form>
</body>
</html>