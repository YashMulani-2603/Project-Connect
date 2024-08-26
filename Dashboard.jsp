<%-- 
    Document   : Dashboard
    Created on : Aug 25, 2024, 5:00:57 PM
    Author     : hp
--%>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

header {
    background-color: #007bff;
    color: white;
    padding: 10px;
    text-align: center;
}

header nav {
    margin-top: 10px;
}

header nav a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-weight: bold;
}

header nav a:hover {
    text-decoration: underline;
}

main {
    padding: 20px;
}

.stats {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
}

.stat {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 30%;
    text-align: center;
}

.recent-activity {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.recent-activity ul {
    list-style-type: none;
    padding: 0;
}

.recent-activity li {
    margin-bottom: 10px;
}

footer {
    background-color: #007bff;
    color: white;
    text-align: center;
    padding: 10px;
    position: fixed;
    bottom: 0;
    width: 100%;
}
</style>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-dashboard-styles.css">
</head>
<body>

    <header>
        <h1>Admin Dashboard</h1>
        <nav>
            <a href="Dashboard.jsp">Home</a>
            <a href="Authproject.jsp">Project</a>
            <a href="AuthClient.jsp">Client</a>
            <a href="Contact.jsp">Contact Details</a>
            <a href="view2.jsp">Subscribed Email Addresses</a>
            <a href="Auth.jsp">Logout</a>
        </nav>
    </header>

    <main>


      
    </main>

    <footer>
        <p> Admin Dashboard</p>
    </footer>

    <script>
        document.getElementById('logout').addEventListener('click', function(event) {
            event.preventDefault();
            window.location.href = 'admin-login.html';
        });
    </script>

</body>
</html>
