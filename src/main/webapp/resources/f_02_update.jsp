<!--
/////////////////////////////////////////
//Title   : 예약 업데이트
//Date    : 2016.7.27
//Author  : 고항석
//comment : 실습규칙2
//
///////////////////////////////////////////
-->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%> 
<%@ page contentType="text/html; charset=UTF-8"%> 

<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
 <!--
 function submitForm(mode){
   fm.action = "f_02_updateok.jsp";   fm.submit();
 }
 //-->
</script>
</head>
<body>

<%
	Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw02", "root", "koposw"); 
    Statement stmt = conn.createStatement(); 
    	
//	String roomtype="", accname="", date="", comment="";
		
	String key = request.getParameter( "key" );
	String rdate = request.getParameter( "date" );
	String cTmp = request.getParameter( "accname" );
	String accnameHan=new String(cTmp.getBytes("8859_1"),"utf-8");	
	cTmp = request.getParameter( "comment" );
	String commentHan=new String(cTmp.getBytes("8859_1"),"utf-8");	
	cTmp = request.getParameter( "roomtype" );
	String roomtype=new String(cTmp.getBytes("8859_1"),"utf-8");	
	java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd");
	String todate = formatter.format(new java.util.Date());
	
%>

<FORM METHOD=POST name='fm'>
<table cellspacing=0 width=600 border=1>
	
	<tr>
		<td width=50><p align=center><b>예약번호</b></p></td>
		<td width><input type=text name=key size=70 readonly value="<%=key%>"></td>
	</tr>
	
	<tr>
    	<td><p align=center><b>날짜</b></p></td>
		<td width><input type=text name=date size=70 value="<%=rdate%>" maxlength=70 ></td>
	</tr>
	 
	 
	 <tr>
							<td width="100">
								<p align="center"><b>예약방</b></p>
							</td>
							<td width="500">
								<select name="roomtype">
									<option value="토끼방_">토끼방</option>
									<option value="사슴방_">사슴방</option>
									<option value="곰방_">곰방</option>
								</select>
							</td>
						</tr>

	 
    <tr>
    	<td><p align=center><b>입금자명</b></p></td>
		<td><input type=text name=accname size=70 row=600 value="<%=accnameHan%>" maxlength=500 ></td>
	</tr>
	 
	<tr>
    	<td><p align=center><b>남기는말</b></p></td>
		<td width><input type=text name=comment size=70 value="<%=commentHan%>" maxlength=70 ></td>
	</tr>	
	
    </table>
	<table width=603>
	<tr>
		<td width=600></td>
		<td><input type=button value="취소" OnClick="location.href='f_01.jsp'"></td>
		<td><input type=button value="쓰기" OnClick="submitForm('write')"></td>
	</tr>
	</table>
</body>
</html>

