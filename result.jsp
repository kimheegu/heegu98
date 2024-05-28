<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="file1" value="${param.param1}"/>
<!-- first.jsp에서 가져온 param1을 file1로 지정 -->
<c:set var="file2" value="${param.param2}"/>
<!-- first.jsp에서 가져온 param1을 file2로 지정 -->
<title>이미지 파일 출력하기</title>
</head>
<body>
<table align="center" border="1" align="center">
<tr>
<td>
파라미터 1 : <c:out value="${file1}" /><br>
<!-- file1이름 출력 -->
</td>
<td>
파라미터 2 : <c:out value="${file2}"/><br>
<!-- file2이름 출력 -->
</td>
</tr>
<tr>
<td>
<c:if test="${not empty file1}">
<!-- file1이 비어있지 않다면 실행 -->
<img src="${contextPath}/download.do?fileName=${file1}" width=300 height=300/><br>
<!-- fileName이 file1을 서블릿으로 호출 후 넓이 높이 300으로 지정 -->
</c:if>
파일 내려받기 :
<a href="${contextPath}/download.do?fileName=${file1}">파일 내려받기</a><br>
 <!-- fileName이 file1을 서블릿으로 호출 -->
<br>
</td>
<td>
<c:if test="${not empty file2}">
<img src="${contextPath}/download.do?fileName=${file2}" width=300 height=300/><br>
</c:if>
파일 내려받기 :
<a href="${contextPath}/download.do?fileName=${file2}">파일 내려받기</a><br>
</td>
</tr>
</table>
</body>
</html>