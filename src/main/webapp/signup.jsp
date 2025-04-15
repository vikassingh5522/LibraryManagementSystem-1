<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup | Library Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

        :root {
            --primary: #00ffff;
            --secondary: #0077ff;
            --dark-bg: #0f1e3a;
            --error: #ff4444;
            --success: #00C851;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
                        url('https://t3.ftcdn.net/jpg/09/04/20/08/360_F_904200893_eR5cYe2z8XSB7d6D3M5DUS8ljX0LlW2w.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .signup-container {
            background: rgba(15, 30, 58, 0.85);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.4);
            width: 700px;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(5px);
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .signup-container::before {
            content: '';
            position: absolute;
            top: -2px; left: -2px; right: -2px; bottom: -2px;
            background: linear-gradient(45deg, var(--primary), var(--secondary), var(--primary), var(--secondary));
            background-size: 400%;
            z-index: -1;
            border-radius: 17px;
            opacity: 0;
            transition: 0.5s;
            animation: glow 8s linear infinite;
        }

        @keyframes glow {
            0%, 100% { background-position: 0 0; }
            50% { background-position: 400% 0; }
        }

        .signup-container:hover::before {
            opacity: 1;
            filter: blur(3px);
        }

        h2 {
            text-align: center;
            color: var(--primary);
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
        }

        .form-row {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 1.2rem;
        }

        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        label {
            color: var(--primary);
            margin-bottom: 0.4rem;
            font-weight: 500;
        }

        input, select {
            padding: 0.8rem 1rem;
            border-radius: 8px;
            border: 1px solid rgba(0, 255, 255, 0.3);
            background: rgba(0,0,0,0.3);
            color: white;
            transition: 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary);
            background: rgba(0, 0, 0, 0.5);
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.4);
        }

        select {
            appearance: none;
            background-image: url("https://png.pngtree.com/thumb_back/fh260/background/20230425/pngtree-huge-library-with-old-books-that-have-multiple-doors-image_2513239.jpg");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1rem;
        }

        .submit-btn-container {
            display: flex;
            justify-content: center;
            margin-top: 1.5rem;
        }

        .submit-btn {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: #000;
            font-weight: 600;
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            letter-spacing: 1px;
            transition: 0.3s;
            text-transform: uppercase;
            box-shadow: 0 4px 15px rgba(0, 255, 255, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 255, 255, 0.5);
        }

        .message {
            padding: 0.8rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 500;
            animation: slideDown 0.4s ease;
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .error-message {
            background: rgba(255, 68, 68, 0.2);
            color: var(--error);
            border: 1px solid var(--error);
        }

        .success-message {
            background: rgba(0, 200, 81, 0.2);
            color: var(--success);
            border: 1px solid var(--success);
        }

        .login-link {
            text-align: center;
            margin-top: 1.2rem;
            font-size: 0.9rem;
        }

        .login-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
            text-shadow: 0 0 5px rgba(0, 255, 255, 0.5);
        }

        @media (max-width: 768px) {
            .signup-container {
                width: 90%;
                padding: 1.5rem;
            }

            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Create Account</h2>

        <!-- Show success or error messages -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="message error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } else if (request.getParameter("success") != null) { %>
            <div class="message success-message">
                Registration successful! Please login.
            </div>
        <% } %>

        <form action="SignupServlet" method="post" id="signupForm">
            <div class="form-row">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="role">Role</label>
                    <select id="role" name="role" required>
                        <option value="user">User</option>
                        <option value="librarian">Librarian</option>
                    </select>
                </div>
                <div class="form-group"><!-- empty for spacing --></div>
            </div>

            <div class="submit-btn-container">
                <button type="submit" class="submit-btn">Sign Up</button>
            </div>
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</body>
</html>
