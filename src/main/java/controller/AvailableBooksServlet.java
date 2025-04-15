package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List; 

import DAO.BookDAO;
import model.Book;

@WebServlet("/librarian/availableBooks")
public class AvailableBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Book> availableBooks = BookDAO.getAvailableBooks();
        request.setAttribute("availableBooks", availableBooks);
        request.getRequestDispatcher("/librarian/availableBooks.jsp").forward(request, response);
    }
}