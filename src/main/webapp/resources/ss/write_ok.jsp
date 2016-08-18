<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<html>
<head>
<script>
alert("게시글 작성 완료");
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver"); 		
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw02","root","koposw");
	Statement stmt=conn.createStatement();

	String user = request.getParameter("user");   //write.jsp에서 name에 입력한 데이터값
	String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
	String memo = request.getParameter("content");   //write.jsp에서 memo에 입력한 데이터값
	
	int max = 0;
	
	String sql_1 = "SELECT MAX(id) FROM gongji2";
	ResultSet rs = stmt.executeQuery(sql_1);
	
	if(rs.next())
	{
		max=rs.getInt(1);
	}
	
	String sql_2 = "INSERT INTO gongji2(user,title,content,date,ref) VALUES(?,?,?,now(),?)";
	PreparedStatement pstmt = conn.prepareStatement(sql_2);
	
	pstmt.setString(1, user);
	pstmt.setString(2, title);
	pstmt.setString(3, memo);
	pstmt.setInt(4, max+1);
	
	pstmt.execute();
	
	pstmt.close();
	rs.close();
	stmt.close();
	conn.close();
%>
 
 <script language=javascript>  
   location.href="list.jsp"; 
 </script>
 </html>