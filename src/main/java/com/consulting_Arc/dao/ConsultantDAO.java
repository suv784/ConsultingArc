package com.consulting_Arc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.consulting_Arc.entity.Consultant;

public class ConsultantDAO {
	
	private Connection conn;

	public ConsultantDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(String sp) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into specialist (specialist_name) values(?)";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			
			pstmt.setString(1, sp);
			
			pstmt.executeUpdate();
			
			f = true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}
	
	public List<Consultant> getAllSpecialist(){
		
		List<Consultant> spList = new ArrayList<Consultant>();
		
		Consultant specialistObj = null;
		
		try {
			
			String sql = "select * from specialist";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			ResultSet resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				
				//create object
				specialistObj = new Consultant();
				//specialistObj.setId(resultSet.getInt("id"));
				//specialistObj.setSpecialistName(resultSet.getString("specialist_name"));
				//above two line same as below line
				//specialistObj.setId(resultSet.getInt(1));//column index number 1 -(id)
				specialistObj.setSpecialistName(resultSet.getString(1));//column index number 2 -(specialist_name)
				
				//now add specialist object into List 
				spList.add(specialistObj);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return spList;
	}

}
