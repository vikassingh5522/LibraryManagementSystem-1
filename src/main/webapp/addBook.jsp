<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20230526/pngtree-an-old-bookcase-in-a-library-image_2642908.jpg'); /* Replace with actual image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px 40px;
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
        }

        h2 {
            text-align: center;
            color: #00ffcc;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            margin-bottom: 15px;
            align-items: center;
        }

        .form-group label {
            width: 30%;
            font-weight: bold;
            padding-right: 10px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 70%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #f2f2f2;
            color: #333;
        }

        .form-group textarea {
            resize: vertical;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .back-btn {
            text-align: center;
            margin-top: 20px;
        }

        .back-btn a {
            color: #00ffff;
            text-decoration: none;
            font-weight: bold;
        }

        .back-btn a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Book</h2>
        <form action="AddBookServlet" method="post">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" required>
            </div>

            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" name="author" id="author" required>
            </div>

            <div class="form-group">
                <label for="genre">Genre:</label>
                <input type="text" name="genre" id="genre" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea name="description" id="description" required></textarea>
            </div>

            <div class="form-group">
                <label for="isbn">ISBN:</label>
                <input type="text" name="isbn" id="isbn" required>
            </div>

            <div class="form-group">
                <label for="year">Year:</label>
                <input type="number" name="year" id="year" required>
            </div>

            <div class="form-group">
                <label for="pages">Pages:</label>
                <input type="number" name="pages" id="pages" required>
            </div>

            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" name="price" id="price" required>
            </div>

            <div class="form-group">
                <label for="status">Status:</label>
                <select name="status" id="status" required>
                    <option value="Available">Available</option>
                    <option value="Checked Out">Checked Out</option>
                    <option value="Limited">Limited</option>
                </select>
            </div>

            <input type="submit" value="Add Book">
        </form>

        <div class="back-btn">
            <a href="manageBooks.jsp">&larr; Back to Manage Books</a>
        </div>
    </div>
</body>
</html>
