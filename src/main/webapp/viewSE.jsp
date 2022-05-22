<%@ page import="java.sql.*"%>
<%@ page import ="java.util.*"%>
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
	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "123456");
	    st=con.createStatement();
        String sql="select *from Student where Class='SE'";
		ResultSet rs=st.executeQuery(sql);
	 %>

<Table border="1">
	 <tr>
	 <th>Id</th>
	 <th>First Name</th>
	 <th>Last Name</th>
	 <th>DOB</th>
	 <th>Address</th>
	 <th>Phone</th>
	 <th>Class</th>
	
	 </tr>
	 
	 <%while(rs.next()){%> 
	 			<tr>
	 			<td><%=rs.getInt(1)%></td>
	 			<td><%=rs.getString(2)%></td>
	 			<td><%=rs.getString(3)%></td>
	 			<td><%=rs.getString(4)%></td>
	 			<td><%=rs.getString(5)%></td>
	 			<td><%=rs.getString(6)%></td>
	 			<td><%=rs.getString(7)%></td>
	 			
	 			</tr>
	 	<%}%>
	 </Table>

</body>
</html>      

</html>