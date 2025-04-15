<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="DAO.BookDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard | LMS</title>
    <style>
        :root {
            --primary: #0f1e3a;
            --secondary: #1a2a4a;
            --accent: #00ffff;
            --light: #ffffff;
            --dark: #2a3a5a;
            --gray: #f5f5f5;
        }
        
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--gray);
            color: #333;
        }
        
        .header {
            background: var(--primary);
            color: var(--light);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .header h2 {
            margin: 0;
            font-weight: 600;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-info a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .user-info a:hover {
            text-shadow: 0 0 8px rgba(0, 255, 255, 0.6);
        }
        
        .sidebar {
            width: 250px;
            background: var(--secondary);
            height: calc(100vh - 60px);
            position: fixed;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar a {
            display: flex;
            align-items: center;
            color: var(--light);
            padding: 15px 20px;
            text-decoration: none;
            border-bottom: 1px solid var(--dark);
            transition: all 0.3s ease;
        }
        
        .sidebar a:hover {
            background: var(--dark);
            padding-left: 25px;
        }
        
        .sidebar a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .content {
            margin-left: 250px;
            padding: 30px;
        }
        
        .welcome {
            background: var(--light);
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            border-left: 4px solid var(--accent);
        }
        
        .welcome h3 {
            margin-top: 0;
            color: var(--primary);
        }
        
        .section-title {
            color: var(--primary);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .book-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
        }
        
        .book-card {
            background: var(--light);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }
        
        .book-card h4 {
            margin-top: 0;
            color: var(--primary);
            font-size: 1.2rem;
        }
        
        .book-card p {
            color: #666;
            margin-bottom: 15px;
        }
        
        .book-card .btn-borrow {
            background: var(--accent);
            color: var(--primary);
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .book-card .btn-borrow:hover {
            background: #00cccc;
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.4);
        }
        
        .book-status {
            position: absolute;
            top: 0;
            right: 0;
            background: var(--accent);
            color: var(--primary);
            padding: 3px 10px;
            font-size: 0.8rem;
            font-weight: 600;
            border-bottom-left-radius: 8px;
        }
        
        .message {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #c3e6cb;
        }
        
        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #f5c6cb;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            
            .content {
                margin-left: 0;
            }
            
            .book-list {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="header">
        <h2>Library Management System</h2>
        <div class="user-info">
            <span>Welcome, <strong>${sessionScope.user.name}</strong></span>
            <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
    
    <div class="sidebar">
        <a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="#"><i class="fas fa-book-open"></i> Browse Books</a>
        <a href="#"><i class="fas fa-bookmark"></i> My Books</a>
        <a href="#"><i class="fas fa-user-cog"></i> Profile</a>
        <a href="#"><i class="fas fa-history"></i> History</a>
        <a href="#"><i class="fas fa-bell"></i> Notifications</a>
    </div>
    
    <div class="content">
        <%-- Display messages --%>
        <% if (request.getSession().getAttribute("message") != null) { %>
            <div class="message">${sessionScope.message}</div>
            <% request.getSession().removeAttribute("message"); %>
        <% } %>
        
        <% if (request.getSession().getAttribute("error") != null) { %>
            <div class="error">${sessionScope.error}</div>
            <% request.getSession().removeAttribute("error"); %>
        <% } %>
        
        <div class="welcome">
            <h3>Welcome back, ${sessionScope.user.name}!</h3>
            <p>You have ${sessionScope.user.checkedOutBooks} books currently checked out. Browse our collection to find your next read.</p>
        </div>
        
        <h3 class="section-title">Featured Books</h3>
        
        <div class="book-list">
            <% 
            List<Book> books = BookDAO.getAllBooks();
            for (Book book : books) { 
            %>
                <div class="book-card">
                    <span class="book-status"><%= book.getStatus() %></span>
                    <h4><%= book.getTitle() %></h4>
                    <p>Author: <%= book.getAuthor() %></p>
                    <p>Genre: <%= book.getGenre() %></p>
                    
                    <% if ("Available".equals(book.getStatus())) { %>
                        <a href="bookDetails?bookId=<%= book.getId() %>" class="btn-borrow">Borrow Book</a>
                    <% } else if ("Limited".equals(book.getStatus())) { %>
                        <a href="bookDetails?bookId=<%= book.getId() %>" class="btn-borrow">Reserve Book</a>
                    <% } else { %>
                        <button class="btn-borrow" disabled>Currently Unavailable</button>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>