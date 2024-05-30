<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpName=/^[가-힣]*$/;
	var regExpPasswd=/^[0-9]*$/;
	var regExpPhone=/^\d{3}-\d{3,4}-\d{4}$/;
	var regExpEmail = /[-A-Za-z0-9!#$%&'*+\/=?^_`{|}~]+(?:\.[-A-Za-z0-9!#$%&'*+\/=?^_`{|}~]+)*@(?:[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?/i;
	
	var form = document.Member;
	
	var id = form.id.value;
	var name = form.name.value;
	var passwd = form.passwd.value;
	var phone = form.phone1.value + "-" + form.phone2.value + "-" +form.phone3.value;
	var email = form.email.value;
	
	if(!regExpId.test(id)){
		alert("아이디는 문자로 시작해주세요!");
		form.id.select();
		return;
	}
	if(!regExpName.test(name)){
		alert("이름은 한글만 입력해주세요!");
		form.name.select();
		return;
	}
	if(!regExpPasswd.test(passwd)){
		alert("비밀번호는 숫자만 입력해주세요!");
		form.pwd.select();
		return;
	}
	if(!regExpPhone.test(phone)){
		alert("연락처 입력을 확인해주세요!");
		return;
	}
	if(!regExpEmail.test(email)){
		alert("이메일을 입력을 확인해주세요!");
		form.email.select();
		return;
	}
	document.Member.submit();
}
</script>
</head>
<body>
<h3>회원 가입</h3>
<form action="${contextPath }/validation05_process.do" name="Member" method="post">
<p>아이디 : <input type="text" name="id"></p>
<p>비밀번호 : <input type="password" name="passwd"></p>
<p>이름 : <input type="text" name="name"></p>
<p>연락처 : <input type="text" name="phone1" maxlength="3" size="3">-<input type="text" maxlength="4" size="4" name="phone2">-
<input type="text" maxlength="4" size="4" name="phone3"></p>
<p>이메일 : <input type="text" name="email"></p>
<p><input type="button" value="가입하기" onclick="checkMember()"></p>
</form>
</body>
</html>
