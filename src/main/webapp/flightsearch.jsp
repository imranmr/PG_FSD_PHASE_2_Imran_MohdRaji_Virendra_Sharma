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
<title>Flight Search Page</title>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/phase2project" user="root"
			password="root" />
<sql:query dataSource="${db}" var="ds">SELECT * from flight;</sql:query>
<form action="flight.jsp">	
	<label for="source">Select source city:</label>
	<select id="source" name="source">
		<c:forEach var="sourcelst" items="${ds.rows}">
			<option value="${sourcelst.source_city}">${sourcelst.source_city}</option>
		</c:forEach>
	</select>
	<br>
	<label for="destination">Select destination city:</label>
	<select id="destination" name="destination">
		<c:forEach var="destinationlst" items="${ds.rows}">
			<option value="${destinationlst.destination_city}">${destinationlst.destination_city}</option>
		</c:forEach>
	</select>
	<br>
	<label for="dateoftravel">Enter Date of Travel:</label> 
	<input type="date" placeholder="Date" name="dateoftravel" id="dateoftravel" required>
	<br>
	<label for="numpersons">Enter Number of Persons:</label> 
	<input type="number" placeholder="Number of Persons:" name="numpersons" id="numpersons" required> <br> 
	
	<button type="submit">Search Flight</button>
</form>
</head>
<body>

</body>
</html>