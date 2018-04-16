package com.paw.repository;
import org.springframework.data.repository.CrudRepository;
import com.paw.model.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer> {	
	
	public Category findByType(String type);
}