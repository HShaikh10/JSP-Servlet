package com.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.bean.Employee;
/**
 * @author Hasnain
 */
public class EmployeeDao {

	// Method for Employee Registration
	public int registerEmployee(Employee employee) throws ClassNotFoundException {String INSERT_USERS_SQL = "INSERT INTO employee"+ "(first_name, last_name, username, password, address, contact) VALUES"+ " (?, ?, ?, ?, ?, ?);";
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_db", "root", "");
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
				preparedStatement.setString(1, employee.getFirstName());
				preparedStatement.setString(2, employee.getLastName());
				preparedStatement.setString(3, employee.getUsername());
				preparedStatement.setString(4, employee.getPassword());
				preparedStatement.setString(5, employee.getAddress());
				preparedStatement.setString(6, employee.getContact());
				System.out.println(preparedStatement);
				result = preparedStatement.executeUpdate();
			}
		}	catch (SQLException sqlException) { 
				printSQLException(sqlException);
			}	return result;
	}

	// Method for Sql Exception and error code message
	private void printSQLException(SQLException exception) {
		for (Throwable throwable : exception) {
			if (throwable instanceof SQLException) {
				throwable.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) throwable).getSQLState());
				System.err.println("Error Code: " + ((SQLException) throwable).getErrorCode());
				System.err.println("Message: " + throwable.getMessage());
				Throwable throwable2 = exception.getCause();
			while (throwable2 != null) {
				System.out.println("Cause: " + throwable2);
				throwable2 = throwable2.getCause();
			}
			}
		}
	}

}