<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
%>
<sql:setDataSource var="dataSource"
url="jdbc:mysql://localhost:3306/DB"
driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource }" var="resultSet">
DELETE FROM member WHERE id=? AND passwd=?
<sql:param value="<%=id %>"/>
<sql:param value="<%=passwd %>"/>
</sql:update>
<c:import var="url" url="sql01.jsp"/>
${url}
</body>
</html>