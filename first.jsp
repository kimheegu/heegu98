<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 요청하기</title>
</head>
<body>
<form method="post" action="result.jsp">
<!-- 값을 post 방식으로 result.jsp로 보냄  -->
<input type=hidden name="param1" value="snowman.jpg"/><br>
<!-- snowman.jpg의 값을 가진 param1 -->
<input type=hidden name="param2" value="snow.jpg"/><br>
<!-- snow.jsp의 값을 가진 param2  -->
<input type="submit" value="이미지 다운로드">
<!-- 이미지 다운로드를 누르면 전송  -->
</form>
</body>
</html>