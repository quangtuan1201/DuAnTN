package com.example.demo.Rest;

import java.util.List;
import java.util.Locale.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Entity.LoaiHang;
import com.example.demo.Service.LoaiHangService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/categories")
public class LoaiHangRest {
	@Autowired
	LoaiHangService categoryService;

	@GetMapping()
	public List<LoaiHang> getAll() {
		return categoryService.findAll();
	}

} 