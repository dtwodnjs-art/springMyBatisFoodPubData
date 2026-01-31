package com.zeus.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Food {
	private int fno;
	private String fname;
	private int kcal;
	private String category;
	private Date regDate;
	private Date modDate;
	
	private String searchType;
	private String keyword;
	
	private List<FoodAuth> authList;
	

}
