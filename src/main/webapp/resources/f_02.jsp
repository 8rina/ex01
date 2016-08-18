<!--
/////////////////////////////////////////
//Title   : 예약 수정/삭제
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
 
 <SCRIPT>

  function submitForm(mode, key)
   { 
      if(mode== "update")
	  { 
         myform.action = "f_02_update.jsp?key="+key; 
         myform.submit(); 
      }else if(mode=="delete")
	  { 
         myform.action = "f_02_delete.jsp?key="+key; 
         myform.submit(); 
      }  
	  else if(mode=="list")
	  { 
         myform.action = "f_01.jsp"; 
         myform.submit(); 
      } 
   } 
 
</SCRIPT>
</head> 
<body> 
</body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw02", "root","koposw");
	Statement stmt =conn.createStatement();
	String key = request.getParameter( "key" );
	
	ResultSet rset = stmt.executeQuery("select * from room where id = "+key+";");
	
%>

<table cellspacing=1 border=2>
<%
	while(rset.next())
	{		
	
%>

<tr>
<form method='post' name="myform">
		<td width=200px align=center>예약번호</td>
		<td width=300px align=center><input type="number" value="<%=rset.getInt(8)%>" name="id" hidden><%=rset.getInt(8)%></td>
		</tr>
		<tr>
		<td width=200px align=center>예약고객</td>
		<td align=center><input type="text" value="<%=rset.getString(1)%>" name="name" hidden><%=rset.getString(1)%></td>
		</tr>
		<tr>
		<td width=200px align=center>날짜</td>
		<td align=center><input type="text" value="<%=rset.getString(2)%>" name="date" hidden><%=rset.getString(2)%></td>  
		</tr>
		<tr>
		<td width=200px align=center>예약방</td>
		<td align=center><input cols="50" rows="10" type="roomtype" value="<%=rset.getString(3)%>" name="roomtype" hidden><%=rset.getString(3)%></td>  
		</tr>
		<tr>
		<td width=200px align=center>주소</td>
		<td align=center><input cols="50" rows="10" type="addr" value="<%=rset.getString(4)%>" name="addr" hidden><%=rset.getString(4)%></td>  
		</tr>
		<tr>
		<td width=200px align=center>전화번호</td>
		<td align=center><input cols="50" rows="10" type="tel" value="<%=rset.getString(5)%>" name="tel" hidden><%=rset.getString(5)%></td>  
		</tr>
		<tr>
		<td width=200px align=center>입금자명</td>
		<td align=center><input cols="50" rows="10" type="accname" value="<%=rset.getString(6)%>" name="accname" hidden><%=rset.getString(6)%></td>  
		</tr>
		<tr>
		<td width=200px align=center>남기는말</td>
		<td align=center><input cols="50" rows="10" type="comment" value="<%=rset.getString(7)%>" name="comment" hidden><%=rset.getString(7)%></td>  
		</tr>
		<tr>
		<br>


	<table>
	<td width=520px align=right>
	<input type=button  value="목록" OnClick="submitForm('list',0,0,0)">
	<input type=button  value="수정" OnClick="submitForm('update',<%=key%>,0,0)">
	<input type=button  value="삭제" OnClick="submitForm('delete',<%=key%>,0,0)">
	</td></table>
		
	</tr>
</FORM>
<%		
	}
	stmt.close();
	conn.close();
	rset.close();
%>	
</table>

</html>