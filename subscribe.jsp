<%-- 
    Document   : subscribe
    Created on : Aug 26, 2024, 12:58:17 AM
    Author     : hp
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String mail=request.getParameter("newsletter-email");
try
{
Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "root");
        
        PreparedStatement InsertTableInsertQ = con.prepareStatement("INSERT INTO mail (Email) VALUES (?)");
        
     InsertTableInsertQ.setString(1, mail);
     InsertTableInsertQ.executeUpdate();
        
        con.close();
    response.sendRedirect("insert.jsp");
}
     catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
        
}
%>