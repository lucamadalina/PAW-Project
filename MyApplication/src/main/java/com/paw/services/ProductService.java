package com.paw.services;

import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.paw.model.Category;
import com.paw.model.Product;
import com.paw.repository.ProductRepository;

@Service
@Transactional
public class ProductService {

private final ProductRepository documentRepository;
	
	public ProductService(ProductRepository documentRepository) {
		this.documentRepository = documentRepository;
	}
	
	public void saveProduct(Product product) {
		documentRepository.save(product);
	}
	
	public List<Product> showAllProducts() {
		List<Product> documents = new ArrayList<Product>();
		for(Product document : documentRepository.findAll()) {
			documents.add(document);
		}
		return documents;
	}
	
	public void deleteProducts(String id) {
		documentRepository.delete(id);
	}
	
	public Product findByCategory(Category category) {
		return documentRepository.findByCategory(category);
	}

	public Product findById(String id) {
		return documentRepository.findById(id);
	}
	

}
