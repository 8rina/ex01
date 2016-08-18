<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %> 
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw02","root","koposw");
	Statement stmt=conn.createStatement();
	
	int idx = Integer.parseInt(request.getParameter("idx"));
		   			
	String sql = "DELETE FROM gongji3 WHERE id=" + idx;	
	stmt.executeUpdate(sql);	 
%>
  	<script language=javascript>
   		location.href="list.jsp";
  	</script>
<%
	stmt.close();
	conn.close();	
%>