<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Retrieving Subjects According To Semister</title>
</head>
<body>
<% 
String semister = request.getParameter("semister");
int student_Id=(Integer)session.getAttribute("studentId");
PreparedStatement pstmt=null;
ResultSet rs=null;

if(semister.equals("1")){
	
		session.setAttribute("semister",semister);
		response.sendRedirect("markStore.jsp");
}
	
else if(semister.equals("2-1")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markStore.jsp");
}
else if(semister.equals("2-2")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markStore.jsp");

}
else if(semister.equals("3-1")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markStore.jsp");

}
else if(semister.equals("3-2")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markStore.jsp");

}
else if(semister.equals("4-1")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markStore.jsp");

}
else if(semister.equals("4-2")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markStore.jsp");

}
%>
</body>
</html>
