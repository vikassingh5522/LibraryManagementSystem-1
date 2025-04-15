<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Details - ${book.title}</title>
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #34495e;
            --accent: #3498db;
            --success: #2ecc71;
            --warning: #f39c12;
            --danger: #e74c3c;
        }
        
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f7fa;
        }
        
        
        .book-details-container {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .book-header {
            display: flex;
            gap: 30px;
            margin-bottom: 20px;
        }
        
        .book-cover {
            flex: 0 0 200px;
            height: 300px;
            background: #eee;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        
        .book-info {
            flex: 1;
        }
        
        .book-title {
            font-size: 1.8rem;
            margin: 0;
            color: var(--primary);
        }
        
        .book-author {
            color: #7f8c8d;
            margin-bottom: 15px;
        }
        
        .book-meta {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .book-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
        }
        
        .badge-genre {
            background: var(--accent);
            color: white;
        }
        
        .badge-status {
            background: ${book.status eq 'Available' ? 'var(--success)' : 
                         book.status eq 'Limited' ? 'var(--warning)' : 'var(--danger)'};
            color: white;
        }
        
        .price-tag {
            font-size: 1.3rem;
            font-weight: 600;
            color: var(--primary);
            margin: 15px 0;
        }
        
        .book-description {
            line-height: 1.6;
            margin: 20px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 4px;
        }
        
        .detail-row {
            display: flex;
            margin-bottom: 10px;
        }
        
        .detail-label {
            font-weight: 500;
            min-width: 150px;
            color: var(--secondary);
        }
        
        .action-buttons {
            margin-top: 30px;
            display: flex;
            gap: 15px;
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: var(--accent);
            color: white;
        }
        
        .btn-primary:hover {
            background: #2980b9;
        }
        
        .btn-secondary {
            background: #ecf0f1;
            color: var(--secondary);
        }
        
        .btn-secondary:hover {
            background: #dfe6e9;
        }
        
        .btn-disabled {
            background: #bdc3c7;
            color: #7f8c8d;
            cursor: not-allowed;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="book-details-container">
        <c:choose>
            <c:when test="${not empty book}">
                <div class="book-header">
                    <div class="book-cover">
                    <img src="assets/img/image1.jpg" alt="${book.title}" style="width: 100%; height: 100%; object-fit: cover; border-radius: 4px;">
                        <i class="fas fa-book-open" style="font-size: 2rem; color: #95a5a6;"></i>
                    </div>
                    
                    <div class="book-info">
                        <h1 class="book-title">${book.title}</h1>
                        <p class="book-author">by ${book.author}</p>
                        
                        <div class="book-meta">
                            <span class="book-badge badge-genre">${book.genre}</span>
                            <span class="book-badge badge-status">${book.status}</span>
                        </div>
                        
                        <div class="price-tag">$${book.price}</div>
                    </div>
                </div>
                
                <div class="book-description">
                    <h3>Description</h3>
                    <p>${book.description}</p>
                </div>
                
                <div class="book-details">
                    <div class="detail-row">
                        <span class="detail-label">ISBN:</span>
                        <span>${book.isbn}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Publication Year:</span>
                        <span>${book.publicationYear}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Pages:</span>
                        <span>${book.pages}</span>
                    </div>
                </div>
                
                <div class="action-buttons">
                    <c:choose>
                        <c:when test="${book.status eq 'Available'}">
                            <form action="borrowBook" method="post">
                                <input type="hidden" name="bookId" value="${book.id}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-bookmark"></i> Borrow Book
                                </button>
                            </form>
                        </c:when>
                        <c:when test="${book.status eq 'Limited'}">
                            <form action="borrowBook" method="post">
                                <input type="hidden" name="bookId" value="${book.id}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-clock"></i> Reserve Book
                                </button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-disabled" disabled>
                                <i class="fas fa-times-circle"></i> Not Available
                            </button>
                        </c:otherwise>
                    </c:choose>
                    
                    <a href="userdashboard.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to Browse
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <p>Book not found</p>
                <a href="userdashboard.jsp" class="btn btn-secondary">Back to Browse</a>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>