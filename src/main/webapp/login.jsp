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
<title>Insert title here</title>
</head>
<body>
	<h2>Checking login</h2>
	<br>
	<p>Connecting to database</p>
	<jsp:useBean id="login" class="com.java.programs.Login" scope="request"/>
	<jsp:setProperty property="*" name="login"/>
	
	
	
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/phase2project" user="root"
		password="root" />

	<sql:query dataSource="${db}" var="rs">  
		SELECT * from login;  
		</sql:query>
	<p>Printing out data in login table</p>	<br>
	<table border="2" width="100%">
		<tr>
			<th>Login</th>
			<th>Password</th>
		</tr>
		<c:forEach var="table" items="${rs.rows}">
			<tr>
				<td><c:out value="${table.username}" /></td>
				<td><c:out value="${table.password}" /></td>

			</tr>
		</c:forEach>
	</table>
	
	<p>Adding login details to login table - might be commented</p>
	<jsp:getProperty property="username" name="login"/><br>
	<jsp:getProperty property="password" name="login"/><br>
	
	<c:set var="username" scope="session" value="${param.username}"/>
	<c:set var="password" scope="session" value="${param.password}"/>
	<c:out value="${username}"/>
	<c:out value="${password}"/>
	<%-- 
	<sql:update dataSource="${db}" var="count">  
	INSERT INTO login VALUES ("${username}","${password}");  
	</sql:update> 
	--%>
	
	
	<br>
	<p>Getting updated list </p>
	<br>
	<sql:query dataSource="${db}" var="rs">  
		SELECT * from login;  
		</sql:query>
	<p>Printing out data in login table</p>	<br>
	<table border="2" width="100%">
		<tr>
			<th>Login</th>
			<th>Password</th>
		</tr>
		<c:forEach var="table" items="${rs.rows}">
			<tr>
				<td><c:out value="${table.username}" /></td>
				<td><c:out value="${table.password}" /></td>

			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>