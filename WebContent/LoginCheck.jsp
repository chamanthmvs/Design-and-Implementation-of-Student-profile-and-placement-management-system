<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>loginCheck</title>
</head>
<body>
<% 
String uname= request.getParameter("username");
String pwd=request.getParameter("password");
//String role=request.getParameter("rolename");

Connection con=JdbcConnection.getCon();

String retriveStudentLogins="select student_id,student_FirstName,departmentId from studentdetails where username=? and password=?";
String retriveFacultyLogins="select * from facultydetails where username=? and password=?";
String retriveAdminLogin="select username,password from admindetails where username=? and password=?";

PreparedStatement pst1=null;
ResultSet rs1=null;
pst1=con.prepareStatement(retriveFacultyLogins);
pst1.setString(1, uname);
pst1.setString(2, pwd);
rs1=pst1.executeQuery();   


PreparedStatement pst2=null;
ResultSet rs2=null;
pst2=con.prepareStatement(retriveStudentLogins);
pst2.setString(1, uname);
pst2.setString(2, pwd);
rs2=pst2.executeQuery();   


PreparedStatement pst3=null;
ResultSet rs3=null;
pst3=con.prepareStatement(retriveAdminLogin);
pst3.setString(1, uname);
pst3.setString(2, pwd);
rs3=pst3.executeQuery();


                                  // actually this executeUpdate() or executeQuery() is used like "enter"  means it makes automatically to update or does the query execution automatically without again putting any command externally like keeping ';'in mysql or in any other database we use semicoloumn (';') after the select command but in java (like this program) we no need to write that, we just write instructions like  executeUpdate or executeQuery etc................
	if(rs1.next()){

		session.setAttribute("facultydeptId",rs1.getString(5));
		response.sendRedirect("facultyHome.jsp");
		return;
	}
	 

	  else if(rs2.next()){
		session.setAttribute("dept", rs2.getString(3));
		session.setAttribute("studentId", rs2.getInt(1)); // in select command we have taken employee_id and also employee_name for employee_name we take rs.getString(2)
		session.setAttribute("userName", uname);                             // these sessions are used to available data for other tasks or pages in that session (particular session)  if we use response and request if a request is sent from the client and server recieves the request , if the server sends the response to that request then the data recieved by server(request information data) before sending response to the client will be deleted    simply to say the data will be deleted from server if once the response is given by the server to the request given by client , but if we use session data will not be deleted we can use it in another pages within that project as we are using sessions here
		session.setAttribute("studentName", rs2.getString(2));
		response.sendRedirect("studentHome.jsp");
	  return;
	}
	  
 
	  else if(rs3.next()){
    	 session.setAttribute("username", uname);
			response.sendRedirect("adminHome.jsp");
			return;
		}
	   else {
			response.sendRedirect("Login.jsp");
			return;
		}
		%>

</body>
</html>