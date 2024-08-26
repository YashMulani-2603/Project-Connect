<%-- 
    Document   : view all
    Created on : Aug 26, 2024, 1:32:32 AM
    Author     : hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
           
    ArrayList EmailList = new ArrayList();

    
    PreparedStatement selectAllRecord = con.prepareStatement("select * from mail");
    ResultSet showAllRS = selectAllRecord.executeQuery();
    
    while(showAllRS.next()){
        EmailList.add(showAllRS.getString(1));

    }
    
%>


<div class="dashboarddiv">
    <table width="100%" class="viewtheme">
        <%
        for(int i=0;i<EmailList.size();i++){
        %>
            <tr>
                <td width="10%" style="border:solid;"><%=EmailList.get(i)%></td>
               
            </tr>
        <%}%>
    </table>
</div>
