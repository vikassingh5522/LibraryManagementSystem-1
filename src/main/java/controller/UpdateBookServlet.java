package controller;

import java.awt.print.Book;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        // Get all other parameters similarly
        
        // In real implementation, you would update the book in database
        model.Book book = BookDAO.getBookById(id);
        if(book != null) {
            book.setTitle(title);
            book.setAuthor(author);
            // Set all other properties
        }
        
        response.sendRedirect("manageBooks.jsp");
    }
}