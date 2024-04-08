import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewUsersServlet")
public class ViewUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/database";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASSWORD = "password";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> userList = new ArrayList<>();

        // Retrieve user data from the database
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            // Establishing a connection to the database
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL query to select all users
            String sql = "SELECT * FROM public.user_info;";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            // Process the result set
            while (resultSet.next()) {
                User user = new User();
               
                user.setName(resultSet.getString("name"));
                user.setGender(resultSet.getString("gender"));
                user.setAge(resultSet.getString("age"));
                user.setEmail(resultSet.getString("email"));
                user.setPhone(resultSet.getString("phone"));
                user.setRegion(resultSet.getString("region"));
                user.setComments(resultSet.getString("comments"));
                // Add the user to the list
                userList.add(user);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Closing the connection, statement, and result set
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
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

        // Forward the user list to viewUsers.jsp
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("viewUsers.jsp").forward(request, response);
        
    }
    
}
