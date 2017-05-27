

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.sql.*;
import java.util.Enumeration;
import java.io.PrintWriter;

import com.JdbcConnection.JdbcConnection;
import javax.servlet.http.*;
/**
 * Servlet implementation class studentCurrentAcademics
 */
@WebServlet("/studentCurrentAcademics")
public class studentCurrentAcademics extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public studentCurrentAcademics() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session=request.getSession();
		int student_Id=(Integer)session.getAttribute("studentId");
		String studentDept=(String)session.getAttribute("studentDept");
		String studentCourse=(String)session.getAttribute("studentCourseStream");
		//String semister=(String)session.getAttribute("semister");

		PreparedStatement pst=null;
		PrintWriter writer = new PrintWriter(System.out);    
	     
			
			try{
				Connection con = JdbcConnection.getCon();
				pst = con.prepareStatement(
						"insert into studentcredits(studentId,subjectId,departmentId,courseId,creditsObtained,uniqueIdentification) values(?,?,?,?,?,?)");

				
				Enumeration<String> em=request.getParameterNames();
				while(em.hasMoreElements()){
					//Object os=em.hasMoreElements();
					String subId=(String)em.nextElement();
					String marks =request.getParameter(subId);
					String identity= student_Id + subId;
				    
				    	System.out.println("studentId:"+student_Id+"subId:"+subId+"credits:"+marks);

				  pst.setInt(1, student_Id);
				  pst.setString(2,subId);
				  pst.setString(3,studentDept);
				  pst.setString(4,studentCourse);
				  pst.setString(5,marks);
				  pst.setString(6,identity);
				  int i=pst.executeUpdate();
				   if(i>=0)
				   {
					   System.out.println("records have been successfuly saved");
					   response.sendRedirect("sende_mail.jsp");   
		     	}
				}
					  con.close();
					
		   }
			
		  
			
		catch(SQLException me)
			{
			  writer.write("Already record is saved!!!! you have entered duplicate record");  
			  writer.flush();  
		      writer.close(); 
				
			}
		catch(Exception e){
			   e.printStackTrace();
			   writer.write("e");  
				  
			  	   
		}

		
	}

}
