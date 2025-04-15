package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;
import model.Book; // ✅ Correct model import

@WebServlet("/bookDetails")
public class BookDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String bookIdParam = request.getParameter("bookId");
        System.out.println("[DEBUG] Received bookId: " + bookIdParam);

        if (bookIdParam == null || bookIdParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing book ID");
            return;
        }

        try {
            int bookId = Integer.parseInt(bookIdParam);
            Book book = BookDAO.getBookById(bookId);

            if (book == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Book not found");
                return;
            }

            System.out.println("[DEBUG] Found book: " + book.getTitle()); // ✅ use instance

            request.setAttribute("book", book);
            request.getRequestDispatcher("/bookDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid book ID format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error");
        }
    }
}