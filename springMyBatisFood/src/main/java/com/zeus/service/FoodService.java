package com.zeus.service;

import java.util.List;

import com.zeus.domain.Food;

public interface FoodService {
	
	// 음식 등록
    public void register(Food food) throws Exception;
    
    // 음식 목록 조회
    public List<Food> list() throws Exception;
    
    //음식 상세 조회
    public Food read(int fno) throws Exception;
    
    //음식 수정
    public void modify(Food food) throws Exception;
    
    //음식 삭제
    public void remove(int fno) throws Exception;

}
