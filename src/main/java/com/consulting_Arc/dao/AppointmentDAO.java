package com.consulting_Arc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.consulting_Arc.entity.Appointment;

public class AppointmentDAO {

	private Connection conn;

	public AppointmentDAO(Connection conn) {
		super(); 				
		this.conn = conn;
	}

	// for create appointment
	public boolean addAppointment(Appointment appointment) {

		boolean f = false;

		try {

			String sql = "insert into appointment(userId, fullName, gender, age, appointmentDate, email, phone, needToConsult, employeeId, address, status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			pstmt.setInt(1, appointment.getUserId());
			pstmt.setString(2, appointment.getFullName());
			pstmt.setString(3, appointment.getGender());
			pstmt.setString(4, appointment.getAge());
			pstmt.setString(5, appointment.getAppointmentDate());
			pstmt.setString(6, appointment.getEmail());
			pstmt.setString(7, appointment.getPhone());
			pstmt.setString(8, appointment.getNeedToConsult());
			pstmt.setInt(9, appointment.getEmployeeId());
			pstmt.setString(10, appointment.getAddress());
			pstmt.setString(11, appointment.getStatus());

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// get list of appointment for logged in specific user
	// show appointment list for specific user panel
	public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		List<Appointment> appList = new ArrayList<Appointment>();

		Appointment appointment = null;

		try {

			String sql = "select * from appointment where userId=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			pstmt.setInt(1, userId);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {

				appointment = new Appointment();

				appointment.setId(resultSet.getInt(1));// appoint id
				appointment.setUserId(resultSet.getInt(2));// userId
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				appointment.setNeedToConsult(resultSet.getString(9));
				appointment.setEmployeeId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));
				appList.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appList;

	}

	// get appointment list of Client for specific Consultant
	// show list of appointment in specific Consultant panel
	public List<Appointment> getAllAppointmentByLoginEmployee(int employeeId) {
		List<Appointment> appList = new ArrayList<Appointment>();

		Appointment appointment = null;

		try {

			String sql = "select * from appointment where employeeId=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			pstmt.setInt(1, employeeId);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {

				appointment = new Appointment();

				appointment.setId(resultSet.getInt(1));// appoint id
				appointment.setUserId(resultSet.getInt(2));// userId
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				// appointment.setDiseases(resultSet.getString(9));
				appointment.setNeedToConsult(resultSet.getString(9));

				// appointment.setDoctorId(resultSet.getInt(10));
				appointment.setEmployeeId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));
				appList.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appList;

	}

	// for doctor comment need specific appointment id
	public Appointment getAppointmentById(int id) {

		Appointment appointment = null;

		try {

			String sql = "select * from appointment where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			pstmt.setInt(1, id);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {

				appointment = new Appointment();

				appointment.setId(resultSet.getInt(1));// appoint id
				appointment.setUserId(resultSet.getInt(2));// userId
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				appointment.setNeedToConsult(resultSet.getString(9));
				// appointment.setDoctorId(resultSet.getInt(10));

				appointment.setEmployeeId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appointment;

	}

	// for update comment status
	public boolean updateEmpAppointmentCommentStatus(int apptId, int empId, String comment) {

		boolean f = false;

		try {

			String sql = "update appointment set status=? where id=? and employeeId=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, comment);
			pstmt.setInt(2, apptId);
			pstmt.setInt(3, empId);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// get all appointment in admin panel
	public List<Appointment> getAllAppointment() {
		List<Appointment> appList = new ArrayList<Appointment>();
		Appointment appointment = null;

		try {

			String sql = "select * from appointment order by id desc";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {

				appointment = new Appointment();

				appointment.setId(resultSet.getInt(1));// appoint id
				appointment.setUserId(resultSet.getInt(2));// userId
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				appointment.setNeedToConsult(resultSet.getString(9));

				appointment.setEmployeeId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));
				appList.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appList;
	}

}
