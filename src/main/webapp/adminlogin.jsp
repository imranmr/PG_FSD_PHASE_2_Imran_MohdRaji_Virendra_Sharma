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
<title>Admin Page</title>
</head>
<body>
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/phase2project" user="root"
			password="root" />
	<h1>Welcome to admin page!</h1>
	
	<c:if test="${'passwordchange' == param.admin_submit}">
		<c:set var="adminpassword" value="${param.adminpassword}"/>
		<sql:update dataSource="${db}" var="update">UPDATE login SET password="${adminpassword}" WHERE username="admin";</sql:update>
	</c:if>
	<sql:query dataSource="${db}" var="admin">SELECT * from login where username="admin";</sql:query>
	
	<table border="2" width="100%">
		<tr>
			<th>Admin Username</th>
			<th>Admin Password</th>
		</tr>
		<c:forEach var="table" items="${admin.rows}">
			<tr>
				<td><c:out value="${table.username}" /></td>
				<td><c:out value="${table.password}" /></td>

			</tr>
		</c:forEach>
	</table>
	
	<p>Change Admin Password?</p>
	<form action="adminlogin.jsp">
		<label for="adminpassword">Enter admin password change:</label><br>
		<input type="password" name="adminpassword" placeholder="password" id="adminpassword">
		<button type="submit" name="admin_submit" value="passwordchange">Update Admin Password</button>
	</form>
	
	<br>
	========================Login===========================
	
	
	
	
	<c:if test="${'add'==param.login_submit}">
		<c:set var="username" scope="session" value="${param.username}" />
		<c:set var="passwordlogin" scope="session" value="${param.passwordlogin}" />
		
		
		<sql:update dataSource="${db}" var="count">  
		INSERT INTO login VALUES ("${username}","${passwordlogin}");  
		</sql:update>
	   
	</c:if>
	
	<c:if test="${'delete'==param.login_submit}">
		<c:set var="userdelete" scope="session"
			value="${param.usernamedelete}" />
		<sql:update dataSource="${db}" var="count">DELETE FROM login WHERE username = ? <sql:param value="${userdelete}" />
	    </sql:update>
	</c:if>
	
	<sql:query dataSource="${db}" var="rs">  
		SELECT * from login;  
		</sql:query>
	<h3>Login Table:</h3>
	<table border="2" width="100%">
		<tr>
			<th>Username</th>
			<th>Password</th>
		</tr>
		<c:forEach var="table" items="${rs.rows}">
			<tr>
				<td><c:out value="${table.username}" /></td>
				<td><c:out value="${table.password}" /></td>

			</tr>
		</c:forEach>
	</table>
	
	
	<form action="adminlogin.jsp">
			<label for="username">Enter Username:</label> 
			<input type="text" placeholder="Enter Username/Email:" name="username" id="username"> <br> 
			
			<label for="passwordlogin">Enter Password:</label> 
			<input type="password" placeholder="Password" name="passwordlogin" id="passwordlogin"> <br> 
			
			<button type="submit" name="login_submit" value="add">Add Login</button>
	</form>
	<br>
	<form action="adminlogin.jsp">
			<label for="usernamedelete">Enter Username/email to Delete:</label> 
			<input type="text" placeholder="Enter Username/Email:" name="usernamedelete" id="usernamedelete"> <br> 
			
			<button type="submit" name="login_submit" value="delete">Delete Login</button>
	</form>

	<br>
	========================Flight===========================

	<c:if test="${'flight'== param.flight_update}">

		<c:set var="airline_name" scope="session"
			value="${param.airline_name}" />
		<c:set var="price" scope="session" value="${param.price}" />
		<c:set var="flight_number" scope="session"
			value="${param.flight_number}" />
		<c:set var="source_city" scope="session" value="${param.source_city}" />
		<c:set var="destination_city" scope="session"
			value="${param.destination_city}" />
		<c:set var="departuretime_fromsource" scope="session"
			value="${param.departuretime_fromsource}" />
		<c:set var="arrivaltime_fromdestination" scope="session"
			value="${param.arrivaltime_fromdestination}" />
		<c:set var="total_seats" scope="session" value="${param.total_seats}" />
		<c:set var="booked_seats" scope="session"
			value="${param.booked_seats}" />
		<c:set var="dateoftravel" scope="session"
			value="${param.dateoftravel}" />
		<c:set var="flight_class" scope="session"
			value="${param.flight_class}" />

		<sql:update dataSource="${db}" var="count">  
		INSERT INTO flight VALUES ("${airline_name}",${price}, ${flight_number},"${source_city}","${destination_city}","${departuretime_fromsource}","${arrivaltime_fromdestination}",${total_seats},${booked_seats},"${dateoftravel}","${flight_class}");  
		</sql:update>

	</c:if>
	
	<c:if test="${'delete'==param.flight_delete}">
		<c:set var="flightdelete" scope="session"
			value="${param.flightdelete}" />
		<sql:update dataSource="${db}" var="count">DELETE FROM flight WHERE flight_number = ? <sql:param value="${flightdelete}" />
	    </sql:update>
	</c:if>
	
	<sql:query dataSource="${db}" var="ds">SELECT * from flight;
	</sql:query>
	<h3>Flight Table:</h3>
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
	<form action="adminlogin.jsp">
			<label for="airlinename">Enter Airline name:</label> 
			<input type="text" placeholder="Airline Name" name="airline_name" id="airlinename"> <br> 
			<label for="price">Enter Price:</label> 
			<input type="number" placeholder="Price" name="price" id="price"> <br> 
			<label for="flightnumber">Enter Flight Number:</label> 
			<input type="number" placeholder="Flight Number" name="flight_number" id="flightnumber"> <br> 
			<label for="sourcecity">Enter Source City:</label> 
			<input type="text" placeholder="Source" name="source_city" id="sourcecity"> <br>
			<label for="destinationcity">Enter Destination City:</label> 
			<input type="text" placeholder="Destination" name="destination_city" id="destinationcity"> <br> 
			<label for="departuretime">Enter Departure Time (hhmmss):</label> 
			<input type="time" placeholder="Departure Time" name="departuretime_fromsource" id="departuretime" step="1"><br> 
			<label for="arrivaltime">Enter Arrival Time (hhmmss):</label> 
			<input type="time" placeholder="Arrival Time" name="arrivaltime_fromdestination" id="arrivaltime" step="1"><br>
			<label for="totalseats">Enter Total Seats:</label> 
			<input type="number" placeholder="Total Seats" name="total_seats" id="totalseats"> <br> 
			<label for="bookedseats">Enter Booked Seats:</label> 
			<input type="number" placeholder="Booked Seats" name="booked_seats" id="bookedseats"> <br> 
			<label for="dateoftravel">Enter Date of Travel (yyyy-mm-dd):</label> 
			<input type="date" placeholder="Date" name="dateoftravel" id="dateoftravel">
			<br> 
			<label for="flightclass">Enter flight class (Economy/Business):</label> 
			<input type="text" placeholder="Flight Class" name="flight_class" id="flightclass"> <br>
		<button type="submit" name="flight_update" value="flight">Update Flight</button>
	</form>

	<br>
	<form action="adminlogin.jsp">
		<label for="flightnumberdelete">Delete Flight Number:</label>
		<input type="number" placeholder="Flight Number:" id="flightnumberdelete" name="flightdelete"><br>
		<button type="submit" name="flight_delete" value="delete">Delete Flight</button>
	
	</form>
	<br>
	========================Register===========================
	<c:if test="${'add'==param.register_submit}">
		<c:set var="fullname" value="${param.fullname}"/>
		<c:set var="address" value="${param.address}"/>
		<c:set var="age" value="${param.age}"/>
		<c:set var="mobile" value="${param.mobile}"/>
		<c:set var="email_username" value="${param.email_username}"/>
		<c:set var="country" value="${param.country}"/>
		<c:set var="passport" value="${param.passport}"/>
		<sql:update dataSource="${db}" var="count">  
		INSERT INTO register VALUES ("${fullname}","${address}",${age},${mobile},"${email_username}","${country}","${passport}");  
		</sql:update>
	</c:if>
	
	
	<c:if test="${'delete'==param.register_submit}">
		<c:set var="emaildelete" scope="session"
			value="${param.emaildelete}" />
		<sql:update dataSource="${db}" var="count">DELETE FROM register WHERE username = ? <sql:param value="${emaildelete}" />
	    </sql:update>
	</c:if>


	<sql:query dataSource="${db}" var="as">SELECT * from register;
	</sql:query>
	<h3>Register Table:</h3>
	<table border="2" width="100%">
		<tr>
			<th>Full Name</th>
			<th>Address</th>
			<th>Age</th>
			<th>Mobile</th>
			<th>Username</th>
			<th>Country</th>
			<th>Passport</th>
		</tr>
		<c:forEach var="table" items="${as.rows}">
			<tr>
				<td><c:out value="${table.full_name}" /></td>
				<td><c:out value="${table.address}" /></td>
				<td><c:out value="${table.age}" /></td>
				<td><c:out value="${table.mobile}" /></td>
				<td><c:out value="${table.username}" /></td>
				<td><c:out value="${table.country}" /></td>
				<td><c:out value="${table.passport}" /></td>

			</tr>
		</c:forEach>
	</table>
	
	<form action="adminlogin.jsp">
			<label for="fullname">Enter Full name:</label> 
			<input type="text" placeholder="Full Name" name="fullname" id="fullname"> <br> 
			
			<label for="address">Enter Address:</label> 
			<input type="text" placeholder="Address" name="address" id="address"> <br> 
			
			<label for="age">Enter Age:</label> 
			<input type="number" placeholder="Age" name="age" id="age"> <br> 
			
			<label for="mobile">Enter Phone Number:</label> 
			<input type="number" placeholder="Phone Number:" name="mobile" id="mobile"> <br>
			
			<label for="email_username">Enter Username:</label> 
			<input type="text" placeholder="Username:" name="email_username" id="email_username"> <br>
			
			<label for="country">Enter Destination City:</label> 
			<input type="text" placeholder="Country" name="country" id="country"> <br>
			
			<label for="passport">Enter Passport:</label> 
			<input type="text" placeholder="Passport" name="passport" id="passport"> <br>
			
			<button type="submit" name="register_submit" value="add">Add Register</button>
	</form>
	<br>
	<form action="adminlogin.jsp">
		<label for="emaildelete">Enter username:</label> 
		<input type="text" placeholder="Delete username:" name="emaildelete" id="emaildelete"> <br> 
		<button type="submit" name="register_submit" value="delete">Delete Register</button>
	</form>
			
	========================Booking===========================
	<c:if test="${'add'==param.booking_submit}">
		<c:set var="usernamebooking" value="${param.usernamebooking}"/>
		<c:set var="flight_numberbooking" value="${param.flight_numberbooking}"/>
		<c:set var="seats" value="${param.seats}"/>
		<sql:update dataSource="${db}" var="count">  
			INSERT INTO booking (username, flight_number,seats) VALUES ("${usernamebooking}",${flight_numberbooking},${seats});    
		</sql:update>
	</c:if>
	
	
	<c:if test="${'delete'==param.booking_submit}">
		<c:set var="bookingdelete" scope="session"
			value="${param.bookingdelete}" />
		<sql:update dataSource="${db}" var="count">DELETE FROM booking WHERE booking_id = ? <sql:param value="${bookingdelete}" />
	    </sql:update>
	</c:if>
	
	
	<sql:query dataSource="${db}" var="as">SELECT * from booking;
	</sql:query>
	<h3>Booking Table:</h3>
	<table border="2" width="100%">
		<tr>
			<th>Username</th>
			<th>Flight Number</th>
			<th>Booking ID</th>
			<th>Seats</th>

		</tr>
		<c:forEach var="table" items="${as.rows}">
			<tr>
				<td><c:out value="${table.username}" /></td>
				<td><c:out value="${table.flight_number}" /></td>
				<td><c:out value="${table.booking_id}" /></td>
				<td><c:out value="${table.seats}" /></td>
			</tr>
		</c:forEach>
	</table>
	
	
	<form action="adminlogin.jsp">
			<label for="usernamebooking">Enter username:</label> 
			<input type="text" placeholder="Enter username:" name="usernamebooking" id="usernamebooking"> <br> 
			
			<label for="flight_numberbooking">Enter flight number:</label> 
			<input type="number" placeholder="Enter flight number:" name="flight_numberbooking" id="flight_numberbooking"> <br> 
			
			<label for="seats">Enter seats number:</label> 
			<input type="number" placeholder="Enter seats number:" name="seats" id="seats"> <br>
			 
			<button type="submit" name="booking_submit" value="add">Add Booking</button>
	</form>
	<br>
	<form action="adminlogin.jsp">
		<label for="bookingdelete">Enter booking id to delete:</label> 
		<input type="number" placeholder="Delete booking:" name="bookingdelete" id="bookingdelete"> <br> 
		<button type="submit" name="booking_submit" value="delete">Delete booking</button>
	</form>
</body>
</html>