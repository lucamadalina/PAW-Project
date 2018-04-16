package com.paw.controller;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paw.model.Product;


@RestController
@Controller
public class HomeController {
	

	@GetMapping("/")
	public ModelAndView hello() {
		return new ModelAndView("index");
	}
	
	@GetMapping("/welcome")
	public ModelAndView dash() {
		return new ModelAndView("welcomepage");
	}
	
	@GetMapping("/cart")
	public ModelAndView cart(HttpSession session) {
		@SuppressWarnings("unchecked")
		HashMap<Product, String> list = (HashMap<Product, String>) session.getAttribute("cart");
		session.setAttribute("cart", list);
		return new ModelAndView("cart");
	}
}
