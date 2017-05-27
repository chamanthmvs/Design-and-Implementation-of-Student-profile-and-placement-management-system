<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insertion of Student marks according to semisters</title>
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
<form action="studentCurrentAcademicsInsertion.jsp" method="post">
<%           
Connection con=JdbcConnection.getCon();
        int student_Id=(Integer)session.getAttribute("studentId");
		String studentDept=(String)session.getAttribute("studentDept");
		String studentCourse=(String)session.getAttribute("studentCourseStream");
        String semister=(String)session.getAttribute("semister");
PreparedStatement pst=con.prepareStatement("select subjectId,subjectName from subjects where departmentId=? AND semister=?");
pst.setString(1,studentDept);
pst.setString(2,semister);
PreparedStatement pstmt=con.prepareStatement("select studentdetails.student_FirstName,studentdetails.student_id,departments.departmentName,courses.courseName from  studentdetails INNER JOIN departments ON studentdetails.departmentId=departments.departmentId INNER JOIN courses ON studentdetails.courseId=courses.courseId where student_id=?");
pstmt.setInt(1,student_Id);
PreparedStatement pst1=con.prepareStatement("select grades,gradepoints from grades");
ResultSet rs=pst.executeQuery();
ResultSet rs1=pstmt.executeQuery();

 while(rs1.next()){	
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
      <li><a href="newStudentRegistration.jsp">New Student Registration</a>
      </li>
      <li><a href="newFacultyRegistration.jsp">New Faculty Registration</a>
      </li>
        <li class="active"><a href="#">Add Student Academics</a>
      </li>
      
      <li><a href="Login.jsp">Logout</a>
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
    <h1>Storing student marks </h1><br></br>
    
<table>
<tr>  
 <td><b>Student ID</b></td><td>   : <b><%= student_Id%></b></td><td><br><br></td>
	</tr>
	<tr>  
 <td><b>Student Name</b></td><td>   : <b><%=rs1.getString(1)%></b></td><td><br><br></td>
	</tr>
	
<tr>  
 <td><b>Student Department</b></td><td>   :<b><%=rs1.getString(3)%></b></td><td><br><br></td>
	</tr>
<tr>  
 <td><b>Student Course</b></td><td>   : <b><%=rs1.getString(4)%></b></td><td><br><br></td>
	</tr> 
<%} %>
<% while(rs.next()){ %>
<tr>  
 <td><b><%=rs.getString(2)%></b></td><td>   :  <select name ="<%=rs.getString(1)%>"> <%ResultSet rs2=pst1.executeQuery(); while(rs2.next()){  %><option value="<%= rs2.getString(2)%>"><%= rs2.getString(1) %><%} %></option></select><%}%></td><td><br><br></td>     
       </tr>
       
        <tr>     
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





