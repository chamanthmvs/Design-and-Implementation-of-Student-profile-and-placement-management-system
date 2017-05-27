<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>student records insertion</title>
</head>
<body>
 <%

   //in my sql "<>" ,"!=" -this both indicates not equal to  ,so used it here
    String id = request.getParameter("student_id");
    String firstName=request.getParameter("student_FirstName");
	String middleName=request.getParameter("student_MiddleName");
	String lastName=request.getParameter("student_LastName");
	String dept=request.getParameter("department");
	String batches=request.getParameter("batches");
	String courseStream=request.getParameter("coursestream");
	String fatherName=request.getParameter("student_FatherName");
	String motherName=request.getParameter("student_MotherName");
	String fatherPhoneNumber=request.getParameter("father_phoneNumber");
	String dateofbirth=request.getParameter("dateOfBirth");
	String nationality=request.getParameter("nationality");
	String religion=request.getParameter("religion");
	String permanentAddress=request.getParameter("permanentAddress");
	String presentAddress=request.getParameter("presentAddress");
	String district=request.getParameter("district");
	String state=request.getParameter("state");
	String pincode=request.getParameter("pincode");
	String emailId=request.getParameter("emailId");
	String alternateEmailId=request.getParameter("alternateEmailId");
	String mobileNumber=request.getParameter("mobileNumber");
	String alternateMobileNumber=request.getParameter("alternateMobileNumber");
	String category=request.getParameter("category");
	String bloodGroup=request.getParameter("bloodGroup");
	String personWithDisability=request.getParameter("personWithDisability");
	String tenthBoard=request.getParameter("10thBoard");
	String tenthSchoolName=request.getParameter("10thSchoolName");
	String tenthPercentage=request.getParameter("10thPercentage");
	String tenthYearOfPassing=request.getParameter("10thYearOfPassing");
	String twelvethBoard=request.getParameter("12thBoard");
	String twelvethCollegeName=request.getParameter("12thCollegeName");
	String twelvethPercentage=request.getParameter("12thPercentage");
	String twelvethYearOfPassing=request.getParameter("12thYearOfPassing");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
		
	
	
	PreparedStatement pst=null;
	
	try{
		Connection con = JdbcConnection.getCon();
		pst = con.prepareStatement(
				"insert into studentdetails(student_id,student_FirstName,student_MiddleName,student_LastName,departmentId,courseId,student_FatherName,student_MotherName,Father_PhoneNumber,student_DateOfBirth,Nationality,Religion,PermanentAddress,PresentAddress,District,State,PinCode,EmailId,Alternate_EmailId,MobileNumber,Alternate_MobileNumber,Category,BloodGroup,PersonWithDisability,10th_Board,10th_SchoolName,10th_Percentage,10th_YearOfPassing,12th_Board,12th_CollegeName,12th_Percentage,12th_YearOfPassing,username,password,batchId) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
		  pst.setString(1, id);
		  pst.setString(2,firstName);
		  pst.setString(3,middleName);
		  pst.setString(4,lastName);
		  pst.setString(5,dept);
		  pst.setString(6,courseStream);
		  pst.setString(7,fatherName);
		  pst.setString(8, motherName);
		  pst.setString(9,fatherPhoneNumber);
		  pst.setString(10,dateofbirth);
		  pst.setString(11,nationality);
		  pst.setString(12,religion);
		  pst.setString(13,permanentAddress);
		  pst.setString(14,presentAddress);
		  pst.setString(15,district);
		  pst.setString(16,state);
		  pst.setString(17,pincode);
		  pst.setString(18,emailId);
		  pst.setString(19,alternateEmailId);
		  pst.setString(20,mobileNumber);
		  pst.setString(21,alternateMobileNumber);
		  pst.setString(22,category);
		  pst.setString(23,bloodGroup);
		  pst.setString(24,personWithDisability);
		  pst.setString(25,tenthBoard);
		  pst.setString(26,tenthSchoolName);
		  pst.setString(27,tenthPercentage);
		  pst.setString(28,tenthYearOfPassing);
		  pst.setString(29,twelvethBoard);
		  pst.setString(30,twelvethCollegeName);
		  pst.setString(31,twelvethPercentage);
		  pst.setString(32,twelvethYearOfPassing);
		  pst.setString(33,username);
		  pst.setString(34,password);
		  pst.setString(35,batches);
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