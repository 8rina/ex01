<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>

<!--alter table gongji auto_increment=1;-->

<H1><b><center>공지사항</center></b></H1>
<%
	final int ROWSIZE = 5;  // 한페이지에 보일 게시물 수
	final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

	int pg = 1; //기본 페이지값
	
	if(request.getParameter("pg")!=null) 
	{ //받아온 pg값이 있을때, 다른페이지일때
		pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
	}
	
	int start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2)
	int endpg = (pg*ROWSIZE); // 해당페이지에서 끝번호(step2)
	
	int allPage = 0; // 전체 페이지수
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)

%>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>	
	<title> 게시판 목록</title>
</head>	
 <body>

<section >
<div class="listSection">
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://192.168.23.110:8181/koposw02","root","koposw");
	Statement stmt=conn.createStatement();

	int total = 0;

	Statement stmt1 = conn.createStatement();
	String sql = "";

	String sqlCount = "SELECT COUNT(*) FROM gongji2";
	ResultSet rs = stmt.executeQuery(sqlCount);

	if(rs.next())
	{
		total = rs.getInt(1);
	}

	int sort=1;

	String sqlSort = "SELECT id from gongji2 order by ref desc, step asc";
	rs = stmt.executeQuery(sqlSort);

	while(rs.next())
	{
		int stepNum = rs.getInt(1);
		sql = "UPDATE gongji2 SET STEP2=" + sort + " where id=" +stepNum;
		stmt1.executeUpdate(sql);
		sort++;
	} 

	allPage = (int)Math.ceil(total/(double)ROWSIZE);

	if(endPage > allPage)
	{
		endPage = allPage;
	}

	out.print("총 게시물 : " + total + "개");

	String seeall = "select id, user, title, date,view,indent from gongji2 where STEP2 >="+start + " and STEP2 <= "+ endpg +" order by step2 asc";
	
	rs = stmt.executeQuery(seeall);
%>

<table width="700" cellpadding="0" cellspacing="0" border="0">
<tr height="3" bgcolor="#A566FF"><td colspan="6"></td></tr>
 <tr>
   <td width="50">번호</td>
   <td width="50">제목</td>
   <td width="70">작성자</td>
   <td width="90">작성일</td>
   <td width="80">조회수</td>
   <tr height="3" bgcolor="#9FC93C"><td colspan="6"></td></tr>
  </tr>
  
  <!--작성글이 없을 경우 아래의 '등록된 글이 없습니다' 가 나온다.-->
  <!--글이 작성되면 else문장으로 들어가서 글 번호, 제목, 작성자, 작성일, 조회수가 나온다.-->
<%
	if(total==0) 
	{
%>	 	
	<tr align="center" bgcolor="#FAF4C0" height="30">
		<td colspan="6">등록된 글이 없습니다.</td>
	</tr>
<%
	} 
	
	else 
	{		
		while(rs.next()) 
		{
			int idx = rs.getInt(1);
			String name = rs.getString(2);
			String title = rs.getString(3);
			String time = rs.getString(4);
			
			int hit = rs.getInt(5);
			int indent = rs.getInt(6);
%>
	<tr height="10" align="left">
		<td width="60"> <%=idx%> </td>
		<td align="left">
<% 
	for(int j=0;j<indent;j++)
	{
%> →
<!--원글에 댓글 첫 번째는 →가 1개, 원글에 댓글에 댓글은 →가 2개-->
<%
	}
%> 

<a href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title %></a>

</td>
	<td width="20" align="left"><%=name%></td>
	<td width="20" align="left"><%=time%></td>
	<td width="20" align="left"><%=hit%></td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
%>
 <tr height="3" bgcolor="#A566FF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="200" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr>
	<td align="center">
		<%
			if(pg>BLOCK) 
			{
		%>
			[<a href="list.jsp?pg=1">◀◀</a>]
			[<a href="list.jsp?pg=<%=startPage-1%>">◀</a>]
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= endPage; i++)
			{
				if(i==pg)
				{
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}
				else
				{
		%>
					[<a href="list.jsp?pg=<%=i %>"><%=i %></a>]
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			[<a href="list.jsp?pg=<%=endPage+1%>">▶</a>]
			[<a href="list.jsp?pg=<%=allPage%>">▶▶</a>]
		<%
			}
		%>
		</td>
		</tr>
		  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>
  </tr> 
</table>
</div>
	</section>
</body> 
</html>