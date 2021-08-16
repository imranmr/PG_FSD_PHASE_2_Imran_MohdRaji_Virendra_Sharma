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
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/phase2project" user="root" password="root" />
<H3>Processing flight purchase....</H3>

<sql:update dataSource="${db}" var="ls">INSERT INTO booking (username, flight_number, seats) VALUES ("${username}",${flightbuy},${seatsset});</sql:update>
<sql:update  dataSource="${db}" var="bs">UPDATE flight SET booked_seats=(booked_seats+${seats}) where flight_number=${flightbuy};</sql:update>
<sql:update dataSource="${db}" var="ds">insert into register values ("${param.full_name}","${param.address}",${param.age},${param.mobile},"${username}","${param.country}","${param.passport}");</sql:update>

<c:redirect url="/successfulbuy.jsp"/>
</body>
</html>