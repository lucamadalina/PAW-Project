package com.paw.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tip_user")
public class UserType {

	@Id
	int id;
	String type;
	
	public UserType(int id, String tip) {
		super();
		this.id = id;
		this.type = tip;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTip() {
		return type;
	}
	public void setTip(String tip) {
		this.type = tip;
	}
	
	
}
