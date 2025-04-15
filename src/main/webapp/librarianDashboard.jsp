<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.BookDAO, model.Book, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Librarian Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f5f5;
        }
        .header {
            background: #0f1e3a;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .sidebar {
            width: 250px;
            background: #1a2a4a;
            height: calc(100vh - 60px);
            float: left;
            position: fixed;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 15px;
            text-decoration: none;
            border-bottom: 1px solid #2a3a5a;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background: #2a3a5a;
        }
        .sidebar a.active {
            background: #3a4a6a;
            font-weight: bold;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .welcome {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .books-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        .books-table th, .books-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .books-table th {
            background-color: #0f1e3a;
            color: white;
            position: sticky;
            top: 0;
        }
        .books-table tr:hover {
            background-color: #f5f5f5;
        }
        .section-title {
            color: #0f1e3a;
            margin-bottom: 15px;
            font-size: 1.2em;
        }
        .action-btns {
            display: flex;
            gap: 5px;
        }
        .action-btns a {
            padding: 5px 10px;
            border-radius: 3px;
            text-decoration: none;
            color: white;
            font-size: 0.9em;
        }
        .edit-btn {
            background: #4CAF50;
        }
        .delete-btn {
            background: #f44336;
        }
        .logout-link {
            color: cyan !important;
            text-decoration: underline !important;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Library Management System</h2>
        <div>
            Welcome, <%= session.getAttribute("fullname") %> (Librarian) | 
            <a href="LogoutServlet" class="logout-link">Logout</a>
        </div>
    </div>
    
    <div class="sidebar">
        <a href="librarianDashboard.jsp" class="active">Dashboard</a>
        <a href="manageBooks.jsp">Manage Books</a>
        <a href="manageUsers.jsp">Manage Users</a>
        <a href="issueBooks.jsp">Issue Books</a>
        <a href="returnBooks.jsp">Return Books</a>
        <a href="reports.jsp">Reports</a>
    </div>
    
    <div class="content">
        <div class="welcome">
            <h3>Welcome to Librarian Dashboard</h3>
            <p>You can manage all library operations from here.</p>
        </div>
        
        <h3 class="section-title">Available Books</h3>
        <table class="books-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Book> availableBooks = BookDAO.getAvailableBooks();
                if(availableBooks != null && !availableBooks.isEmpty()) {
                    for(Book book : availableBooks) { %>
                        <tr>
                            <td><%= book.getId() %></td>
                            <td><%= book.getTitle() %></td>
                            <td><%= book.getAuthor() %></td>
                            <td><%= book.getGenre() %></td>
                            <td><%= book.getStatus() %></td>
                            <td class="action-btns">
                                <a href="editBook.jsp?id=<%= book.getId() %>" class="edit-btn">Edit</a>
                                <a href="DeleteBookServlet?id=<%= book.getId() %>" 
                                   class="delete-btn" 
                                   onclick="return confirm('Are you sure you want to delete this book?')">Delete</a>
                            </td>
                        </tr>
                <%  }
                } else { %>
                    <tr>
                        <td colspan="6" style="text-align: center;">No available books found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>