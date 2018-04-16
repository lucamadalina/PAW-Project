package com.paw.repository;

import org.springframework.data.repository.CrudRepository;

import com.paw.model.UserType;

public interface UserTypeRepository extends CrudRepository<UserType, Integer> {	
	
	public UserType findByType(String type);
}