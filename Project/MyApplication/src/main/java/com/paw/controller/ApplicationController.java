package com.paw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApplicationController {

	@GetMapping("/")
	public ModelAndView hello() {
		return new ModelAndView("homepage");
	}
	
	@GetMapping("/register")
	public ModelAndView register() {
		return new ModelAndView("register");
	}
	
	@GetMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	@GetMapping("/userpage")
	public ModelAndView user() {
		return new ModelAndView("userpage");
	}
	
	@GetMapping("/adminpage")
	public ModelAndView admin() {
		return new ModelAndView("adminpage");
	}
	
	

}
