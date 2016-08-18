<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<%
	request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw02","root","koposw");
	Statement stmt = conn.createStatement();

	String user = request.getParameter("user");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	int ref = 0;
	int indent = 0;
	int step = 0;
		
	String sql = "SELECT REF, INDENT, STEP FROM gongji3 WHERE id=" + idx;
	ResultSet rs = stmt.executeQuery(sql);
		
	if(rs.next())
	{
		ref = rs.getInt(1);
		indent = rs.getInt(2);
		step = rs.getInt(3);
	} 

	sql = "UPDATE gongji3 SET STEP=STEP+1 where REF="+ref+" and STEP>" +step; 

	stmt.executeUpdate(sql);
	
	sql = "INSERT INTO gongji3(USER,TITLE,content,DATE,REF,INDENT,STEP) "+
			"values(?,?,?,now(),?,?,?)";
			
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, user);
	pstmt.setString(2, title);
	pstmt.setString(3, content);
	pstmt.setInt(4, ref);
	pstmt.setInt(5, indent+1);
	pstmt.setInt(6, step+1);
		
	pstmt.execute(); 
	rs.close();
	stmt.close();
	pstmt.close();
	conn.close();
%>
<script language=javascript>
   location.href="list.jsp"; 
</script>