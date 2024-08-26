<%-- 
    Document   : insert
    Created on : Aug 25, 2024, 11:38:32 PM
    Author     : hp
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    String Name = request.getParameter("name");
    String Email = request.getParameter("email");
    String MobileNumber = request.getParameter("mobile");
    String Area = request.getParameter("area");
    String city = request.getParameter("city");
    String sub= request.getParameter("Sub");
    String mail=request.getParameter("newsletter-email");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "root");
        
        PreparedStatement InsertTableInsertQ = con.prepareStatement("INSERT INTO form (Name, Email, MobileNumber, Area, city) VALUES (?, ?, ?, ?, ?)");
        
        InsertTableInsertQ.setString(1, Name);
        InsertTableInsertQ.setString(2, Email);
        InsertTableInsertQ.setString(3, MobileNumber);
        InsertTableInsertQ.setString(4, Area);
        InsertTableInsertQ.setString(5, city);
        
        InsertTableInsertQ.executeUpdate();
        
        con.close();
    
    }catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-image: url('media/C.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    scroll-behavior: smooth; 
}

header {
    color: white;
    padding: 20px 0;
    text-align: center;
    background: rgba(0, 0, 0, 0.5);
}

header .branding {
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 24px;
    font-weight: bold;
}

nav {
    text-align: center;
    padding: 10px;
    background: rgba(0, 0, 0, 0.5); 
}

nav a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-weight: bold;
    padding: 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

nav a:hover {
    background-color: rgba(255, 255, 255, 0.2);
    color: #f1f1f1;
}

.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.left-section {
    width: 100%;
    padding: 20px;
}

.right-section {
    width: 100%;
    padding: 20px;
    border-radius: 5px;
    background-color: #f4f4f4; 
}

.right-section form {
    display: flex;
    flex-direction: column;
}

.right-section form input, 
.right-section form textarea {
    margin-bottom: 10px;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.right-section form button {
    padding: 10px;
    background-color: #444;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.right-section form button:hover {
    background-color: #333;
}


.our-projects {
    margin-top: 40px;
    text-align: center;
}

.our-projects .project {
    display: inline-block;
    width: 300px;
    margin: 20px;
    text-align: center;
    background-color: #fff; 
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.our-projects .project:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.our-projects .project img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 5px;
    margin-bottom: 15px;
}

.our-projects .project h3 {
    font-size: 20px;
    margin-bottom: 10px;
}

.our-projects .project p {
    font-size: 14px;
    color: #777;
    margin-bottom: 15px;
}

.our-projects .project .read-more {
    padding: 10px 20px;
    background-color: #444;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.our-projects .project .read-more:hover {
    background-color: #333;
}

footer {
    color: white;
    text-align: center;
    padding: 30px;
    display: flex;
    flex-direction: column;
    align-items: center;
    background: rgba(0, 0, 0, 0.8);
}

footer .newsletter {
    margin-bottom: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    padding: 20px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    animation: fadeInUp 1s ease-in-out;
}

footer .newsletter input[type="email"] {
    padding: 15px;
    border: 2px solid #fff;
    border-radius: 25px;
    margin-right: 10px;
    width: 300px;
    font-size: 16px;
    outline: none;
    transition: all 0.3s ease;
}

footer .newsletter input[type="email"]:focus {
    border-color: #fff;
    background-color: #f1f1f1;
}

footer .newsletter button {
    padding: 15px 30px;
    background-color: #fff;
    color: #2575fc;
    border: none;
    border-radius: 25px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

footer .newsletter button:hover {
    background-color: #2575fc;
    color: #fff;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    transform: translateY(-3px);
}


@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}


.about-section, .contact-section {
    padding: 40px;
    background-color: #f4f4f4;
    border-radius: 10px;
    margin-top: 40px;
    text-align: center;
    animation: fadeInUp 1s ease-in-out;
}

.about-section h2, .contact-section h2 {
    margin-bottom: 20px;
 
}

.map-container {
    margin-top: 40px;
    text-align: center;
}

.map-container iframe {
    border: 0;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 800px;
    height: 400px;
}


@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }

    .left-section,
    .right-section {
        width: 100%;
    }

    footer .newsletter input[type="email"],
    footer .newsletter button {
        width: 100%;
        margin-right: 0;
        margin-bottom: 10px;
    }

    footer .newsletter button {
        margin-top: 10px;
    }

    .map-container iframe {
        width: 100%;
        height: 300px;
    }
}
</style>

</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - My Website</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <header>
        <div class="branding"></div>
        <img src="media/logo.jpg" align="left" width="300" height="80">
        <h1>Welcome to My Website</h1>
    </header>

    <nav>
        <a href="#home">Home</a>
        <a href="#about">About</a>
        <a href="#contact">Contact</a>
    </nav>

    <div class="container" id="home">
        <div class="left-section">
            <h2>Home Page</h2>
            <p>This is the home page of the website. Here you can find an introduction and some general information.</p>

         
            <div class="our-projects">
                <h2>Our Projects</h2>
                
  
                <div class="project">
                    <img src="media/Sold.jpg" length="100" width="300" alt="Project 1">
                    <h3>Project One</h3>
                    <p>This is a brief description of Project One. It covers the basics of what the project entails.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
                
    
                <div class="project">
                    <img src="media/House.jpg" length="100" width="300" alt="Project 2">
                    <h3>Project Two</h3>
                    <p>This is a brief description of Project Two. It covers the basics of what the project entails.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
                

            </div>

            <div class="happy-clients">
                <h2>Happy Clients</h2>
                <div class="client">
                    <img src="media/ym.jpg"  alt="Client 1">
                    <p class="name">Yash Mulani</p>
                    <p class="designation">CEO, Yash Trading Company</p>
                </div>
                <div class="client">
                    <img src="media/ak.jpg" alt="Client 2">
                    <p class="name">Akshat Thakur</p>
                    <p class="designation">Marketing Head, Ak Technical</p>
                </div>
            </div>
        </div>

        <div class="right-section">
            <form action="">
                <h2>Get a Free Consultation</h2>
                <input type="text" name="name" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="text" name="mobile" placeholder="Mobile Number" required>
                <input type="text" name="area" placeholder="Area" required>
                <input type="text" name="city" placeholder="City" required>
                <button type="submit" name="whatever">Get Quick Quote</button>
            </form>
        </div>
    </div>

    <footer>
        <div class="newsletter">
            <form action="subscribe.jsp">
                <input type="email" name="newsletter-email" placeholder="Your Email" required>
                <button type="submit" name="Sub">Subscribe</button>
            </form>
        </div>
        
  
    <section id="about" style="color: #2c3e50;" class="about-section">
        <h2>About Us</h2>
        <p>Welcome to our website! We are dedicated to providing the best services to our clients. Our team of professionals works tirelessly to ensure customer satisfaction and excellence in every project we undertake.</p>
        <p>Our mission is to innovate and lead in our industry, setting new standards for quality and reliability. We believe in building long-lasting relationships with our clients by delivering exceptional results.</p>
    </section>


    <section id="contact" style="color: #2c3e50;"class="contact-section">
        <h2>Contact Us</h2>
        <p>If you have any questions, feel free to reach out to us. We are here to assist you with any inquiries or support you may need.</p>
        <p><strong>Email:</strong> yashmulani2611@gmail.com</p>
        <p><strong>Phone:</strong> +91 123 456 7890</p>
        <p><strong>Address:</strong> 123,Sindhi colony Ujjain, India</p>
        <div class="map-container">
            <div class="mapdiv"><iframe width="500" height="500" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" id="gmap_canvas" src="https://maps.google.com/maps?width=520&amp;height=400&amp;hl=en&amp;q=230/4santram%20sindhi%20colony%20UJJAIN+(map)&amp;t=&amp;z=12&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe></div>
        </div>
    </section>
     
        <div class="social-media">
            <a href="https://www.instagram.com" target="_blank">
                <img src="media/Group.jpg" alt="Instagram">
            </a>
            <a href="https://www.linkedin.com" target="_blank">
                <img src="media/Linkedin.jpg" alt="LinkedIn">
            </a>
            <a href="https://www.facebook.com" target="_blank">
                <img src="media/Frame.jpg" alt="Facebook">
            </a>
        </div>
    </footer>

</body>
</html>