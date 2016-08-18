<!--
/////////////////////////////////////////
//Title   : DB 레코드 삭제
//Date    : 2016.7.27
//Author  : 고항석
//comment : 실습규칙2
//
///////////////////////////////////////////
-->


<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<script>
alert("예약삭제 완료");

</script>
</head>
<body>
<h1>레코드 삭제<h1>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.110:33060/koposw02", "root","koposw");
	Statement stmt =conn.createStatement();
	
	String key = request.getParameter( "key" );
			
	stmt.execute("delete from room where id='"+key+"';"); 
	
	stmt.close();
	conn.close();
	
%>

<script language=javascript>
	location.href="f_01.jsp";
</script>