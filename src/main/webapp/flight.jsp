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
<h1>Flights</h1>

<sql:query dataSource="${db}" var="ds">SELECT * from flight where source_city="${param.source}" AND destination_city="${param.destination}" AND dateoftravel="${param.dateoftravel}" AND (total_seats-(booked_seats+${param.numpersons}))>0;
	
	</sql:query>
	
	
	<h3>Available flights:</h3>
	<table border="2" width="100%">
		<tr>
			<th>Airline Name</th>
			<th>Price</th>
			<th>Flight Number</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Available Seats</th>
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
				<td><c:out value="${table1.total_seats - table1.booked_seats}" /></td>
				<td><c:out value="${table1.dateoftravel}" /></td>
				<td><c:out value="${table1.flight_class}" /></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<c:set var="seats" value="${param.numpersons + ds.rows[0].booked_seats}" scope="session"/>
	<c:set var="sourceset" value="${param.source}" scope="session"/>
	<c:set var="destinationset" value="${param.destination}" scope="session"/>
	<c:set var="dateset" value="${param.dateoftravel}" scope="session"/>
	<c:set var="seatsset" value="${param.numpersons}" scope="session"/>
	
	<form action="register.jsp">
		<label for="flightbuy">Select Flight Number:</label>
		<select id="flightbuy" name="flightbuy">
		<c:forEach var="flightlst" items="${ds.rows}">
			<option value="${flightlst.flight_number}">${flightlst.flight_number}</option>
		</c:forEach>
		</select>
		<button type="submit" name="flightsubmit" value="buy">Buy Flight</button>
	</form>

</body>
</html>