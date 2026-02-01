package com.zeus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zeus.domain.Food;
import com.zeus.domain.FoodAuth;
import com.zeus.mapper.FoodMapper;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	private FoodMapper mapper;

	@Transactional
	@Override
	public void register(Food food) throws Exception {
		// 1. 음식 기본 정보 등록 
        mapper.create(food);
        
        // 2. 음식 기본 권한 부여 
        FoodAuth foodAuth = new FoodAuth();
        foodAuth.setFno(food.getFno());
        foodAuth.setAuth("ROLE_FOOD_USER"); // 예시 권한명
        
        mapper.createAuth(foodAuth);

	}

	@Override
	public List<Food> list() throws Exception {
		return mapper.list();
	}

	@Override
	public Food read(int fno) throws Exception {
		return mapper.read(fno);
	}

	@Override
	public void modify(Food food) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int fno) throws Exception {
		mapper.deleteAuth(fno);
		mapper.delete(fno);

	}

}
