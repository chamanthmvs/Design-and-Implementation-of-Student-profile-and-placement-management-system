<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mark Sheet</title>
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
/* table,th,td {border:1px solid #AAAAAA;}
	th {padding:3px; font-weight:bold;color:#344b3b;}
	tr {margin:0 0 5px 0;padding:3px;}
	td {padding:5px;margin:0 1px;}
	 */
</style>
</head>
<body>
 <%           
int jet100=1;
Connection con=JdbcConnection.getCon();
int student_Id=(Integer)session.getAttribute("studentId");
String studentdept=(String)session.getAttribute("deptId");

String semister=(String)session.getAttribute("semister");
PreparedStatement pst=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId` INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=?");
PreparedStatement pstmt=con.prepareStatement("select studentdetails.student_LastName,studentdetails.student_id,departments.departmentName,courses.courseName from  studentdetails INNER JOIN departments ON studentdetails.departmentId=departments.departmentId INNER JOIN courses ON studentdetails.courseId=courses.courseId where student_id=?");
pstmt.setInt(1,student_Id);
pst.setInt(1,student_Id);
pst.setString(2,semister);
/* pst.setString(3,"studentDept");         // This field is not required because studentId is unique for every individual student in the campus irrespective of their departments
                                   // the commented code will cause ERROR  because studentDept is not correctly obtained from the sessions so check the session.setAttribute in previous files
 */ResultSet rs1=pstmt.executeQuery();
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
      <li class="active"><a href="#">Current Academic Details</a>
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
      <li class="current"><a href="#">Student Current Academic Details</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
    <h1>Student Personal Details</h1><br></br>
    <p><%while(rs1.next()){ %>	

    <ul>
      <li>Student Id  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  : <b> <%=rs1.getString(2)%></b><br></br></li>
      <li>Student Name&nbsp;&nbsp;  : <b> <%=rs1.getString(1)%></b><br></br></li>
      <li>Department &nbsp;&nbsp;&nbsp;   : <b> <%=rs1.getString(3)%></b><br></br></li>
      <li>Course    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    : <b> <%=rs1.getString(4)%></b><br></br></li>
      <li>Semister    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    : <b> <%=semister%></b><br></br></li>
    </ul>
    <%} %>
    <%
    float sum=0,adj,denom=0,asc=0;
    int jet1,jet2,jet3;
    /* PreparedStatement pst1=con.prepareStatement("select actualCredits from subjects where departmentId=?");
    pst1.setString(1,studentDept);
    PreparedStatement pst2=con.prepareStatement("SELECT studentcredits.`creditsObtained` FROM subjects INNER JOIN studentcredits ON subjects.`subjectId` = studentcredits.`subjectId` WHERE studentId=? AND semister=? AND subjects.departmentId=?");
    pst2.setInt(1,student_Id);
    pst2.setString(2,semister);
    pst2.setString(3,studentDept);
    ResultSet rs2=pst1.executeQuery();
    ResultSet rs3=pst2.executeQuery();
     */
    %>
<table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
 
 
     <%ResultSet rs=pst.executeQuery();
 
     while(rs.next()){%>
    
<tr>
   <td><%=rs.getString(1)%></td> 
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(4)%></td>
    <% jet1=Integer.parseInt(rs.getString(2));
       jet2=Integer.parseInt(rs.getString(3));
       jet3=jet1*jet2;
       if(jet3==0)
       {
    	   jet100=0;
       }
       else
       {
	   adj=jet3;
	   sum+=adj;
	   asc=jet1;
	   denom+=asc;
       }
     %>
    <td><%=jet3%></td>
</tr>

<%} 
     float grade;
     if(jet100==0)
     {
    	 grade=0;
     }
     else{
grade=(sum)/(denom);
     }
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom%></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum %></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade%></b></p><br><br>
        <table>
         <tr>
             <td>GRADE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             <td>'O'</td>
             <td>'A'</td>
             <td>'B'</td>
             <td>'C'</td>
             <td>'D'</td>
             <td>'E'</td>
             <td>'F'</td>
         </tr>
         <tr>
             <td>GRADE POINT</td>
             <td>10</td>
             <td>9</td>
             <td>8</td>
             <td>7</td>
             <td>6</td>
             <td>5</td>
             <td>0</td>
         </tr>
        </table>
        
        <p>NOTE:</p>
              <ol>
                <li>MINIMUM GRADE FOR PASS IN THEORY  :"E"<br></br></li>
                <li>MINIMUM GRADE FOR PASS IN PRACTICAL  :"D"<br></br></li>
                <li>THE SESSIONAL MARKS OF THE FAILED SUBJECT WILL BE CARRIED TO<br> THE NEXT EXAMINATION FOR THAT SUBJECT</li>
              </ol><br><br><br><br></br>
              <p>---------------------------------------------------------------------------------------------------------------------------------</p>
    <ul>
      <li>To get CURRENT ACADEMIC DETAILS of same student <a href="currentAcademicDetails.jsp"><b><i>CLICK HERE!</i></b></a> or press on the Current Academic Details on the above bar<br></br></li>
       <li>To get PREVIOUS ACADEMIC DETAILS of same student <a href="previousAcademicDetails.jsp"><b><i>CLICK HERE!</i></b></a> or press on the Previous Academic Details on the above bar<br></br></li>
    </ul>
   
<%   

 
float semisterGrade = grade;
String scgpa = String.valueOf(semisterGrade);


              if (semister.equals("1")){ 
            PreparedStatement pst1=con.prepareStatement("insert into studentgpa(student_id,departmentId,1stYear)values(?,?,?)");
                         pst1.setInt(1, student_Id);
                         pst1.setString(2,studentdept);
                         pst1.setString(3,scgpa);
                         int i=pst1.executeUpdate();
              		   if(i>=0)
              		   {
              			   System.out.println("records have been successfuly saved");
              		   }
              }
              		   
              		   else if (semister.equals("2-1")){ 
                         PreparedStatement pst1=con.prepareStatement("insert into studentgpa(student_id,departmentId,2_1Semister)values(?,?,?)");
                                      pst1.setInt(1, student_Id);
                                      pst1.setString(2,studentdept);
                                      pst1.setString(3,scgpa);
                                      int i=pst1.executeUpdate();
                           		   if(i>=0)
                           		   {
                           			   System.out.println("records have been successfuly saved");
                           		   }
  		   
              		   }
 
              		   else if (semister.equals("2-2")){ 
    PreparedStatement pst1=con.prepareStatement("insert into studentgpa(student_id,departmentId,2_2Semister)values(?,?,?)");
                 pst1.setInt(1, student_Id);
                 pst1.setString(2,studentdept);
                 pst1.setFloat(3,grade);
                 int i=pst1.executeUpdate();
      		   if(i>=0)
      		   {
      			   System.out.println("records have been successfuly saved");
      		   }
              		   }


              		   else if (semister.equals("3-1")){ 
    PreparedStatement pst1=con.prepareStatement("insert into studentgpa(student_id,departmentId,3_1Semister)values(?,?,?)");
                 pst1.setInt(1, student_Id);
                 pst1.setString(2,studentdept);
                 pst1.setFloat(3,grade);
                 int i=pst1.executeUpdate();
      		   if(i>=0)
      		   {
      			   System.out.println("records have been successfuly saved");
      		   }
              		   }



              		 else if (semister.equals("3-2")){ 
              		    PreparedStatement pst1=con.prepareStatement("insert into studentgpa(student_id,departmentId,3_2Semister)values(?,?,?)");
              		                 pst1.setInt(1, student_Id);
              		                 pst1.setString(2,studentdept);
              		                 pst1.setFloat(3,grade);
              		                 int i=pst1.executeUpdate();
              		      		   if(i>=0)
              		      		   {
              		      			   System.out.println("records have been successfuly saved");
              		      		   }
              		              		   }




              		   else if (semister.equals("4-1")){ 
    PreparedStatement pst1=con.prepareStatement("insert into studentgpa(student_id,departmentId,4_1Semister)values(?,?,?)");
                 pst1.setInt(1, student_Id);
                 pst1.setString(2,studentdept);
                 pst1.setFloat(3,grade);
                 int i=pst1.executeUpdate();
      		   if(i>=0)
      		   {
      			   System.out.println("records have been successfuly saved");
      		   }
}

              		   else if (semister.equals("4-2")){ 
    PreparedStatement pst1=con.prepareStatement("insert into studentgpa(student_id,departmentId,4_2Semister)values(?,?,?)");
                 pst1.setInt(1, student_Id);
                 pst1.setString(2,studentdept);
                 pst1.setFloat(3,grade);
                 int i=pst1.executeUpdate();
      		   if(i>=0)
      		   {
      			   System.out.println("records have been successfuly saved");
      		   }
              		   }

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
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - <a href="#">Andhra University College Of Engineering</a></p>
    <br class="clear" />
  </div>
</div>

</body>
</html>




