<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<script language = "javascript">  // 자바 스크립트 시작
function writecheck()
  {
   var form = document.writeform;
      
   if( !form.title.value ) // form 에 있는 title 값이 없을 때
   {
    alert( "제목을 적어주세요" ); // 경고창 띄움
    form.title.focus(); // form 에 있는 title 위치로 커서가 이동
    return;
   }
   
   if( !form.user.value )   
   {
    alert( "이름을 적어주세요" ); 
    form.name.focus();   
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

<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head> <title>게시글 글 쓰기</title> </head>	
<body>
<marquee behavior=alternate scrollamount="10"> 게시글 작성 </marquee>
<table>

<form name=writeform method=post action="write_ok.jsp">
  <tr>
    <table>
	 <tr height="2" bgcolor="#A566FF"><td colspan="4"></td></tr>
	 <tr height="1" bgcolor="#9FC93C"><td colspan="4"></td></tr>
	
	 <tr>
	  <td align="center" bgcolor="#F2CB61">*</td>
	  <td>는 필수 입력 사항 입니다.</td>
	 </tr>
	
	<tr height="1" bgcolor="#9FC93C"><td colspan="4"></td></tr>
	
     <tr>
      <td>&nbsp </td>
      <td align="left">제목(50 Byte)*</td>
      <td><input name="title" size="50" maxlength="100"></td>
     </tr>
	 
     <tr height="1" bgcolor="#9FC93C"><td colspan="4"></td></tr>
	 
     <tr>
      <td>&nbsp </td>
      <td align="left">이름(10 Byte)*</td>
      <td><input name="user" size="50" maxlength="50"></td>
     </tr>
	 
     <tr height="1" bgcolor="#9FC93C"><td colspan="4"></td></tr>
    
     <tr>
      <td>&nbsp </td>
      <td align="left">내용(50 Byte)*</td>
      <td><textarea name="content" cols="50" rows="20"></textarea></td>
     </tr>
	 
     <tr height="1" bgcolor="#9FC93C"><td colspan="4"></td></tr>
     <tr height="2" bgcolor="#A566FF"><td colspan="4"></td></tr>
	</table>
	
	<table width=500 border=0>
		<td width=450px align=right>
		<input type=button value="등록" OnClick="writecheck();">
		</td>
		<td width=450px align=left>
		<input type=button value="취소" OnClick="window.location='list.jsp'"/>
		</td>
	</table>
	
  </tr>
</form>
  
 </table>
 
</body>
</html>