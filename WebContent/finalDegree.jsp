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
table{width:100%; border-collapse:collapse; table-layout:auto; vertical-align:top; margin-bottom:15px; border:1px solid #CCCCCC;}
table thead th{color:#FFFFFF; background-color:#645951; border:1px solid #CCCCCC; border-collapse:collapse; text-align:center; table-layout:auto; vertical-align:middle;}
table tbody td{vertical-align:top; border-collapse:collapse; border-left:1px solid #CCCCCC; border-right:1px solid #CCCCCC;}
table thead th, table tbody td{padding:5px; border-collapse:collapse;}
table tbody tr.light{color:#666666; background-color:#FDFFE1;}
table tbody tr.dark{color:#666666; background-color:#FBFFC4;}
</style>
</head>
<body>
 <%           
Connection con=JdbcConnection.getCon();
int student_Id=(Integer)session.getAttribute("studentId");
String studentDept=(String)session.getAttribute("studentDept");
String semister=(String)session.getAttribute("semister");
PreparedStatement pst=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId`INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=?");
PreparedStatement pstmt=con.prepareStatement("select studentdetails.student_FirstName,studentdetails.student_id,departments.departmentName,courses.courseName from  studentdetails INNER JOIN departments ON studentdetails.departmentId=departments.departmentId INNER JOIN courses ON studentdetails.courseId=courses.courseId where student_id=?");
pstmt.setInt(1,student_Id);
pst.setInt(1,student_Id);
pst.setString(2,"1");
/* pst.setString(3,studentDept); */
ResultSet rs=pst.executeQuery();
ResultSet rs1=pstmt.executeQuery();
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
      <li class="current"><a href="#">Student Current Academic Details(Mark sheet)</a></li>
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
      <li>Semister    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    : <b>overall</b><br></br></li>
    </ul>
    <%} %>
    <%
    float sum1=0,sum2_1=0,sum2_2=0,sum3_1=0,sum3_2=0,sum4_1=0,sum4_2=0,adj1,adj2_1,adj2_2,adj3_1,adj3_2,adj4_1,adj4_2,denom1=0,denom2_1=0,denom2_2=0,denom3_1=0,denom3_2=0,denom4_1=0,denom4_2=0,asc1=0,asc2_1=0,asc2_2=0,asc3_1=0,asc3_2=0,asc4_1=0,asc4_2=0,grade1=0,grade2=0,grade3=0,grade4=0,grade5=0,grade6=0,grade7=0;
    int jet1,jet2,jet3,jet4,jet5,jet6,jet7,jet8,jet9,jet10,jet11,jet12,jet13,jet14,jet15,jet16,jet17,jet18,jet19,jet20,jet21;
   
    %>
<table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
    <% while(rs.next()){%>
<tr>
    <td><%=rs.getString(1)%></td> 
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(4)%></td>
    <% jet1=Integer.parseInt(rs.getString(2));
       jet2=Integer.parseInt(rs.getString(3));
       jet3=jet1*jet2;
	   adj1=jet3;
	   sum1+=adj1;
	   asc1=jet1;
	   denom1+=asc1;
     %>
    <td><%=jet3%></td>
</tr>

<%} 
 grade1=(sum1)/(denom1);
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom1 %></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum1 %></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade1%></b></p><br><br>
         
        <p>-----------------------------------------------------------------------------------------</p>
        <p>Semister : 2-1</p>
            
       <%  PreparedStatement pst1=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId`INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=?");
        
       pst1.setInt(1,student_Id);
       pst1.setString(2,"2-1");
      /*  pst1.setString(3,studentDept);            //not needed bcz studentId is unique irrespective of the department
       */ ResultSet rs2=pst1.executeQuery();      
        %>
        
        <table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
    <% while(rs2.next()){%>
<tr>
    <td><%=rs2.getString(1)%></td> 
    <td><%=rs2.getString(2)%></td>
    <td><%=rs2.getString(4)%></td>
    <% jet4=Integer.parseInt(rs2.getString(2));
       jet5=Integer.parseInt(rs2.getString(3));
       jet6=jet4*jet5;
	   adj2_1=jet6;
	   sum2_1+=adj2_1;
	   asc2_1=jet4;
	   denom2_1+=asc2_1;
     %>
    <td><%=jet6%></td>
</tr>

<%} 
 grade2=(sum2_1)/(denom2_1);
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom2_1%></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum2_1%></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade2%></b></p><br><br>
        
        
        
        <p>-----------------------------------------------------------------------------------------</p>
        <p>Semister : 2-2</p>
            
       <%  PreparedStatement pst2=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId`INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=?");
        
       pst2.setInt(1,student_Id);
       pst2.setString(2,"2-2");
       /* pst2.setString(3,studentDept);
        */ResultSet rs3=pst2.executeQuery();      
        %>
        
        <table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
    <% while(rs3.next()){%>
<tr>
    <td><%=rs3.getString(1)%></td> 
    <td><%=rs3.getString(2)%></td>
    <td><%=rs3.getString(4)%></td>
    <% jet7=Integer.parseInt(rs3.getString(2));
       jet8=Integer.parseInt(rs3.getString(3));
       jet9=jet7*jet8;
	   adj2_2=jet9;
	   sum2_2+=adj2_2;
	   asc2_2=jet7;
	   denom2_2+=asc2_2;
     %>
    <td><%=jet9%></td>
</tr>

<%} 
 grade3=(sum2_2)/(denom2_2);
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom2_2%></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum2_2%></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade3%></b></p><br><br>
        
        
        
        
        <p>-----------------------------------------------------------------------------------------</p>
        <p>Semister : 3-1</p>
            
       <%  PreparedStatement pst3=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId`INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=?");
        
       pst3.setInt(1,student_Id);
       pst3.setString(2,"3-1");
       /* pst3.setString(3,studentDept); */
       ResultSet rs4=pst3.executeQuery();      
        %>
        
        <table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
    <% while(rs4.next()){%>
<tr>
    <td><%=rs4.getString(1)%></td> 
    <td><%=rs4.getString(2)%></td>
    <td><%=rs4.getString(4)%></td>
    <% jet10=Integer.parseInt(rs4.getString(2));
       jet11=Integer.parseInt(rs4.getString(3));
       jet12=jet10*jet11;
	   adj3_1=jet12;
	   sum3_1+=adj3_1;
	   asc3_1=jet10;
	   denom3_1+=asc3_1;
     %>
    <td><%=jet12%></td>
</tr>

<%} 
 grade4=(sum3_1)/(denom3_1);
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom3_1%></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum3_1%></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade4%></b></p><br><br>
        
        
        
        <p>-----------------------------------------------------------------------------------------</p>
        <p>Semister : 3-2</p>
            
       <%  PreparedStatement pst4=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId`INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=? ");
        
       pst4.setInt(1,student_Id);
       pst4.setString(2,"3-2");
       /* pst4.setString(3,studentDept);
        */ResultSet rs5=pst4.executeQuery();      
        %>
        
        <table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
    <% while(rs5.next()){%>
<tr>
    <td><%=rs5.getString(1)%></td> 
    <td><%=rs5.getString(2)%></td>
    <td><%=rs5.getString(4)%></td>
    <% jet13=Integer.parseInt(rs5.getString(2));
       jet14=Integer.parseInt(rs5.getString(3));
       jet15=jet13*jet14;
	   adj3_2=jet15;
	   sum3_2+=adj3_2;
	   asc3_2=jet13;
	   denom3_2+=asc3_2;
     %>
    <td><%=jet15%></td>
</tr>

<%} 
 grade5=(sum3_2)/(denom3_2);
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom3_2%></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum3_2%></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade5%></b></p><br><br>
        
        
        
        
        <p>-----------------------------------------------------------------------------------------</p>
        <p>Semister : 4-1</p>
            
       <%  PreparedStatement pst5=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId`INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=?");
        
       pst5.setInt(1,student_Id);
       pst5.setString(2,"4-1");
      /*  pst5.setString(3,studentDept); */
       ResultSet rs6=pst5.executeQuery();      
        %>
        
        <table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
    <% while(rs6.next()){%>
<tr>
    <td><%=rs6.getString(1)%></td> 
    <td><%=rs6.getString(2)%></td>
    <td><%=rs6.getString(4)%></td>
    <% jet16=Integer.parseInt(rs6.getString(2));
       jet17=Integer.parseInt(rs6.getString(3));
       jet18=jet16*jet17;
	   adj4_1=jet18;
	   sum4_1+=adj4_1;
	   asc4_1=jet16;
	   denom4_1+=asc4_1;
     %>
    <td><%=jet18%></td>
</tr>

<%} 
 grade6=(sum4_1)/(denom4_1);
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom4_1%></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum4_1%></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade6%></b></p><br><br>
        
        
        
        <p>-----------------------------------------------------------------------------------------</p>
        <p>Semister : 4-2</p>
            
       <%  PreparedStatement pst6=con.prepareStatement("SELECT subjects.`subjectName`,subjects.`actualCredits`,studentcredits.creditsObtained,grades.`grades` FROM studentcredits INNER JOIN subjects ON subjects.`subjectId` = studentcredits.`subjectId`INNER JOIN grades ON grades.creditsObtained=studentcredits.creditsObtained WHERE studentId=? AND semister=?");
        
       pst6.setInt(1,student_Id);
       pst6.setString(2,"4-2");
       /* pst6.setString(3,studentDept);
        */ResultSet rs7=pst6.executeQuery();      
        %>
        
        <table>
 <tr>
	<th>SUBJECTS</th>
	<th>CREDITS</th>
	<th>OBTAINED CREDITS</th>
	<th>POINTS</th>
 </tr>	
    <% while(rs7.next()){%>
<tr>
    <td><%=rs7.getString(1)%></td> 
    <td><%=rs7.getString(2)%></td>
    <td><%=rs7.getString(4)%></td>
    <% jet19=Integer.parseInt(rs7.getString(2));
       jet20=Integer.parseInt(rs7.getString(3));
       jet21=jet19*jet20;
	   adj4_2=jet21;
	   sum4_2+=adj4_2;
	   asc4_2=jet19;
	   denom4_2+=asc4_2;
     %>
    <td><%=jet21%></td>
</tr>

<%} 
 grade7=(sum4_2)/(denom4_2);
%>
</table>  
       <table>
          <tr>
          <td>Credits</td>
          <td><%=denom4_2%></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoints</td>
          <td><%=sum4_2%></td></tr>
       </table>
       
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>SGPA</b> (SEMISTER GRADE POINT AVERAGE) : <b><%=grade7%></b></p><br><br>
        <% float sum8=0,cgpa=0;
        sum8=grade1+grade2+grade3+grade4+grade5+grade6+grade7;
        cgpa=(sum8)/7;
        %>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<b>CGPA</b> (CUMULATIVE GRADE POINT AVERAGE) : <b><%=cgpa%></b></p><br><br>
        
       <%
       
       float cumulativeGrade = cgpa;
       String cumulativegpa = String.valueOf(cumulativeGrade);
  
       PreparedStatement pst8=con.prepareStatement("INSERT INTO studentgpa(student_id,departmentId,overall)VALUES(?,?,?)");
       pst8.setInt(1, student_Id);
       pst8.setString(2, studentDept);
       pst8.setString(3, cumulativegpa);
                 int i=pst8.executeUpdate();
                 if(i>=0)
      		   {
      			   System.out.println("records have been successfuly saved");
      		   }
    %>
        <p>----------------------------------------------------------------------------------------------------------------------------------------</p>
        <p>----------------------------------------------------------------------------------------------------------------------------------------</p>
        <p>----------------------------------------------------------------------------------------------------------------------------------------</p>
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




