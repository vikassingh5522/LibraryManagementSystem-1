	package controller;
	
	import java.io.IOException;
	
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

import DAO.BookDAO;
	
	@WebServlet("/borrowBook")
	public class BorrowBookServlet extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        
	        HttpSession session = request.getSession();
	        
	        try {
	            int bookId = Integer.parseInt(request.getParameter("bookId"));
	            
	            if (BookDAO.borrowBook(bookId)) {
	                session.setAttribute("message", "Book borrowed successfully!");
	            } else {
	                session.setAttribute("error", "Book is not available for borrowing");
	            }
	        } catch (NumberFormatException e) {
	            session.setAttribute("error", "Invalid book ID");
	        }
	        
	        response.sendRedirect(request.getContextPath() + "/userdashboard.jsp");
	    }
	}