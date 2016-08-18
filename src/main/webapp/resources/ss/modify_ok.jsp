<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date, javax.sql.*, java.net.*, java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw02","root","koposw");
Statement stmt = conn.createStatement();

int idx = Integer.parseInt(request.getParameter("idx"));

String title = request.getParameter("title");
String memo = request.getParameter("content");
String sql = "UPDATE gongji2 SET TITLE='" + title+ "' ,content='"+ memo +"' WHERE id=" + idx;				

stmt.executeUpdate(sql);				
%>

<script language=javascript>
location.href="list.jsp"; 
</script>