<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw02","root","koposw");
	Statement stmt = conn.createStatement();
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	String sql = "SELECT user, title, content, date, view  FROM gongji2 WHERE id=" + idx;
	
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next())
	{
		String user = rs.getString(1);
		String title = rs.getString(2);
		String memo = rs.getString(3);
		String date = rs.getString(4);
		int view = rs.getInt(5);
		view++;
%>

<marquee behavior=alternate scrollamount="10"> 내용 보기 </marquee>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title> 게시글 보기</title>
</head>

 <body>
 
<form name=deleteform method=post action="delete.jsp?idx=<%=idx%>"> <!--삭제-->
<form name=replyform method=post action="reply.jsp?idx=<%=idx%>"> <!--답글-->

  <tr>
   <table width="420">
    <tr height="3" bgcolor="#A566FF"><td colspan="4" width="410"></td></tr>
	<tr height="1" bgcolor="#9FC93C"><td colspan="4" width="410"></td></tr>
     
	 <tr>	 
      <td width="0">&nbsp </td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx%></td>
      <td width="0">&nbsp </td>
     </tr>
	 
	 <tr height="1" bgcolor="#9FC93C"><td colspan="4" width="410"></td></tr>
	 
     <tr>
      <td width="0">&nbsp </td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=view%></td>
      <td width="0">&nbsp </td>
     </tr>
	 
	 <tr height="1" bgcolor="#9FC93C"><td colspan="4" width="410"></td></tr>
	 
     <tr>
      <td width="0">&nbsp </td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=user%></td>
      <td width="0">&nbsp </td>
     </tr>
	 
     <tr height="1" bgcolor="#9FC93C"><td colspan="4" width="410"></td></tr>
	 
     <tr>
      <td width="0">&nbsp </td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=date%></td>
      <td width="0">&nbsp </td>
     </tr>
	 
      <tr height="1" bgcolor="#9FC93C"><td colspan="4" width="410"></td></tr>
    
	 <tr>
      <td width="0">&nbsp </td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=title%></td>
      <td width="0">&nbsp </td>
     </tr>
     
	 <tr height="1" bgcolor="#9FC93C"><td colspan="4" width="410"></td></tr>
     
	 <tr>
	  <td width="0"></td>
      <td width="399" colspan="2" height="200"> <%=memo%> </td>
     </tr>
<% 
 	sql = "UPDATE gongji2 SET view=" + view + " where id=" +idx;
 	
	stmt.executeUpdate(sql);
 	
	rs.close();
 	stmt.close();
 	conn.close();
	} 
%>
     <tr height="1" bgcolor="#9FC93C"><td colspan="4" width="410"></td></tr>
     <tr height="3" bgcolor="#A566FF"><td colspan="4" width="410"></td></tr>
     
	 <tr align="center">
      <td width="0">&nbsp </td>
      <td colspan="2" width="399"><input type=button value="글쓰기"  OnClick="window.location='write.jsp'">
	<input type=button value="목록" OnClick="window.location='list.jsp'">
	<input type=button value="수정" OnClick="window.location='modify.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="답글" OnClick="window.location='reply.jsp?idx=<%=idx%>&pg=<%=pg%>'">
      <td width="0">&nbsp </td>
     </tr>
    </table>
   </td>
  </tr>
</form>
</form>
 
 </body>

</html>