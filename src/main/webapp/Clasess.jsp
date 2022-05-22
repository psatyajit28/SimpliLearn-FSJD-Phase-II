<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 Table{
 border:1px solid;
  }
 
</style>
</head>
<body>
  <h2 align="right">
     Welcome, <%=session.getAttribute("name")%></h2>

    <br>
      <a href="Clasess.jsp">Classes</a>
      <a href="Subjects.html">Subjects</a>
      <a href="Students.jsp">Students</a>
      <a href="Teachers.jsp">Teachers</a>
      <a href="logout.jsp">Logout</a>
      
      <h1>List of Classes</h1>
      <form action="AddClass.html" method="post">
      <input type= "submit" value="Add New Classes">
      </form>
      <br>
     
     <%
	    Connection con=null;
	    Statement st;
	    Class.forName("com.mysql.jdbc.Driver");
	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "123456");
	    st=con.createStatement();
        String sql="select *from classes";
		ResultSet rs=st.executeQuery(sql);
	 %>
	 <Table border="1">
	 <tr>
	 <th>Id</th>
	 <th>Class Name</th>
	 <th>Actions</th>
	 </tr>
	 
	 <%while(rs.next())
	 {%> 
	 			<tr>
	 			<td><%=rs.getInt(1)%></td>
	 			<td><%=rs.getString(2)%></td>
	 			<td><a href="Edit.html">Edit</a> <a href="Delete.html">Delete</a> <a href="subject&teachers.html">Subjects and Teachers</a><a href="Report.jsp">Class Report</a><a href="viewSE.jsp">view student list</a></td>
	 			</tr>
	 	<%}%>
	 </Table>
</body>
</html>
