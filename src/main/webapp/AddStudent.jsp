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
        String id=request.getParameter("id");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String dob=request.getParameter("dob");
        String addrs=request.getParameter("addrs"); 
        String ph=request.getParameter("ph");
        String cls=request.getParameter("cl");
        
	    Connection con=null;
	    Statement st;
	    Class.forName("com.mysql.jdbc.Driver");
	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "123456");
	    st=con.createStatement();
        String sql="insert into Student values('"+id+"','"+fname+"','"+lname+"','"+dob+"','"+addrs+"','"+ph+"','"+cls+"')";
		int row=st.executeUpdate(sql);
		if(row>0)
		{
			response.sendRedirect("Students.jsp");
					}%>
</body>
</html>