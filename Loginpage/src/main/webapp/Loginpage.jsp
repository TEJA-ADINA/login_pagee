<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.lang.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<%
  
String username=request.getParameter("username");
String password=request.getParameter("password");

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("regitered");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Tejaadina@2002");
	System.out.println("connected");
	
	Statement stmt=con.createStatement();
	
	ResultSet rs=stmt.executeQuery("select *from login where name='"+username+"' and password='"+password+"'");
	
	if(rs.next())
	{
		%>
		<script>
		window.alert("Login Successful");
		window.location="Home.jsp";
		</script>
		<%
	}
	
	else
	{
		%>
		<script>
		window.alert("Login failed");
		window.location="Login.html";
		</script>
		
		<%
	}
	
	con.close();
}

catch(Exception e)
{
	System.out.println(e);
}

%>