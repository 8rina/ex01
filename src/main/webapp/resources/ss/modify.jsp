<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<script language = "javascript">  // 자바 스크립트 시작

function modifycheck()
  {
   var form = document.modifyform;
      
  if( !form.title.value )
   {
    alert( "제목을 수정 해 주세요" );
    form.title.focus();
    return;
   }
 
    if( !form.user.value )
   {
    alert( "이름을 적어주세요" );
    form.user.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "내용을 수정 해 주세요" );
    form.content.focus();
    return;
   }  
 		form.submit();
  } 
</script>

<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw02","root","koposw");
Statement stmt = conn.createStatement();

String user = request.getParameter("user");   //write.jsp에서 name에 입력한 데이터값
String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
String content = request.getParameter("content");   //write.jsp에서 content에 입력한 데이터값

int idx = Integer.parseInt(request.getParameter("idx"));

String sql = "SELECT user,title, content FROM gongji2 WHERE id=" + idx;
ResultSet rs = stmt.executeQuery(sql);
	
if(rs.next())
{
	user = rs.getString(1);
	title = rs.getString(2);
	content = rs.getString(3);
}
	
rs.close();
stmt.close();
conn.close();
%>

<html>
 <head>
 <title>게시글 수정</title>
 </head>
 <marquee behavior=alternate scrollamount="10"> 게시글 수정 </marquee>
 <body>
<table>
	<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>">
		<tr>
			<table>
				<tr height="3" bgcolor="#A566FF"> <td colspan="4"> </td> </tr>
				<tr height="1" bgcolor="#9FC93C"> <td colspan="4"> </td> </tr>
					<tr>
						<td>&nbsp </td>
						<td align="center">제목</td>
						<td><input name="title" size="50" maxlength="100"></td>
						<td>&nbsp </td>
					</tr>	 
				
				<tr height="1" bgcolor="#9FC93C"> <td colspan="4"> </td> </tr>
					
					<tr>
						<td>&nbsp </td>
						<td align="center">이름</td>
						<td><input name="user" size="50" maxlength="50"></td>
						<td>&nbsp </td>
					</tr>
					
				<tr height="1" bgcolor="#9FC93C"> <td colspan="4"> </td> </tr>
					
					<tr>
						<td>&nbsp </td>
						<td align="center">내용</td>
						<td><textarea name="content" cols="50" rows="13"></textarea></td>
						<td>&nbsp </td>
					</tr>
					
				<tr height="1" bgcolor="#9FC93C"> <td colspan="4"> </td> </tr>
				<tr height="3" bgcolor="#A566FF"> <td colspan="4"> </td> </tr>
				
				<table width=500 border=0>
					<td width=450px align=right>
					<input type=button value="수정" OnClick="modifycheck();">
					</td>
					<td width=450px align=left>
					<input type=button value="취소" OnClick="window.location='list.jsp'">
					</td>
				</table>			
		</tr>
	</form>
			</table>
</table>
</body> 
</html>