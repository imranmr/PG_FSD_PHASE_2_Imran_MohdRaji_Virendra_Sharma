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

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/phase2project" user="root"
		password="root" />
		
<sql:query dataSource="${db}" var="ds">SELECT * from flight where flight_number=${param.flightbuy};</sql:query>
<c:set var="flightbuy" value="${param.flightbuy}" scope="session"/>

<H1>Registration</H1>
<p>Selected Flight:</p>

	<table border="2" width="100%">
		<tr>
			<th>Airline Name</th>
			<th>Price ($)</th>
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
	Searched:<br>
	Source: "${sourceset}"<br>
	Destination: "${destinationset}"<br>
	Date: "${dateset}"<br>
	Seats: "${seatsset}"
	
	<br>
	<form action="buypage.jsp">
		<h4>Please enter your registration details below:</h4>
		<label for="full_name">Full Name:</label><br>
		<input type="text" placeholder="Enter full name:" name="full_name" id="full_name"><br><br>
		
		<label for="address">Address:</label><br>
		<input type="text" placeholder="Enter address:" name="address" id="address"><br><br>
		
		<label for="age">Age:</label><br>
		<input type="number" placeholder="Enter age:" name="age" id="age"><br><br>
		
		<label for="mobile">Mobile:</label><br>
		<input type="number" placeholder="Enter mobile:" name="mobile" id="mobile"><br><br>
		
		<label for="username">Username:</label><br>
		<input type="text" placeholder="Enter username:" name="username" id="username" value=${username} readonly="readonly"><br><br>
		
		<label for="country">Country:</label><br>
		<input type="text" placeholder="Enter country of residence:" name="country" id="country"><br><br>
		
		<label for="passport">Passport:</label><br>
		<input type="text" placeholder="Enter passport:" name="passport" id="passport"><br><br>
		
		<p> Enter Credit Card Information: </p>
		<label for="carnumber">Enter Card Number:</label><br>
		<input type="number" placeholder="Enter Card Number" name="creditcardnumber" id="cardnumber"/>
		<br>
		<label for="securitypin">Enter Security Pin:</label><br>
		<input type="number" placeholder="Enter Security Pin" name="securitypinnumber" id="securitypin"/>
		<br>
		<label for="expirationdate">Enter Card Expiration Date:</label><br>
		<input type="date" placeholder="Enter Card Expiration Date" name="expirationdate" id="expirationdate"/>
		<br><br>
		<button type="submit" name="register_submit" value="add">Buy Ticket</button>
	</form>
	
	

</body>
</html>