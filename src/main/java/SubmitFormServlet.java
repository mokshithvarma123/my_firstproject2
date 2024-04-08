import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/SubmitFormServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class SubmitFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/database";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASSWORD = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String region = request.getParameter("region");
        String comments = request.getParameter("comments");
       

        

        // Store data in MySQL database
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            // Establishing a connection to the database
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL query to insert form data into the database
            String sql = "INSERT INTO user_info (name, gender, age, email, phone, region, comments) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, gender);
            statement.setString(3, age);
            statement.setString(4, email);
            statement.setString(5, phone);
            statement.setString(6, region);
            statement.setString(7, comments); // Include comments in the INSERT statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("registrationConfirmation.jsp");
            } else {
                response.getWriter().println("Failed to register user.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle any errors here
        } finally {
            // Closing the connection and statement
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

     
}
