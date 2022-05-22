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
      <%
        String n=(String)session.getAttribute("name");
        out.println("Welcome:"+n);
     %></h2>
<h1> Welcome</h1>
<%
    String user = request.getParameter("uname");
    String pass = request.getParameter("pwd");
    session.setAttribute("name", user);
    Connection con=null;
    PreparedStatement ps1;
    try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    try
    {
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "123456");
            if(con!=null)
            {
        	   
        	   //create statement object
            ps1 = con.prepareStatement("select count(*) from login where name = ? and pass=?");
            //set form data as param value
            ps1.setString(1,user);
            ps1.setString(2,pass);
            //excute the query
            ResultSet rs = ps1.executeQuery();
            int cnt = 0;
            if (rs.next())
                cnt = rs.getInt(1);
            if(cnt == 0)
            {
                out.println("<b><i><font color=red>Invalid credential</fonr></i></b>");
                //response.sendRedirect("login.html");
            }
            else
            {
            	response.sendRedirect("Dashboard.html");
            
            }
            }
            else 
           {
        	   out.println("Error");
           }
        }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
    
 %>

</body>
</html>