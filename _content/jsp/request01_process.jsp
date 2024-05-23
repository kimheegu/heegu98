<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String userid=request.getParameter("id");
String userpw=request.getParameter("pw");
%>
<p>아이디 : <%=userid %></p>
<p>비밀번호 : <%=userpw %></p>
</body>
</html>