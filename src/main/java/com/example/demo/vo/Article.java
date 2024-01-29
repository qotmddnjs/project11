package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {
	public Article(int i, String string, String string2, int j) {
		
	}
	int id;
	String title;
	String body;

}