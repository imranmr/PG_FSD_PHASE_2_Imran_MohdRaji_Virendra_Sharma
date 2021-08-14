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
<title>Flight Page</title>
</head>
<body>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/phase2project" user="root"
		password="root" />
<h1>Flight Page</h1>

<sql:query dataSource="${db}" var="ds">SELECT * from flight where source_city="${param.source}" AND destination_city="${param.destination}" AND ;
	</sql:query>
	<h3>Printing out data in flight table</h3>
	<table border="2" width="100%">
		<tr>
			<th>Airline Name</th>
			<th>Price</th>
			<th>Flight Number</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Total Seats</th>
			<th>Booked Seats</th>
			<th>Date of Travel</th>
			<th>Flight Class</th>
		</tr>
		<c:forEach var="table1" items="${ds.rows}">
			<tr>
				<td><c:out value="${table1.airline_name}" /></td>
				<td><c:out value="${table1.price}" /></td>
				<td><c:out value="${table1.flight_number}" /></td>
				<td><c:out value="${table1.source_city}" /></td>
				<td><c:out value="${table1.destination_city}" /></td>
				<td><c:out value="${table1.departuretime_fromsource}" /></td>
				<td><c:out value="${table1.arrivaltime_fromdestination}" /></td>
				<td><c:out value="${table1.total_seats}" /></td>
				<td><c:out value="${table1.booked_seats}" /></td>
				<td><c:out value="${table1.dateoftravel}" /></td>
				<td><c:out value="${table1.flight_class}" /></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form action="register.jsp">
		<label for="flightbuy">Enter Flight Number to checkout:</label><br>
		<input type="number" placeholder="Enter Flight Number:" name="flightbuy" id="flightbuy">
		<button type="submit" name="flightsubmit" value="buy">Buy Flight</button>
	</form>

</body>
</html>