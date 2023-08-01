package com.consulting_Arc.entity;

public class Consultant {
	
	private int id;
	private String specialistName;
	
	public Consultant() {
		super();
		
	}

	public Consultant(int id, String specialistName) {
		super();
		this.id = id;
		this.specialistName = specialistName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}
	
	
	
	
	

}
