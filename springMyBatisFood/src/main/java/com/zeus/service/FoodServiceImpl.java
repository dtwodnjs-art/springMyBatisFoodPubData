package com.zeus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeus.domain.Food;
import com.zeus.mapper.FoodMapper;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	private FoodMapper foodmapper;

	@Override
	public void register(Food food) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Food> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Food read(int fno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(Food food) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int fno) throws Exception {
		// TODO Auto-generated method stub

	}

}
