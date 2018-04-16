package com.paw.services;

import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.paw.model.Category;
import com.paw.repository.CategoryRepository;



@Service
@Transactional
public class CategoryService  {
	
	private final CategoryRepository categoryRepository;
	
	public CategoryService(CategoryRepository categoryRepository ) {
		this.categoryRepository = categoryRepository;
	}
	
	public void saveCategory(Category category ) {
		categoryRepository.save(category);
	}
	
	public List<Category> showAll(){
		List<Category> list = new ArrayList<Category>();
		for(Category category : categoryRepository.findAll()) {
			list.add(category);
		}
		
		return list;
	}
	
	public void deleteCategory(int id) {
		categoryRepository.delete(id);
	}
	
	public Category findByType(String type) {
		return categoryRepository.findByType(type);
	}
	

}