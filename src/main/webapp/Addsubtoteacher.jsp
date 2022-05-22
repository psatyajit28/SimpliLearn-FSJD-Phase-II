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
        String sub=request.getParameter("sub");
        String Teacher=request.getParameter("Teacher");
	    Connection con=null;
	    Statement st;
	   
	    	Class.forName("com.mysql.jdbc.Driver");
		    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "123456");
		    PreparedStatement state=con.prepareStatement("SELECT id FROM SE",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs=state.executeQuery();		    
            int id=0;
		    if(rs.last()){
		    id=rs.getInt("id")+1;
	        }
	    
        String sql="insert into SE values('"+id+"','"+sub+"','"+Teacher+"')";
		int row=state.executeUpdate(sql);
		if(row>0)
		{
			out.println("Data saved successfully");
			String sql1="select *from SE";
			rs=state.executeQuery(sql1);
		}%>
		 <Table border="1">
	 <tr>
	 <th>Id</th>
	 <th>Subject</th>
	 <th>Teacher</th>
	 </tr>
	 
	 <%while(rs.next())
	 {%> 
	 			<tr>
	 			<td><%=rs.getInt(1)%></td>
	 			<td><%=rs.getString(2)%></td>
	 			<td><%=rs.getString(3)%></td>
	 			<td><a href="Delete.html"></a></td></tr>
	 <%}%>
	 </Table>
</body>
</html>
	 			
	    