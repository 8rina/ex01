<!--
/////////////////////////////////////////
//Title   : 예약사항 DB 업데이트
//Date    : 2016.7.21
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
alert("예약사항 업데이트 완료");
document.location="f_01.jsp";
</script>


</head>
<body>

<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.110:33060/koposw02", "root","koposw");
	Statement stmt =conn.createStatement();
	
	//
	// 한글이 Post/Get의 파라메터로 연동될데는 처리가 필요하다. java.net.* 임포트필요
	//
		String aid = request.getParameter("key");

	String rdate = request.getParameter( "date" );
	
	String cTmp = request.getParameter( "comment" );
	String commentHan=new String(cTmp.getBytes("8859_1"),"utf-8");	
	
	cTmp = request.getParameter( "roomtype" );
	String aroomtype=new String(cTmp.getBytes("8859_1"),"utf-8");
		
	cTmp = request.getParameter( "accname" );
	String accnameHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	stmt.execute("update room set rdate = '"+rdate+"' , roomtype = '"+aroomtype+"', comment = '"+commentHan+"', accname = '"+accnameHan+"' where id = '"+aid+"';");
	
	stmt.close();
	conn.close();
		
	
%>	


</body>
</html>