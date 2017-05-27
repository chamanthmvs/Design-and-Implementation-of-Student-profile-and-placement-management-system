<%@ page language="java" import="java.sql.*,com.JdbcConnection.JdbcConnection,java.io.*,java.util.*,javax.mail.*,
javax.mail.internet.*,javax.activation.*,javax.servlet.http.*,javax.servlet.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send E-mail</title>
</head>
<body>
<%
Connection con=JdbcConnection.getCon();
String result;

// Recipient's email ID needs to be mentioned.
String to = (String)session.getAttribute("studentemail");

// Sender's email ID needs to be mentioned
String from = "mvschamanth@gmail.com";

// Assuming you are sending email from localhost
String host = "localhost";

// Get system properties object
Properties properties = System.getProperties();

// Setup mail server
properties.setProperty("mail.smtp.host", host);

// Get the default Session object.
Session mailSession = Session.getDefaultInstance(properties);

try {
   // Create a default MimeMessage object.
   MimeMessage message = new MimeMessage(mailSession);
   
   // Set From: header field of the header.
   message.setFrom(new InternetAddress(from));
   
   // Set To: header field of the header.
   message.addRecipient(Message.RecipientType.TO,
                            new InternetAddress(to));
   // Set Subject: header field
   message.setSubject("This is the Subject Line!");
   
   // Now set the actual message
   message.setText("your records are saved");
   
   // Send message
   Transport.send(message);
   result = "Sent message successfully....";
} catch (MessagingException mex) {
   mex.printStackTrace();
   result = "Error: unable to send message....";
}
%>
 <p align = "center">
      <% 
         out.println("Result: " + result + "\n");
      %>
   </p>
</body>
</html>