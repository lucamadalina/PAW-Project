package com.paw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import com.paw.services.ProductService;
import com.paw.model.Category;
import com.paw.model.Product;
import com.paw.services.CategoryService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	
	DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    String imageStr = null;
    String path=null;
	
	@GetMapping("/show-products")
	public ModelAndView showAllDocuments(HttpServletRequest request) {
		request.setAttribute("products", productService.showAllProducts());
		return new ModelAndView("products");
	}

	
	@GetMapping("/addProduct")
	public ModelAndView addProduct(HttpServletRequest request) {
		request.setAttribute("listc", categoryService.showAll());
		return new ModelAndView("addProduct");
	}
	
	@PostMapping("/save-product")
	public String saveDocument(@ModelAttribute Product product, @RequestParam("file") MultipartFile fi, 
			BindingResult bindingResult,@RequestParam("type")String type, HttpServletRequest request) {
		if (!fi.isEmpty()) {
            try {
                String fileName = fi.getName();
                System.out.println(fileName);
                String contentType = fi.getContentType();
                System.out.println(contentType);
                long sizeInBytes = fi.getSize();
                System.out.println(sizeInBytes);
                product.setImage(fi.getBytes());
                File temp = File.createTempFile("image", ".png");
                path = temp.getAbsolutePath();
                File myFile = new File("C:\\Users\\madal\\Pictures\\images\\" + product.getName() + ".jpg");
                fi.transferTo(myFile);
                
                //((FileItem) fi).write(temp);
                System.out.println("imageStr: " + path);
            } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
            finally {
            	product.setImage(path.getBytes());
            }
        } 
		Category category= categoryService.findByType(type);
		 System.out.println("category: "+category.getId()+category.getType());
		product.setCategory(category);
		int n = new Random().nextInt() & Integer.MAX_VALUE;;
		product.setId("" + n);
		System.out.println("PRODUCT: "+product.getId());
		productService.saveProduct(product);
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/add")
	public ModelAndView add(HttpSession session, @RequestParam String id) {
		HashMap<Product, String> products = (HashMap<Product, String>) session.getAttribute("cart");
		Product product = productService.findById(id);
		float total;
		if(products == null) {
			System.out.println("da");
			products = new HashMap<Product, String>();
			total = 0;
		} else {
			total = (float) session.getAttribute("total");
		}
		products.put(product, "1");
		session.setAttribute("cart", products);
		total += product.getPrice();
		System.out.println(total);
		session.setAttribute("total", total);
		return new ModelAndView("cart");
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(HttpSession session, @RequestParam String id) {
		@SuppressWarnings("unchecked")
		HashMap<Product, String> products = (HashMap<Product, String>) session.getAttribute("cart");
		Product product = productService.findById(id);
		float total = (float) session.getAttribute("total");
		int qant = 0;
		for(Map.Entry m: products.entrySet()){  
			   System.out.println(m.getKey()+" "+m.getValue());
			   Product ps = (Product) m.getKey();
			   if( ps.equals(product)) {
				   System.out.println("daaaa");
				   qant = Integer.parseInt((String) m.getValue());
				   System.out.println(qant);
				   products.remove(m.getKey());
				   total -= qant * product.getPrice();
			   } else {
				   System.out.println("nuuuu");
			   }
		}
		session.setAttribute("total", total);
		session.setAttribute("cart", products);
		return new ModelAndView("cart");
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/edit")
	public ModelAndView edit(HttpSession session, @RequestParam String id) {
		HashMap<Product, String> products = (HashMap<Product, String>) session.getAttribute("cart");
		Product product = productService.findById(id);
		System.out.println("id:" + id + product.getId() + product.getName());
		if(products == null) {
			System.out.println("da");
			products = new HashMap<Product, String>();
		}
		System.out.println(products.size());
		int qant = 1;
		float total = 0;
		for(Map.Entry m: products.entrySet()){  
			   System.out.println(m.getKey()+" "+m.getValue());
			   Product ps = (Product) m.getKey();
			   if( ps.equals(product)) {
				   System.out.println("daaaa");
				   qant = Integer.parseInt((String) m.getValue());
				   System.out.println(qant);
				   products.remove(m.getKey());
				   total += (qant+1) * product.getPrice();
			   } else {
				   System.out.println("nuuuu");
			   }
		} 
		products.put(product, ""+(qant+1));
		session.setAttribute("cart", products);
		session.setAttribute("total", total);
		return new ModelAndView("cart");
	}
}
