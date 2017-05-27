<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>student Id validation at Admin page</title>
</head>
<body>
<%
String studentId= request.getParameter("student_id");
int id= Integer.parseInt(studentId);
Connection con=JdbcConnection.getCon();
String retriveStudentLogins="select studentdetails.student_id,studentdetails.student_FirstName,studentdetails.EmailId,departments.departmentId,departments.departmentName,courses.courseId,courses.courseName from studentdetails INNER JOIN departments ON studentdetails.departmentId=departments.departmentId INNER JOIN courses ON studentdetails.courseId=courses.courseId where student_id=?";
PreparedStatement pstmt=null;
ResultSet rs=null;
	pstmt=con.prepareStatement(retriveStudentLogins);             //these  prepareStatement,Statement,CallableStatements - these all are interfaces by using this we can communicate with tables in database for inserting data into table and retrieving data from database by 'select' command   ,these can even used for storing data into tables and retrieve data from tables
	pstmt.setInt(1, id);
	rs=pstmt.executeQuery();
			
		if(rs.next()){
			session.setAttribute("studentId",id);
			session.setAttribute("studentDept",rs.getString(3));
			session.setAttribute("studentCourseStream",rs.getString(5));
			session.setAttribute("studentemail",rs.getString(3));
		response.sendRedirect("studentCurrentAcademicDetailsStore.jsp");
		}
		else{
		response.sendRedirect("adminHome.jsp?msg=You have entered an invalid registration number or he doesnt belong to your department");
		}

%>
</body>
</html>