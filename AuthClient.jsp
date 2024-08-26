<%-- 
    Document   : AuthClient
    Created on : Aug 26, 2024, 3:32:34 PM
    Author     : hp
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    String clientImage = request.getParameter("clientImage");
    String clientName = request.getParameter("clientName");
    String clientDesignation= request.getParameter("clientDesignation");
    String clientDescription= request.getParameter("clientDescription");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "root");
        
        PreparedStatement InsertTableInsertQ = con.prepareStatement("INSERT INTO cimg (image,Name,Discription,Designation) VALUES (?, ?, ?, ?)");
        
        InsertTableInsertQ.setString(1, clientImage);
        InsertTableInsertQ.setString(2, clientName);
        InsertTableInsertQ.setString(3, clientDesignation);
        InsertTableInsertQ.setString(4, clientDescription);
   
        
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
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="file"] {
    margin-bottom: 10px;
}

button {
    display: inline-block;
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

#imagePreviewContainer {
    display: none;
    margin-bottom: 10px;
    text-align: center;
}

#imagePreview {
    max-width: 100%;
    max-height: 300px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Client</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css"/>
</head>
<body>
    <div class="container">
        <h1>Add New Client</h1>
        <form id="clientForm">
            <div class="form-group">
                <label for="clientImage">Client Image:</label>
                <input type="file" id="clientImage" accept="image/*" required>
                <div id="imagePreviewContainer">
                    <img id="imagePreview" src="#" alt="Image Preview" />
                </div>
                <button type="button" id="cropButton">Crop Image</button>
            </div>
            <div class="form-group">
                <label for="clientName">Client Name:</label>
                <input type="text" id="clientName" name="clientName" placeholder="Enter client name" required>
            </div>
            <div class="form-group">
                <label for="clientDescription">Client Description:</label>
                <textarea id="clientDescription" name="clientDescription" placeholder="Enter client description" required></textarea>
            </div>
            <div class="form-group">
                <label for="clientDesignation">Client Designation:</label>
                <input type="text" id="clientDesignation" name="clientDesignation" placeholder="Enter client designation (e.g., CEO, Web Developer)" required>
            </div>
            <button type="submit">Add Client</button>
        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js"></script>
    <script src="scripts.js"></script>
</body>
</html>


<script>
document.addEventListener("DOMContentLoaded", function () {
    const clientImage = document.getElementById('clientImage');
    const imagePreviewContainer = document.getElementById('imagePreviewContainer');
    const imagePreview = document.getElementById('imagePreview');
    const cropButton = document.getElementById('cropButton');
    let cropper;

    clientImage.addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                imagePreview.src = e.target.result;
                imagePreviewContainer.style.display = 'block';

                if (cropper) {
                    cropper.destroy();
                }

                cropper = new Cropper(imagePreview, {
                    aspectRatio: 1,
                    viewMode: 1,
                });
            };
            reader.readAsDataURL(file);
        }
    });

    cropButton.addEventListener('click', function () {
        if (cropper) {
            const croppedCanvas = cropper.getCroppedCanvas();
            imagePreview.src = croppedCanvas.toDataURL();
            cropper.destroy();
            cropper = null;
        }
    });

    document.getElementById('clientForm').addEventListener('submit', function (e) {
        e.preventDefault();
        // Handle form submission, e.g., send cropped image data and other form data to the server.
        alert("Client added successfully!");
    });
});
</script>