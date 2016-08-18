<!--
/////////////////////////////////////////
//Title   : 고객 예약현황 전체 조회
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
</head>
<body>
<h1>고객 예약현황<h1>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw02", "root","koposw");
	Statement stmt =conn.createStatement();
	ResultSet rset = stmt.executeQuery("select * from room;");
%>

<TABLE BORDER="2">

	<TR>
		<TD width=70><p align=center>예약번호</TD>	
		<TD width=70><p align=center>예약고객</TD>	
		<TD width=80><p align=center>날짜</TD>
		<TD width=70><p align=center>예약방</TD>
		<TD width=200><p align=center>주소</TD>
		<TD width=110><p align=center>전화번호</TD>
		<TD width=70><p align=center>입금자명</TD>
		<TD width=200><p align=center>남기는말</TD>
	</TR>


<%	
	while (rset.next()) {
		out.println("<tr>");
		out.println("<TD width=50><p align=center><a href='f_02.jsp?key="
		          +rset.getString(8)+"'>"+rset.getString(8)+"</a></p></td>");				
		out.println("<TD width=50><p align=center>"+rset.getString(1)+"</p></td>");
		out.println("<TD width=50><p align=center>"+rset.getString(2)+"</p></td>");
		out.println("<TD width=50><p align=center>"+rset.getString(3)+"</p></td>");
		out.println("<TD width=50><p align=center>"+rset.getString(4)+"</p></td>");
		out.println("<TD width=50><p align=center>"+rset.getString(5)+"</p></td>");
		out.println("<TD width=50><p align=center>"+rset.getString(6)+"</p></td>");
		out.println("<TD width=50><p align=center>"+rset.getString(7)+"</p></td>");
		out.println("<tr>");
	}
	rset.close();	
	stmt.close();
	conn.close();
%>

</body>
</html>