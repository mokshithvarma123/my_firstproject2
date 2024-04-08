<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration Form</title>
    <style>
        body {
            font-family: "Times New Roman", Times, serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #555;
        }
        input[type="text"], input[type="email"], input[type="tel"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: "Times New Roman", Times, serif;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            font-family: "Times New Roman", Times, serif;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    
    <div class="container">
        <h1>User Registration Form</h1>
        <form action="SubmitFormServlet" method="post" enctype="multipart/form-data">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            
            <label for="age">Age:</label>
            <input type="date" id="age" name="age" required>
            
            <label for="email">Email ID:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>
            
            
            <label for="region">Region:</label>
<select id="region" name="region">
    <option value="">Select Region</option>
    <option value="India">India</option>
    <option value="North America">North America</option>
    <option value="South America">South America</option>
    <option value="Europe">Europe</option>
    <option value="Asia">Asia</option>
    <option value="Africa">Africa</option>
    <option value="Australia">Australia</option>
    <!-- Add more regions as needed -->
</select>
            
            
            <label for="comments">Comments:</label>
            <textarea id="comments" name="comments" rows="4" required></textarea>
            
           
            <input type="submit" value="Submit">
        </form>
    </div>
    <div class="container">
        <h1>Users Registered</h1>
        <!-- Your registration form here -->
        <button id="viewUsersBtn">View Registered Users</button>
    </div>

    <script>
        document.getElementById("viewUsersBtn").addEventListener("click", function() {
            // Open a new tab/window
            var userListWindow = window.open("", "_blank");

            // AJAX request to fetch registered users
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Write the response (user list) to the new tab/window
                        userListWindow.document.write(xhr.responseText);
                    } else {
                        console.error("Error fetching users: " + xhr.statusText);
                    }
                }
            };
            xhr.open("GET", "ViewUsersServlet", true);
            xhr.send();
        });
    </script>
    
</body>
</html>
