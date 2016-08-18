<!--
/////////////////////////////////////////
//Title   : 예약상황
//Date    : 2016.7.26
//Author  : 고항석
//comment : 실습규칙2
//
///////////////////////////////////////////
-->


<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.util.*" %>
<html> 
<head> 
   <style> 
   a.y1{position:absolute; top:10px; left:50px; color:red; font-weight:bold;} 
   img.y2{position:absolute; top:10px; left:900px; } 
   a.y3{position:relative:10px; left:900px; } 
      table{position:absolute; top:40px; left:10px; font-size:20px;} 
    
   </style> 
</head> 

<a class="y1">예약상황</a> 
<%    
   Class.forName("com.mysql.jdbc.Driver"); 
   Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.110:33060/koposw02", "root","koposw"); 
   Statement stmt =conn.createStatement(); 
   String sql=null; 
   int day=0;//day는 30일까지 출력하기 위한 변수 
%> 
<table border="1"> 
<tr> 
 
</tr> 
<% 
   while(day<30) 
   { 
      if(day%7==0){ 
%> 
<tr> 
<% 
      }else{} 
   sql="select curdate()+ interval "+day+" day from dual;"; 
   ResultSet rset=stmt.executeQuery(sql); 
   rset.next(); 
%> 
<td><%=rset.getString(1)%> 
<%  
   sql=" select count(distinct roomtype) from room where not roomtype "+ 
   "in ( select roomtype from room where rdate = curdate()+ interval "+day+" day);";//빈 방의 갯수세기 
   rset = stmt.executeQuery( sql ); 
   rset.next(); 
   int none= rset.getInt(1); 
    
   sql="select roomtype,name from room where rdate=curdate()+ interval "+day+" day;"; 
   rset =stmt.executeQuery( sql ); 
%>    
   <br> 
<% 
   while(rset.next()){       
%> 
   <%=rset.getString(1)%><%=rset.getString(2)%><br> 
 <%             
   } 
   if(none>0){ 
      sql="select distinct roomtype from room where not roomtype in ( select roomtype from room where rdate = curdate()+ interval "+day+" day);"; 
      rset = stmt.executeQuery(sql); 
   while(rset.next()){    
%> 
   <a class="y3" href="d_02.jsp?date=<%=day%>"><예약가능></a><br> 
<%       
      } 
   } 
%> 
</td> 
<% 
if(day%7==6){ 
%> 
</tr> 
<% 
} 
else{} 
   day++; 
    rset.close(); 
   } 
   stmt.close(); 
   conn.close(); 
 
%>    
</body> 
</html> 
</body> 
</html> 