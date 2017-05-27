<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>student Details Home When Searched According to RegdNo.jsp</title>
<link rel="stylesheet" href="layoutWithNaviOne.css" type="text/css" />
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="jquery.ui.min.js"></script>
<script type="text/javascript" src="jquery.tabs.setup.js"></script>
</head>
<body>


           <% 
Connection con=JdbcConnection.getCon();
int student_Id=(Integer)session.getAttribute("studentId");


PreparedStatement pst=con.prepareStatement("select studentdetails.student_LastName,studentdetails.student_id,departments.departmentName,courses.courseName from  studentdetails INNER JOIN departments ON studentdetails.departmentId=departments.departmentId INNER JOIN courses ON studentdetails.courseId=courses.courseId where student_id=?");
pst.setInt(1,student_Id);
ResultSet rs=pst.executeQuery();
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
      <li><a href="personalDetails.jsp">Personal Details</a>
      </li>
      <li><a href="previousAcademicDetails.jsp">Previous Academic Details</a>
      </li>
      <li><a href="currentAcademicDetails.jsp">Current Academic Details</a>
      </li>
      <li class="active"><a href="#">Student Details Home</a></li>
     
      <li><a href="Login.jsp">LOGOUT</a>
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
      <li class="current"><a href="#">Student Details</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
    <h1>Student Details</h1><br></br>
    <p>
     <%while(rs.next()){ %>	
    <ol>
      <li>Student Id  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  : <b> <%=rs.getString(2)%></b><br></br></li>
      <li>Student Name&nbsp;&nbsp;  : <b> <%=rs.getString(1)%></b><br></br></li>
      <li>Department &nbsp;&nbsp;&nbsp;   : <b> <%=rs.getString(3)%></b><br></br></li>
      <li>Course    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    : <b> <%=rs.getString(4)%></b><br></br></li>
    </ol>
   </p>
       <p><b>Functions of this page</b></p>
    <ul>
      <li>The below are brief details of the student<br></br></li>
      <li>To get PERSONAL DETAILS of the student <a href="personalDetails.jsp"><b><i>CLICK HERE!</i></b></a> or press on the Personal Details on the above bar<br></br></li>
      <li>To get CURRENT ACADEMIC DETAILS of the student <a href="currentAcademicDetails.jsp"><b><i>CLICK HERE!</i></b></a> or press on the Current Academic Details on the above bar<br></br></li>
       <li>To get PREVIOUS ACADEMIC DETAILS of the student <a href="previousAcademicDetails.jsp"><b><i>CLICK HERE!</i></b></a> or press on the Previous Academic Details on the above bar<br></br></li>
    </ul>
   
  <%} 
  
    
    %>
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

</body>
</html>

