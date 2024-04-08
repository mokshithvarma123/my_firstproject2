<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Registered Users</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>Registered Users</h2>

<table>
  <tr>
    
    <th>Name</th>
    <th>Gender</th>
    <th>Age</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Region</th>
    <th>Comments</th>
    
  </tr>
  <c:forEach var="user" items="${userList}">
    <tr>
        
        <td>${user.name}</td>
        <td>${user.gender}</td>
        <td>${user.age}</td>
        <td>${user.email}</td>
        <td>${user.phone}</td>
        <td>${user.region}</td>
        <td>${user.comments}</td>
        
    </tr>
  </c:forEach>
</table>

</body>
</html>
