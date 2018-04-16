package com.paw.repository;

import org.springframework.data.repository.CrudRepository;
import com.paw.model.Category;
import com.paw.model.Product;


public interface ProductRepository extends CrudRepository<Product, String> {	
	
	public Product findByCategory(Category c);

	public Product findById(String id);

//@Modifying
//	@Query("Update Product p SET p.status=1 WHERE d.id=:id")
//	public Integer  update(@Param("id") String id);
}

