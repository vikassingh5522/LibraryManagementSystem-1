<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.BookDAO, model.Book" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1512820790803-83ca734da794');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #fff;
        }

        .container {
            max-width: 900px;
            margin: 60px auto;
            padding: 40px;
            background: rgba(0, 0, 0, 0.85);
            border-radius: 12px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.6);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #00e6e6;
        }

        .form-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        label {
            flex: 0 0 25%;
            font-weight: bold;
            color: #00ffff;
            margin-right: 10px;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        select {
            flex: 1;
            padding: 10px;
            border-radius: 6px;
            border: none;
            background-color: #f0f0f0;
            color: #333;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #00ffff;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Book</h2>
        <%
            String id = request.getParameter("id");
            Book book = BookDAO.getBookById(Integer.parseInt(id));
        %>
        <form action="UpdateBookServlet" method="post">
            <input type="hidden" name="id" value="<%= book.getId() %>">

            <div class="form-row">
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" value="<%= book.getTitle() %>" required>
            </div>

            <div class="form-row">
                <label for="author">Author:</label>
                <input type="text" name="author" id="author" value="<%= book.getAuthor() %>" required>
            </div>

            <div class="form-row">
                <label for="genre">Genre:</label>
                <input type="text" name="genre" id="genre" value="<%= book.getGenre() %>" required>
            </div>

            <div class="form-row">
                <label for="description">Description:</label>
                <textarea name="description" id="description" rows="3" required><%= book.getDescription() %></textarea>
            </div>

            <div class="form-row">
                <label for="isbn">ISBN:</label>
                <input type="text" name="isbn" id="isbn" value="<%= book.getIsbn() %>" required>
            </div>

            <div class="form-row">
                <label for="pages">Pages:</label>
                <input type="number" name="pages" id="pages" value="<%= book.getPages() %>" required>
            </div>

            <div class="form-row">
                <label for="price">Price:</label>
                <input type="number" step="0.01" name="price" id="price" value="<%= book.getPrice() %>" required>
            </div>

            <div class="form-row">
                <label for="status">Status:</label>
                <select name="status" id="status" required>
                    <option value="Available" <%= "Available".equals(book.getStatus()) ? "selected" : "" %>>Available</option>
                    <option value="Checked Out" <%= "Checked Out".equals(book.getStatus()) ? "selected" : "" %>>Checked Out</option>
                    <option value="Limited" <%= "Limited".equals(book.getStatus()) ? "selected" : "" %>>Limited</option>
                </select>
            </div>

            <input type="submit" value="Update Book">
        </form>

        <div class="back-link">
            <a href="manageBooks.jsp">&larr; Back to Manage Books</a>
        </div>
    </div>
</body>
</html>
