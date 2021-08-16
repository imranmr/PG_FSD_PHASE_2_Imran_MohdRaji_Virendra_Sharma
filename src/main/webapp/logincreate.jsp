<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Login</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/phase2project" user="root"
		password="root" />
<c:if test="${'newaccount'==param.logincreation}">
		<sql:update dataSource="${db}" var="count">  
		INSERT INTO login VALUES ("${param.username}","${param.password}");  
		</sql:update>
		<c:set var="username" scope="session" value="${param.username}" />
		<c:redirect url="/flightsearch.jsp"/>
	</c:if>	


<form action="logincreate.jsp">
			<label for="username">Enter Username:</label>
			<input type="text" placeholder="Enter Username:" name="username" id="username"> <br>
			<label for="password">Enter Password</label>
			<input type="password" placeholder="Enter password:" name="password" id="password"> <br>
			<button type="submit" name="logincreation" value="newaccount">Create Login</button>
</form>

</body>
</html>