<!--
/////////////////////////////////////////
//Title   : 예약완료
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

<body>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.110:33060/koposw02", "root","koposw");
	Statement stmt =conn.createStatement();
	
	String cTmp = request.getParameter( "name" );
	String rnameHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	String edate= request.getParameter( "date" );
	String rdateHan=new String(edate.getBytes("8859_1"),"utf-8");
	
	cTmp = request.getParameter( "roomtype" );
	String roomtypeHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "addr" );
	String raddrHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "tel" );
	String rtelHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "accname" );
	String raccnameHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	cTmp= request.getParameter( "comment" );
	String rcommentHan=new String(cTmp.getBytes("8859_1"),"utf-8");
	
	if(rdateHan.length()<8) {
%>
 <script>
   alert("날짜 입력방식은 20160801 입니다");
   document.location="d_02.jsp";
 </script>
<%
	return;
	}
%>	
<%

	if(rnameHan.length()<1) {
%>
<script>
   alert("이름을 입력하십시오");
   document.location="d_02.jsp";
 </script>


<%	
	return;
	}
	
	stmt.execute("insert into room(name, rdate, roomtype, addr, tel, accname, comment) values('"+
	rnameHan+"' , '"+rdateHan+"' , '"+ 
	roomtypeHan+"' , '"+raddrHan+"' , '"+rtelHan+"' , '"+
	raccnameHan+"' , '"+rcommentHan+"' );" );
		
	stmt.close();
	conn.close();

%>	
<script>
alert("예약완료 완료");
</script>
 <script language=javascript>  
   location.href="d_01.jsp"; 
 </script>
</body>
</html>