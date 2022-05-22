<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="right">
     Welcome, <%=session.getAttribute("name")%></h2>
<a href="Clasess.jsp">Classes</a>
      <a href="Subjects.html">Subjects</a>
      <a href="Students.jsp">Students</a>
      <a href="Teachers.jsp">Teachers</a>
      <a href="logout.jsp">Logout</a>

<%
    Connection con=null;
	    Statement st;
	    Class.forName("com.mysql.jdbc.Driver");
	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root","123456");
	    st=con.createStatement();
	   // String q="Delete *from SE Where Subjects is null";
	   // st.executeUpdate(q);
        String sql="select *from SE";
		ResultSet rs=st.executeQuery(sql);
	 %>
	 <Table border="1">
	 <tr>
	 <th>Id</th>
	 <th>Class Name</th>
	 <th>Teacher Name</th>
	 </tr>
	 
	 <%while(rs.next())
	 {%> 
	 			<tr>
	 			<td><%=rs.getInt(1)%></td>
	 			<td><%=rs.getString(2)%></td>
	 			<td><%=rs.getString(3)%></td>
	 			</tr>
	 	<%}%>
	 </Table>
</body>
</html>
	 			