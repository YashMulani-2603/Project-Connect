<%-- 
    Document   : AuthDistroy
    Created on : Feb 6, 2024, 9:03:57?PM
    Author     : hp
--%>
<%
    session.invalidate();
    response.sendRedirect("Auth.jsp");
%>
