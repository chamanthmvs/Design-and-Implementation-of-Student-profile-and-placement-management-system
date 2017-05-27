<%@page import="java.util.Enumeration"%>
<%@ page language="java" import="java.sql.*,java.lang.Enum,com.JdbcConnection.JdbcConnection,java.io.PrintWriter" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Current Academics Insertion</title>
</head>
<body>
<% 
int student_Id=(Integer)session.getAttribute("studentId");
String studentDept=(String)session.getAttribute("studentDept");
String studentCourse=(String)session.getAttribute("studentCourseStream");
String semister=(String)session.getAttribute("semister");

PreparedStatement pst=null;
	
	try{
		Connection con = JdbcConnection.getCon();
		pst = con.prepareStatement(
				"insert into studentcredits(studentId,subjectId,departmentId,courseId,creditsObtained,uniqueIdentification) values(?,?,?,?,?,?)");

		
		Enumeration<String> em=request.getParameterNames();
		while(em.hasMoreElements()){
			//Object os=em.hasMoreElements();
			String subId=(String)em.nextElement();
			String marks =request.getParameter(subId);
			String identity= student_Id + subId;
		    
		    	System.out.println("studentId:"+student_Id+"subId:"+subId+"credits:"+marks);

		  pst.setInt(1, student_Id);
		  pst.setString(2,subId);
		  pst.setString(3,studentDept);
		  pst.setString(4,studentCourse);
		  pst.setString(5,marks);
		  pst.setString(6,identity);
		  int i=pst.executeUpdate();
		   if(i>=0)
		   {
			   System.out.println("records have been successfuly saved");
			   //response.sendRedirect("registrationSuccessMessage.html");   
     	}
		}
			  con.close();
			
   }
	
catch(SQLException me)
	{
	out.print("you have written a duplicaye value");
	}
catch(Exception e){
	   e.printStackTrace();
	   out.print(e);
	  	   
}
%>

</body>
</html>
