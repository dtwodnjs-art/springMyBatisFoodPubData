package com.zeus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zeus.domain.Food;
import com.zeus.domain.FoodAuth;

@Mapper
public interface FoodMapper {
	
	// 1.음식 정보 
	public void create(Food food) throws Exception;
	
	// 2.음식 권한
	public void createAuth(FoodAuth foodAuth) throws Exception;
	
	// 3. 음식 목록 조회
    public List<Food> list() throws Exception;
    
    // 4. 특정 음식 상세 조회
    public Food read(int fno) throws Exception;
    
    // 5. 음식 정보 수정
    public void update(Food food) throws Exception;
    
    // 6. 음식 정보 삭제
    public void delete(int fno) throws Exception;
    
    
    // 7. 특정 음식의 기존 권한 삭제 (수정 시 필요)
    public void deleteAuth(int fno) throws Exception;

}
