<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>check the semister</title>
</head>
<body>
<% 
String semister = request.getParameter("semister");
int student_Id=(Integer)session.getAttribute("studentId");
String studentdept=(String)session.getAttribute("deptId");

PreparedStatement pstmt=null;
ResultSet rs=null;

if(semister.equals("1")){
	
		session.setAttribute("semister",semister);
		response.sendRedirect("markSheet.jsp");
}
	
else if(semister.equals("2-1")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markSheet.jsp");
}
else if(semister.equals("2-2")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markSheet.jsp");

}
else if(semister.equals("3-1")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markSheet.jsp");

}
else if(semister.equals("3-2")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markSheet.jsp");

}
else if(semister.equals("4-1")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markSheet.jsp");

}
else if(semister.equals("4-2")){
	session.setAttribute("semister",semister);
	response.sendRedirect("markSheet.jsp");

}
else if(semister.equals("Final Degree")){
	//session.setAttribute("semister",semister);
	response.sendRedirect("finalDegree.jsp");

}
%>
</body>
</html>


