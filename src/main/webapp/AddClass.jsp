<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
        String classname=request.getParameter("classname");
	    Connection con=null;
	    PreparedStatement pstate;
	    Statement st;
	    try{
	    	Class.forName("com.mysql.jdbc.Driver");
		    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "123456");
		    pstate=con.prepareStatement("SELECT id FROM classes",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		   // pstate.setString(1,classname);
		    ResultSet rs=pstate.executeQuery();
		    int id=0;
		    if(rs.last()){
		    id=rs.getInt("id")+1;
	    }
	    
        String sql="insert into classes values('"+id+"','"+classname+"')";
		int row=pstate.executeUpdate(sql);
		if(row>0)
		{
			out.println("Data saved successfully");
		}
	    }catch(ClassNotFoundException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    }
	 %>   
</body>
</html>