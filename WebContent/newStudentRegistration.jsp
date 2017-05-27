<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student new registration</title>
<link rel="stylesheet" href="layoutWithNaviOneWithoutPredefinedTable.css" type="text/css" />
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="jquery.ui.min.js"></script>
<script type="text/javascript" src="jquery.tabs.setup.js"></script>
<style>
p{
 font-size:16px;
}
li{
 font-size:14px;
}
h1{
font-size:15px;
}
table{
margin:0px;
border:none;
font-size:12px;
}
th,td {border:none;}
	th {padding:3px; font-weight:bold;color:#344b3b;}
	tr {margin:0 0 7px 0;padding:7px;font-size:18px;}
	td {padding:10px;margin:0 1px;font-size:15px;}
	
}
</style>
</head>
<body>
<form action="newStudentInsertion.jsp" method="post">
     <% 
Connection con=JdbcConnection.getCon();
int student_Id=(Integer)session.getAttribute("studentId");
PreparedStatement pst=con.prepareStatement("select * from departments");
PreparedStatement pstmt=con.prepareStatement("select * from courses");
PreparedStatement pst1=con.prepareStatement("select * from batches");
ResultSet rs1=pstmt.executeQuery();
ResultSet rs=pst.executeQuery();
ResultSet rs2=pst1.executeQuery();
%>
   <!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><img src="images/aucelogo.jpg" align="left" height="120" width="100"></h1>
      <h2>Andhra University College Of Engineering(A)</h2>
      <h3>Accredited by NAAC with 'A' Grade</h3>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="topnav">
    <ul>
      <li><a href="HomePage.jsp">Home</a>
        </li>
      <li><a href="#">New Student Registration</a>
      </li>
      <li><a href="newFacultyRegistration.jsp">New Faculty Registration</a>
      </li>
        <li><a href="addStudentAcademics.jsp">Add Student Academics</a>
      </li>
    
      <li><a href="Logout.jsp">Logout</a>
       </li>    
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="breadcrumb">
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li>Home</li>
      <li>&#187;</li>
      <li>Login</li>
      <li>&#187;</li>      
      <li class="current"><a href="#">New Student Registration Form</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
    <h1>New Student Registration Details</h1><br></br>
    <p><u><b>PERSONAL DETAILS</b></u></p>
<table>
          <tr>
    <td><b>Student Id</b></td><td>    : <input type="text" name="student_id" required="required"></td><td><br><br></td>
         </tr>        
         <tr> 
    <td><b>First Name</b></td><td>    :<input type="text" name="student_FirstName" required="required"></td><td><br><br></td>
       </tr>
       <tr>  
 <td><b>Middle Name</b></td><td>   : <input type="text" name="student_MiddleName" required="required"></td><td><br><br></td>
       </tr>
  <tr>
 <td><b>Last Name</b></td><td>   : <input type="text" name="student_LastName" required="required"></td><td><br><br></td>     
   </tr>
       <tr>  
<td><b>department</b></td><td>       : <select name ="department" ><% while(rs.next()){ %><option value="<%= rs.getString(1)%>"><%= rs.getString(2) %></option><%} %></select></td><td><br><br></td>
       </tr>
       <tr> 
<td><b>batch</b></td><td>    :  <select name ="batches" ><% while(rs2.next()){ %><option value="<%= rs2.getString(1)%>"><%= rs2.getString(2) %></option><%} %>
	 </select></td><td><br><br></td>
       </tr>
         <tr> 
<td><b>course</b></td><td>    :  <select name ="coursestream" ><% while(rs1.next()){ %><option value="<%= rs1.getString(1)%>"><%= rs1.getString(2) %></option><%} %>
	 </select></td><td><br><br></td>
       </tr>
       <tr>  
    <td><b>Father Name</b></td><td>: <input type="text" name="student_FatherName" required="required"></td><td><br><br></td>
       </tr> 
       <tr>
    <td><b>Mother Name</b></td><td> : <input type="text" name="student_MotherName" required="required"></td><td><br><br></td> 
      </tr>
       <tr>
    <td><b>Father Phone Number</b></td><td> : <input type="text" name="father_phoneNumber" required="required"></td><td><br><br></td> 
      </tr>
      <tr>
    <td><b>Date of birth</b></td><td> : <input type="text" name="dateOfBirth" placeholder="YYYY-MM-DD" required="required"></td><td><br><br></td> 
      </tr>
      <tr>
    <td><b>Nationality</b></td><td>  : <input type="text" name="nationality" required="required"></td><td><br><br></td>
    </tr>
      <tr>
     <td><b>Religion</b></td><td>  : <select name="religion"><option value="Hindu">Hindu</option>
<option value="Islam">Islam</option>
<option value="Christian">Christian</option>
</select></td><td><br><br></td> 
    </tr>
      <tr>
    <td><b>Permanent Address</b></td><td>  : <textarea rows="3" cols="30" name="permanentAddress" required="required"></textarea></td><td><br><br></td>
    </tr>
      <tr>
    <td><b>Present Address</b></td><td>  : <textarea rows="3" cols="30" name="presentAddress" required="required"></textarea></td><td><br><br></td>
    </tr>
     <tr>
    <td><b>District</b></td><td>  : <input type="text" name="district" required="required"></td><td><br><br></td>
    </tr>
     <tr>
    <td><b>State</b></td><td>  : <input type="text" name="state" required="required"></td><td><br><br></td>
    </tr>
     <tr>
    <td><b>PinCode</b></td><td>  : <input type="text" name="pincode" required="required"></td><td><br><br></td>
    </tr>
       <tr>
    <td><b>E-mail Id</b></td><td>  : <input type="text" name="emailId" required="required"></td><td><br><br></td>
    </tr>
    <tr>
    <td><b>Alternate E-mail Id</b></td><td>  : <input type="text" name="alternateEmailId" required="required"></td><td><br><br></td>
    </tr>
    <tr>
    <td><b>Mobile Number</b></td><td>  : <input type="text" name="mobileNumber" required="required"></td><td><br><br></td>
    </tr>
    <tr>
    <td><b>Alternate Mobile Number</b></td><td>  : <input type="text" name="alternateMobileNumber" required="required"></td><td><br><br></td>
    </tr>
    <tr>
    <td><b>Category</b></td><td>  : <input type="radio" name="category" value="OC">OC<input type="radio" name="category" value="BC-A">BC-A<input type="radio" name="category" value="BC-B">BC-B<input type="radio" name="category" value="BC-C">BC-C<input type="radio" name="category" value="BC-D">BC-D<input type="radio" name="category" value="SC">SC<input type="radio" name="category" value="ST">ST</td><td><br><br></td>
    </tr>
     <tr>
     <td><b>Blood Group</b></td><td>  : <select name="bloodGroup"><option value="A+">A+</option>
<option value="A-">A-</option>
<option value="B+">B+</option><option value="B-">B-</option><option value="O+">O+</option><option value="O-">O-</option><option value="AB+">AB+</option><option value="AB-">AB-</option>
</select></td><td><br><br></td> 
    </tr>
    <tr>
    <td><b>Person with Disability</b></td><td>  : <input type="radio" name="personWithDisability" value="Yes">Yes<input type="radio" name="personWithDisability" value="No">No</td><td><br><br></td>
    </tr>
    </table>
    <p><u><b>PREVIOUS ACADEMIC DETAILS</b></u></p>
    <table>
     <tr>
     <td><b>10th board</b></td><td>  : <select name="10thBoard"><option value="SSC">SSC</option>
<option value="CBSE">CBSE</option>
<option value="ICSE">ICSE</option>
</select></td><td><br><br></td> 
    </tr>
     <tr>
    <td><b>10th School Name</b></td><td>  : <input type="text" name="10thSchoolName" required="required"></td><td><br><br></td>
    </tr>
    <tr>
    <td><b>10th Percentage</b></td><td>  : <input type="text" name="10thPercentage" required="required"></td><td><br><br></td>
    </tr>
     <tr>
    <td><b>10th Year of Passing</b></td><td>  : <input type="text" name="10thYearOfPassing" required="required"></td><td><br><br></td>
    </tr>
    <tr>
     <td><b>12th board</b></td><td>  : <select name="12thBoard"><option value="BIPE">BIPE(State)</option>
<option value="CBSE">CBSE</option>
</select></td><td><br><br></td> 
    </tr>
     <tr>
    <td><b>12th College Name</b></td><td>  : <input type="text" name="12thCollegeName" required="required"></td><td><br><br></td>
    </tr>
    <tr>
    <td><b>12th Percentage</b></td><td>  : <input type="text" name="12thPercentage" required="required"></td><td><br><br></td>
    </tr>
    <tr>
    <td><b>12th Year of Passing</b></td><td>  : <input type="text" name="12thYearOfPassing" required="required"></td><td><br><br></td>
    </tr>
    </table>
    <p><u><b>LOGIN CREDENTIALS</b></u></p>
    <table>
      <tr>
    <td><b>Username</b></td><td>  : <input type="text" name="username"></td><td><br><br></td>
    </tr>
      <tr>
    <td><b>Password</b></td><td> : <input type="password" name="password"></td><td><br></br></td>
    </tr>
</table>
                       
            <br><center><button type="Submit"value="submit">Submit</button></center>
    
   </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
  <div class="footbox">
      <h2>Departments</h2>
      <ul>
        <li><a href="#">CSE</a></li>
        <li><a href="#">EEE</a></li>
        <li><a href="#">CIVIL</a></li>
        <li><a href="#">MECHANICAL</a></li>
        <li class="last"><a href="#">CHEMICAL</a></li>
      </ul>
    </div>
    
   <div class="footbox">
      <h2>ExtraCurricular</h2>
      <ul>
        <li><a href="#">Cafeteria</a></li>
        <li><a href="#">Debate Clubs</a></li>
        <li><a href="#">cultural</a></li>
        <li><a href="#">Indoor games</a></li>
        <li class="last"><a href="#">Outdoor games</a></li>
      </ul>
    </div>
    
    <div class="footbox">
      <h2>Follow us on</h2>
      <ul>
        <li><a href="#">Facebook</a></li>
        <li><a href="#">Instagram</a></li>
        <li class="last"><a href="#">Twitter</a></li>
        </ul>
    </div>
   
     <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2017 - All Rights Reserved - <a href="#">Andhra University College Of Engineering</a></p>
    <br class="clear" />
  </div>
</div>
</form>
</body>
</html>




