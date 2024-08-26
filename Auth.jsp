<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>

<%
   String username=request.getParameter("username");
   String pssword=request.getParameter("password");

      Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
   PreparedStatement st1=
 con.prepareStatement("select  *  from auth where Username=? and Password=?");
   st1.setString(1,username);
   st1.setString(2,pssword);
   ResultSet rs=st1.executeQuery();
                          
   if(rs.next())
   {
//   Cookie ck=new Cookie("Flipr Project",Password);
//                        ck.setMaxAge(1000000);
//                        response.addCookie(ck);
//                        session.setAttribute("user",userid);
                 response.sendRedirect("Dashboard.jsp");
   }
%>


<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #e9ecef;
}

.login-container {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    width: 350px;
    text-align: center;
    position: relative;
}

.login-image img {
    
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-container h2 {
    margin-bottom: 25px;
    color: #333;
    font-size: 24px;
}

.login-container input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 30px;
    font-size: 16px;
    transition: border-color 0.3s ease;
}

.login-container input:focus {
    border-color: #007bff;
    outline: none;
}

.login-container button {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 30px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.login-container button:hover {
    background-color: #0056b3;
}

.error-message {
    color: red;
    margin-top: 10px;
   

</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="admin-styles.css">
</head>
<body>

    <div class="login-container">
        <div class="login-image">
            <img src="media/logoad.png" alt="Admin">
        </div>
        <h2>Admin Login</h2>
        <form action="">
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p id="loginError" class="error-message"></p>
    </div>

    <script src="admin-scripts.js"></script>
</body>
</html>
<script>
    document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    if (username === 'admin' && password === 'password') {
        window.location.href = 'admin-dashboard.html';
    } else {
        document.getElementById('loginError').textContent = 'Invalid username or password.';
    }
});
</script>
