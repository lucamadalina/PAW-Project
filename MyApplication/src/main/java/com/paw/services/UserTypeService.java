package com.paw.services;

import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

import com.paw.model.UserType;
import com.paw.repository.UserTypeRepository;

@Service
@Transactional
public class UserTypeService {
	
private final UserTypeRepository userTypeRepository;
	
	public UserTypeService(UserTypeRepository userTypeRepository) {
		this.userTypeRepository =userTypeRepository;
	}
	public UserType findByType(String type) {
		return userTypeRepository.findByType(type);
	}
}
