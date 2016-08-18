<%@page import="java.io.*, java.sql.*,javax.sql.*,java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>
<%
Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE));
	
%>
예약하기
<table>
<tr>><td></td><td>날짜</td><td>숙박일</td><td>인원수</td><td>장소</td><td>회원번호</td></tr>
<form method="post" action="book_go.jsp">
<tr>
<td>
숫자만 입력하시오 예:</td><td><input type="number" name="date" value="20160705" cols="10"></td>
<td><input type="number" name="sleep" value="1"></td>
<td><input type="number" name="person" value="1" size=10></td>
<td><select name="place"> <%--장소에 대한 라디오 버튼 --%>
<option value="네오방"  selected>네오방</option> <!- 이것은 html 주석임 ->
<option value="프로도방" >프로도방</option>
<option value="제이지방">제이지방</option>
</select>
<td><input type="text" name="id" value="" size=10></td>
</tr>
<tr>
<td colspan=5 ailgn=right><input type=submit  value='예약하기'></td>
</tr>

</form>
</table>
</body>
</html>