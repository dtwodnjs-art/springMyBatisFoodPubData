package com.zeus.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeus.domain.Food;
import com.zeus.service.FoodService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;



@Slf4j
@Controller
@MapperScan(basePackages = "com.zeus.mapper")
@RequestMapping("/food")

public class FoodController {
	@Autowired
	private FoodService foodService;
	
	//1.등록 화면
	@GetMapping("/insertForm")
	public String foodInsertForm() {
		return "food/insertForm";
	}
	
	//2.음식 등록 처리
	
	@PostMapping("/insert")
	public String foodInsert(Food food, Model model) {
		try {
			foodService.register(food);
            model.addAttribute("message", "음식 [%s] 등록 성공!".formatted(food.getFname()));
            return "food/success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", "음식 등록 실패");
		
		return "food/failed";
	}
	
	@GetMapping("/foodList")
	public String foodList(Model model) {
		try {
			List<Food> list = foodService.list();
			model.addAttribute("foodList",list); //jsp로
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "food/foodList";
				
	}
	
	@GetMapping("/detail")
	public String foodDetail(int fno,Model model) throws Exception{
	    Food food = foodService.read(fno);
		
		model.addAttribute("food",food);
		
		return "food/detail"; //detail jsp로
	}
	
	@GetMapping("/delete")
	public String foodRemove(int fno,Model model) {
		try {
			foodService.delete(fno);
			model.addAttribute("message", "음식 정보가 삭제되었습니다.");
			return "food/success";
		} catch (Exception e) {
			e.printStackTrace();
	        model.addAttribute("message", "삭제 중 오류가 발생했습니다.");
	        return "food/failed";
		}
	}
	
	@GetMapping("/modifyForm")
	public String foodModifyForm(int fno, Model model) throws Exception {
	    
	    Food food = foodService.read(fno);
	    model.addAttribute("food", food);
	    
	    return "food/modifyForm";
	}
	
	@PostMapping("/modify")
	public String foodModify(Food food, Model model) {
	    try {
	        foodService.modify(food);
	        
	        
	        model.addAttribute("message", "음식 정보가 성공적으로 수정되었습니다.");
	        return "food/success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("message", "수정 처리 중 오류가 발생했습니다.");
	        return "food/failed";
	    }
	}
	
	@GetMapping("/search")
	public String foodSearch(String searchType, String keyword, Model model) {
	    try {
	        List<Food> list = foodService.search(searchType, keyword);
	        model.addAttribute("foodList", list); // 검색 결과를 다시 리스트에 담음
	        model.addAttribute("keyword", keyword); // 검색어를 유지하고 싶을 때 사용
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "food/foodList"; 
	}
	
	
	
	

}
