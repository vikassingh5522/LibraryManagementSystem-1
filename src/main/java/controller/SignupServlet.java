package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // 1. Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 2. Create Connection
            String dbURL = "jdbc:mysql://localhost:3306/library_db?useSSL=false&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "Vikas@9156";
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            
            // 3. Create SQL Query
            String sql = "INSERT INTO users (fullname, email, username, password, role) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, username);
            pstmt.setString(4, password);
            pstmt.setString(5, role);

            // 4. Execute Query
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                // Redirect to index.html with success parameter
                response.sendRedirect("index.html?signup=success");
            } else {
                request.setAttribute("errorMessage", "Signup Failed. Please try again.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database driver not found.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unexpected error occurred.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } finally {
            // 5. Clean up resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}