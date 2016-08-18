<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<script language = "javascript"> // 자바 스크립트 시작

function replycheck()
  {
   var form = document.replyform;
   
   if( !form.user.value )   // form 에 있는 user 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.user.focus();   // form 에 있는 user 위치로 이동
    return;
   }
   
  if( !form.title.value )
   {
    alert( "댓글의 제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.content.focus();
    return;
   }
 
  form.submit();
  }
</script>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw02","root","koposw");
	Statement stmt=conn.createStatement();
	
 	int idx = Integer.parseInt(request.getParameter("idx"));
		
	String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
		
	String sql = "SELECT title FROM gongji2 WHERE id=" + idx;
	ResultSet rs = stmt.executeQuery(sql);

 	if(rs.next())
	{
		title = rs.getString(1);
 	}

	rs.close();
	stmt.close();
	conn.close();
%>

<html>
 <head>
 <title>답글 작성</title>
 </head>
 
<body>
	<table>
		<form name=replyform method=post action="reply_ok.jsp?idx=<%=idx%>">
			<tr>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="5"></td>
						<td>답글</td>
						<td width="5"></td>
					</tr>
				</table>

				<table>
					<tr height="3" bgcolor="#A566FF"><td colspan="4"></td></tr>	
					<tr height="1" bgcolor="#CEF279"><td colspan="4"></td></tr>
						
						<tr>
							<td>&nbsp </td>
							<td align="center">제목</td>
							<td><input name="title" size="50" maxlength="100" value ="<%=title%>"></td>
							<td>&nbsp </td>
						</tr>
					
					<tr height="1" bgcolor="#CEF279"><td colspan="4"></td></tr>
			
						<tr>
							<td>&nbsp </td>
							<td align="center">이름</td>
							<td><input name="user" size="50" maxlength="50"></td>
							<td>&nbsp </td>
						</tr>
							
					<tr height="1" bgcolor="#CEF279"><td colspan="4"></td></tr>
     
						<tr>
							<td>&nbsp </td>
							<td align="center">내용</td>
							<td><textarea name="content" cols="50" rows="13"></textarea></td>
							<td>&nbsp </td>
						</tr>
							
					<tr height="1" bgcolor="#CEF279"><td colspan="4"></td></tr>
					<tr height="3" bgcolor="#A566FF"><td colspan="4"></td></tr>	
						
					<tr align="center">
						<td>&nbsp </td>
						<td colspan="2"><input type=button value="등록"  OnClick="replycheck();">
						<input type=button value="취소" OnClick="history.back(-1)"></td>
						<td>&nbsp </td>
					</tr>	
				</table>
			</tr>
		</form>	
	</table>
</body>

</html>