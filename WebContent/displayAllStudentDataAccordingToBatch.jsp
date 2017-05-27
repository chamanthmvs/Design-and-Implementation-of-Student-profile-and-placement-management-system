<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>displaying table according to batch selected</title>
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
#studentdetails 
{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#studentdetails td, #studentdetails th {
    border: 1px solid #ddd;
    text-align: left;
    padding: 8px;
}

#studentdetails tr:nth-child(even){background-color: #f2f2f2}

#studentdetails tr:hover {background-color: #ddd;}

#studentdetails th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color:#48282F;
    opacity:0.8;
    /* background:url("C:/Intern project/images/royal blue.jpg"); */
    color: white;
    
}
</style>
</head>
<body>

<%
Connection con =JdbcConnection.getCon();
String batch=(String)request.getParameter("batch");
String facultyDeptId=(String)session.getAttribute("facultydeptId");
PreparedStatement pst=null;
PreparedStatement pstmt=null;
pstmt=con.prepareStatement("SELECT studentdetails.student_Id,studentdetails.student_FirstName,departments.departmentName,courses.courseName,batches.batchName,studentdetails.departmentId FROM studentdetails INNER JOIN departments ON studentdetails.departmentId=departments.departmentId INNER JOIN courses ON studentdetails.courseId=courses.courseId INNER JOIN batches ON studentdetails.batchId=batches.batchId WHERE studentdetails.departmentId=? AND studentdetails.batchId=?");
pst=con.prepareStatement("SELECT studentdetails.student_Id,studentdetails.student_FirstName,studentdetails.student_MiddleName,studentdetails.student_LastName,departments.departmentName,courses.courseName,batches.batchName,studentdetails.departmentId FROM studentdetails INNER JOIN departments ON studentdetails.departmentId=departments.departmentId INNER JOIN courses ON studentdetails.courseId=courses.courseId INNER JOIN batches ON studentdetails.batchId=batches.batchId WHERE studentdetails.departmentId=? AND studentdetails.batchId=?");
pst.setString(1,facultyDeptId);
pst.setString(2,batch);
pstmt.setString(1,facultyDeptId);
pstmt.setString(2,batch);
ResultSet rs=null;
ResultSet rs1=null;
rs=pst.executeQuery();
rs1=pstmt.executeQuery();
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
      <li><a href="#">Personal Details</a>
      </li>
      <li><a href="previousAcademicDetails.jsp">Previous Academic Details</a>
      </li>
      <li><a href="currentAcademicDetails.jsp">Current Academic Details</a>
      </li>
      <li><a href="#">Display according to batch(Faculty Home)</a></li>
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
      <li class="current"><a href="#">Select the batch to display student batch Details</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
  
  <%-- <% while(rs1.next()){
	%>
  
     <h1>Student details of batch&nbsp;<%=rs1.getString(5) %>&nbsp;and department&nbsp;<%=rs1.getString(3)%></h1><br></br>
     <%} %>
 --%><table id="studentdetails">
<tr>
	
	<th>Student Id</th>
	<th>Name of the Student</th>
	<th>Department Name</th>
	<th>CourseName</th>
	<th>Batch</th>
	<th>Actions</th>
</tr>	
<% while(rs.next()){
	String name= rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getString(4);%>
  
      
 	<tr>
    <td><%=rs.getInt(1)%></td> 
    <td><%=name%></td> 
    <td><%=rs.getString(5)%></td> 
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(7)%></td> 
    <td><a href="studentDetailsHome.jsp?student_Id=<%=rs.getInt(1)%>">View</a></td>
	</tr>
    <%session.setAttribute("studentId",rs.getInt(1));
       session.setAttribute("deptId",rs.getString(6));%>
<%} %>
</table>
      
     
  
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




