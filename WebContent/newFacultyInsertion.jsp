<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>faculty records insertion</title>
</head>
<body>
 <%

   //in my sql "<>" ,"!=" -this both indicates not equal to  ,so used it here
    String id = request.getParameter("faculty_id");
    String Name=request.getParameter("faculty_name");
	String dept=request.getParameter("department");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
		
	
	
	PreparedStatement pst=null;
	
	try{
		Connection con = JdbcConnection.getCon();
		pst = con.prepareStatement(
				"insert into facultydetails(facultyId,facultyName,departmentId,,username,password) values(?,?,?,?,?)");
	
		  pst.setString(1, id);
		  pst.setString(2,Name);
		  pst.setString(3,dept);
		  pst.setString(4,username);
		  pst.setString(5,password);
		  int i=pst.executeUpdate();
		   if(i>=0)
		   {
			   System.out.println("records have been successfuly saved");
			   response.sendRedirect("registrationSuccessMessage.html");
			   
			 
			   
     	}
		   
			  con.close();
			
   }
	
catch(Exception e){
	   e.printStackTrace();
	   
}
	 
%>

</body>
</html>