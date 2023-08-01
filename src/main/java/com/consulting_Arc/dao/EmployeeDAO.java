package com.consulting_Arc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import com.consulting_Arc.entity.Employee;

public class EmployeeDAO {

	private Connection conn;

	public EmployeeDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerEmployee(Employee employee) {

		boolean f = false;

		try {

			String sql = "insert into employee(fullName,dateOfBirth,qualification,specialist,email,phone,password) values(?,?,?,?,?,?,?)";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, employee.getFullName());
			pstmt.setString(2, employee.getDateOfBirth());
			pstmt.setString(3, employee.getQualification());
			pstmt.setString(4, employee.getSpecialist());
			pstmt.setString(5, employee.getEmail());
			pstmt.setString(6, employee.getPhone());
			pstmt.setString(7, employee.getPassword());

			pstmt.executeUpdate();
			// if query inserted or all ok than
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// getAllemployees list
	public List<Employee> getAllEmployee() {

		Employee employee = null;
		List<Employee> empList = new ArrayList<Employee>();

		try {

			String sql = "select * from employee order by id desc";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				employee = new Employee();

				employee.setId(resultSet.getInt("id"));
				employee.setFullName(resultSet.getString("fullName"));
				employee.setDateOfBirth(resultSet.getString("dateOfBirth"));
				employee.setQualification(resultSet.getString("qualification"));
				employee.setSpecialist(resultSet.getString("specialist"));
				employee.setEmail(resultSet.getString("email"));
				employee.setPhone(resultSet.getString("phone"));
				employee.setPassword(resultSet.getString("password"));
				empList.add(employee);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return empList;
	}

	// get employee by id
	public Employee getEmployeeById(int id) {

		Employee employee = null;

		try {

			String sql = "select * from employee where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				employee = new Employee();

				employee.setId(resultSet.getInt("id"));
				employee.setFullName(resultSet.getString("fullName"));
				employee.setDateOfBirth(resultSet.getString("dateOfBirth"));
				employee.setQualification(resultSet.getString("qualification"));
				employee.setSpecialist(resultSet.getString("specialist"));
				employee.setEmail(resultSet.getString("email"));
				employee.setPhone(resultSet.getString("phone"));
				employee.setPassword(resultSet.getString("password"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return employee;
	}

	// update employees by id
	public boolean updateEmployee(Employee employee) {

		boolean f = false;

		try {

			String sql = "update employee set fullName=?,dateOfBirth=?,qualification=?,specialist=?,email=?,phone=?,password=? where id=?";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, employee.getFullName());
			pstmt.setString(2, employee.getDateOfBirth());
			pstmt.setString(3, employee.getQualification());
			pstmt.setString(4, employee.getSpecialist());
			pstmt.setString(5, employee.getEmail());
			pstmt.setString(6, employee.getPhone());
			pstmt.setString(7, employee.getPassword());
			// need to set id also for update
			pstmt.setInt(8, employee.getId());

			pstmt.executeUpdate();
			// if query updated or all ok than
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// delete employees by id
	public boolean deleteEmployeeById(int id) {

		boolean f = false;

		try {

			String sql = "delete from employee where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// employee login
	public Employee loginEmployee(String email, String password) {

		Employee employee = null;

		try {

			String sql = "select * from employee where email=? and password=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				employee = new Employee();

				/*
				 * employee.setId(resultSet.getInt("id"));
				 * employee.setFullName(resultSet.getString("fullName"));
				 * employee.setDateOfBirth(resultSet.getString("dateOfBirth"));
				 * employee.setQualification(resultSet.getString("qualification"));
				 * employee.setSpecialist(resultSet.getString("specialist"));
				 * employee.setEmail(resultSet.getString("email"));
				 * employee.setPhone(resultSet.getString("phone"));
				 * employee.setPassword(resultSet.getString("password"));
				 */
				// we can write above commented code or
				// or
				// the below way [here 1 2 3..serially are the column index number of employee
				// table]

				employee.setId(resultSet.getInt(8));
				employee.setFullName(resultSet.getString(1));
				employee.setDateOfBirth(resultSet.getString(2));
				employee.setQualification(resultSet.getString(3));
				employee.setSpecialist(resultSet.getString(4));
				employee.setEmail(resultSet.getString(5));
				employee.setPhone(resultSet.getString(6));
				employee.setPassword(resultSet.getString(7));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return employee;

	}

	// show total number of dynamic value in admin panel

	// create all count method here to reduce code line...
	// Count total employee Number
	public int countTotalEmployee() {

		int i = 0;

		try {

			String sql = "select * from employee";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total Appointment Number
	public int countTotalAppointment() {

		int i = 0;

		try {

			String sql = "select * from appointment";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total number of Appointment for a specific employee
	public int countTotalAppointmentByEmployeeId(int employeeId) {

		int i = 0;

		try {

			String sql = "select * from appointment where employeeId=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, employeeId);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total User Number
	public int countTotalUser() {

		int i = 0;

		try {

			String sql = "select * from user_details";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total Specialist Number
	public int countTotalSpecialist() {

		int i = 0;

		try {

			String sql = "select * from specialist";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// check old password
	public boolean checkOldPassword(int employeeId, String oldPassword) {

		boolean f = false;

		try {

			String sql = "select * from employee where id=? and password=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, employeeId);
			pstmt.setString(2, oldPassword);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// change password
	public boolean changePassword(int employeeId, String newPassword) {

		boolean f = false;

		try {

			String sql = "update employee set password=? where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setInt(2, employeeId);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// edit employee profile in employee panel edit profile
	public boolean editEmployeeProfile(Employee employee) {

		boolean f = false;

		try {

			// String sql = "update employee set
			// fullName=?,dateOfBirth=?,qualification=?,specialist=?,email=?,phone=?,password=?
			// where id=?";
			String sql = "update employee set fullName=?,dateOfBirth=?,qualification=?,specialist=?,email=?,phone=? where id=?";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, employee.getFullName());
			pstmt.setString(2, employee.getDateOfBirth());
			pstmt.setString(3, employee.getQualification());
			pstmt.setString(4, employee.getSpecialist());
			pstmt.setString(5, employee.getEmail());
			pstmt.setString(6, employee.getPhone());
			// pstmt.setString(7, employee.getPassword());
			// need to set id also for update
			pstmt.setInt(7, employee.getId());

			pstmt.executeUpdate();
			// if query updated or all okay than
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
