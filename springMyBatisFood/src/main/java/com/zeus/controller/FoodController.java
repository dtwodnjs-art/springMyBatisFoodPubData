package com.zeus.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeus.service.FoodService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MapperScan(basePackages = "com.zeus.mapper")
@RequestMapping("/food")

public class FoodController {
	@Autowired
	private FoodService foodservice;
	
	//1.등록 화면
	@GetMapping("/insertForm")
	public String foodInsertForm() {
		return "food/insertForm";
	}

}
