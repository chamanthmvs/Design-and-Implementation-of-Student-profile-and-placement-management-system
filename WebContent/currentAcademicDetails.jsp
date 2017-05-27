<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter the Semister( Current Academics)</title>
<link rel="stylesheet" href="layoutWithNaviOne.css" type="text/css" />
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
<form action="checkSemister.jsp" method="post">

<%           
Connection con=JdbcConnection.getCon();
int student_Id=(Integer)session.getAttribute("studentId");
String studentdept=(String)session.getAttribute("deptId");
PreparedStatement pst=con.prepareStatement("SELECT semisterName FROM semisters");
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
      <li class="active"><a href="#">Current Academics</a>
      </li>
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
      <li class="current"><a href="#">Current Academic Details(Enter Semister)</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
    <h1>Student Current Academic Details</h1><br></br>
    <p>Select the Semister from the dropDown which you want to view</p>
<table>                                     	  
    <tr>  
<td><b>Semister</b></td><td>       : <select name ="semister" ><% while(rs.next()){ %><option value="<%= rs.getString(1)%>"><%= rs.getString(1) %></option><%} %></select></td><td><br><br></td>
       </tr>
       </table>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="SUBMIT"><br></br>
      
      <ul>
      <li>To get PERSONAL DETAILS of the student <a href="personalDetails.jsp"><b><i>CLICK HERE!</i></b></a> or press on the Personal Details on the above bar<br></br></li>
       <li>To get PREVIOUS ACADEMIC DETAILS of same student <a href="previousAcademicDetails.jsp"><b><i>CLICK HERE!</i></b></a> or press on the Previous Academic Details on the above bar<br></br></li>
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




