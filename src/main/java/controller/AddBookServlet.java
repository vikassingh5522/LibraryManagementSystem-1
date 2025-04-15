package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.BookDAO;
import model.Book;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Get parameters from form
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String genre = request.getParameter("genre");
            String description = request.getParameter("description");
            String isbn = request.getParameter("isbn");
            int publicationYear = Integer.parseInt(request.getParameter("year"));
            int pages = Integer.parseInt(request.getParameter("pages"));
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            
            // Create new book
            int newId = BookDAO.getNextId();
            Book newBook = new Book(newId, title, author, genre, description, 
                                  isbn, publicationYear, pages, price, status);
            
            // Add the book to the system
            boolean success = BookDAO.addBook(newBook);
            
            if (success) {
                request.getSession().setAttribute("message", "Book added successfully!");
            } else {
                request.getSession().setAttribute("error", "Failed to add book");
            }
            
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error: " + e.getMessage());
            e.printStackTrace();
        }
        
        // Redirect back to manage books page
        response.sendRedirect("manageBooks.jsp");
    }
}