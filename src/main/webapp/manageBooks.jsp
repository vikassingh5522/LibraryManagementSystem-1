<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.BookDAO, model.Book, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20230425/pngtree-an-old-library-has-wooden-step-leading-to-stairs-image_2513238.jpg'); /* 🔁 Update with your background image path */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #fff;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            margin: 30px auto;
            padding: 30px;
            max-width: 1200px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.6);
        }

        h2 {
            text-align: center;
            color: #00ffcc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            background-color: rgba(255, 255, 255, 0.1);
        }

        th {
            background-color: rgba(0, 255, 204, 0.3);
            color: #fff;
        }

        .action-btns a {
            margin-right: 5px;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
        }

        .action-btns a:first-child {
            background-color: #28a745;
            color: white;
        }

        .action-btns a:last-child {
            background-color: #dc3545;
            color: white;
        }

        .add-btn {
            margin-bottom: 20px;
            text-align: right;
        }

        .add-btn a {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .add-btn a:hover {
            background-color: #0056b3;
        }

        .alert {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Books</h2>

        <%-- Display success/error messages --%>
        <% String message = (String) session.getAttribute("message");
           String error = (String) session.getAttribute("error");
           if (message != null) { %>
            <div class="alert success">
                <%= message %>
            </div>
        <% } 
           if (error != null) { %>
            <div class="alert error">
                <%= error %>
            </div>
        <% } 
           // Clear the messages after displaying
           session.removeAttribute("message");
           session.removeAttribute("error"); %>

        <div class="add-btn">
            <a href="addBook.jsp">+ Add New Book</a>
        </div>

        <table>
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
                List<Book> allBooks = BookDAO.getAllBooks();
                for(Book book : allBooks) { %>
                    <tr>
                        <td><%= book.getId() %></td>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td><%= book.getGenre() %></td>
                        <td><%= book.getStatus() %></td>
                        <td class="action-btns">
                            <a href="editBook.jsp?id=<%= book.getId() %>">Edit</a>
                            <a href="DeleteBookServlet?id=<%= book.getId() %>" 
                               onclick="return confirm('Are you sure you want to delete this book?')">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
