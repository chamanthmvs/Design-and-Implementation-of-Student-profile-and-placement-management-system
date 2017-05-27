<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter registration number to add Academics</title>
<link rel="stylesheet" href="layoutWithNaviOne.css" type="text/css" />
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="jquery.ui.min.js"></script>
<script type="text/javascript" src="jquery.tabs.setup.js"></script>
</head>
<body>
<form action="studentIdValidationAdminPage.jsp" method="post">


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
        <li class="active"><a href="addStudentAcademics.jsp">Add Student Academics</a>
       
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
      <li class="current"><a href="#">Add Student Current Academics(Regd No)</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
      
      <h1>Enter the student registration number to whom you want to update the academic details</h1><br>
        <h1>
     
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Student Registration number</b>    : <input type="text" name="student_id" required="required"><br></br>         <!-- * this is used to indicate that it is mandatory -->
      
     </h1> 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="submit" value ="SUBMIT"></p><br>
 
 
    
    
    <ul>
      <li>Enter the Student registration number to whom you need to update the academic details<br></br></li>
      <li>Select the semister  you need to update<br></br></li>
      <li>If you want to LOGOUT press Logout in above bar<br></br><br></br><br></br></li>
    </ul>
    <!-- <h2 align="center">LOGIN</h2> -->
    
      
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
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - <a href="#">Andhra University College Of Engineering</a></p>
    <br class="clear" />
  </div>
</div>
</form>
</body>
</html>

