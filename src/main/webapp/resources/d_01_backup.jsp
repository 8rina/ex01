<!--
/////////////////////////////////////////
//Title   : 예약상황
//Date    : 2016.7.26
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
<table>
<tr><td>test</td><tr><table>
<body>

<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.110:33060/koposw02", "root","koposw");
	Statement stmt =conn.createStatement();
	
	String cTmp = request.getParameter( "name" );
	String rnameHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "date" );
	String rdateHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "addr" );
	String raddrHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "tel" );
	String rtelHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "accname" );
	String raccnameHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "comment" );
	String rcommentHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	stmt.execute("insert into room(name, rdate, roomtype, addr, tel, accname, comment) values('"+
	rnameHan +"',"+ rdateHan + "'," + 
	request.getParameter( "roomtype") +","+ raddrHan +","+ rtelHan + ","+
	raccnameHan +","+ rcommentHan +" );" );
		
	stmt.close();
	conn.close();

%>	

<table cellspacing=1 width=400 border=1>
	<tr>
		<td width=100><p align=center>이름</p></td>
		<td width=300><p align=center>
			<input type='text' name='name' value='<%=rnameHan%>' readonly></p>
		</td>
	</tr>
</table>	
