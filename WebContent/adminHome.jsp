<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="layoutWithNaviOne.css" type="text/css" />
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="jquery.ui.min.js"></script>
<script type="text/javascript" src="jquery.tabs.setup.js"></script>
</head>
<body>
<form action="studentIdValidation.jsp" method="post">
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
      <li><a href="addStudentAcademics.jsp">Add Student Academics</a>
      </li>
      <li><a href="newStudentRegistration.jsp">New Student Registration</a>
      </li>
      <li><a href="newFacultyRegistration.jsp">New Faculty Registration</a>
      </li>
      <li class="active"><a href="#">Admin Homepage</a></li>
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
      <li class="current"><a href="#">Admin Home</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
    <h1>Admin Access Functions</h1><br></br>
    <p>These following functions are accessed by Admin</p><br></br>
    <ul>
      <li><a href="newStudentRegistration.jsp"><b><i>New Student Registration</i></b></a><p>This will help to add New Student who joins the college</p><br></br></li>
      <li><a href="newFacultyRegistration.jsp"><b><i>New Faculty Registration</i></b></a><p>By clicking on this you can add the details of the person</p><p>who is newly recruited by the administration department in the college</p><br></br></li>
      <li><a href="addStudentAcademics.jsp"><b><i>Add Academics of Current Student</i></b></a><p>You can add the academics of the current student</p><br></br></li>
    </ul>
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

