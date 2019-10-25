package com.alexandre.papelaria.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alexandre.papelaria.services.CategoriaService;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	CategoriaService catService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getIndexPage() {
		
		catService.carregarCategoria();
		return "index";
	}
}
