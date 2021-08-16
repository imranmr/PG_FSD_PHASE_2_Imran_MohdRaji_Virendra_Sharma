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
		
	<%---Refund ticket --%>	
	<c:if test="${'refund'==param.refund_submit}">
		<sql:update dataSource ="${db}" var="result">update flight set booked_seats=(booked_seats-${param.refundseats}) where flight_number=${param.refundflightnum};</sql:update>
		<sql:update dataSource ="${db}" var="result">delete from booking where booking_id=${param.refundbooking};</sql:update>
		<sql:update dataSource="${db}" var="result">delete from register where username="${param.refundusername}";</sql:update>
		
		<c:redirect url="/flightsearch.jsp"/>
	</c:if>
	<%-- Admin Account --%>	
	<c:if test="${param.username=='admin'}">
		<sql:query dataSource ="${db}" var="result">select * from login where username="${param.username}" and password="${param.password}";</sql:query>
		<c:if test="${param.password==result.rows[0].password}">
			<c:redirect url="/adminlogin.jsp"/>
		</c:if>
	</c:if>
	
	<%-- Account --%>
	<sql:query dataSource ="${db}" var="result">select * from login where username="${param.username}" and password="${param.password}";</sql:query>
	
	<sql:query dataSource ="${db}" var="boughtticket">select * from flight where flight_number=(select flight_number from booking where username="${param.username}");</sql:query>
	
	<c:if test="${result.rowCount >0}">
		<c:set var="username" scope="session" value="${param.username}" />
		
		<%--If user already has ticket, cancel ticket or leave --%>
		<c:if test="${boughtticket.rowCount>0}">
			<p>You already have ticket purchase. Information listed below: </p>
			<sql:query dataSource ="${db}" var="bookingticket"> select * from booking where username="${param.username}";</sql:query>
			<table border="2" width="100%">
			<tr>
				<th>Airline Name</th>
				<th>Price</th>
				<th>Flight Number</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>

				<th>Date of Travel</th>
				<th>Flight Class</th>
			</tr>
			<c:forEach var="table1" items="${boughtticket.rows}">
				<tr>
					<td><c:out value="${table1.airline_name}" /></td>
					<td><c:out value="${table1.price}" /></td>
					<td><c:out value="${table1.flight_number}" /></td>
					<td><c:out value="${table1.source_city}" /></td>
					<td><c:out value="${table1.destination_city}" /></td>
					<td><c:out value="${table1.departuretime_fromsource}" /></td>
					<td><c:out value="${table1.arrivaltime_fromdestination}" /></td>
					<td><c:out value="${table1.dateoftravel}" /></td>
					<td><c:out value="${table1.flight_class}" /></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<table border="2" width="100%">
		<tr>
			<th>Username</th>
			<th>Flight Number</th>
			<th>Booking ID</th>
			<th>Seats</th>

		</tr>
		<c:forEach var="table" items="${bookingticket.rows}">
			<tr>
				<td><c:out value="${table.username}" /></td>
				<td><c:out value="${table.flight_number}" /></td>
				<td><c:out value="${table.booking_id}" /></td>
				<td><c:out value="${table.seats}" /></td>
				<c:set var="refundseats" value="${table.seats}"/>
				<c:set var="refundbooking" value="${table.booking_id}"/>
				<c:set var="refundflightnum" value="${table.flight_number}"/>
				<c:set var="refundusername" value="${table.username}"/>
			</tr>
		</c:forEach>
		</table>
		
		<p> Would you like to cancel and buy a new ticket?</p>
		
		
		<form action="login.jsp">
			<input type="hidden" name="refundseats" value="${refundseats}">
			<input type="hidden" name="refundbooking" value="${refundbooking}">
			<input type="hidden" name="refundflightnum" value="${refundflightnum}">
			<input type="hidden" name="refundusername" value="${refundusername}">
			<button type="submit" name="refund_submit" value="refund">Cancel Ticket</button>
		</form>
		
		
		</c:if>
		
		<%---If there is no ticket, go buy ticket --%>
		<c:if test="${boughtticket.rowCount==0}">>
			<c:redirect url="/flightsearch.jsp"/>
		</c:if>
		
		
	</c:if>
	
	<%-- No Account --%>
	<c:if test="${result.rowCount==0}">
		<p>Account does not exist! </p>
		<p>Create Account?</p>
		<a href="logincreate.jsp">Create Login Account</a>
	</c:if>
	
</body>
</html>