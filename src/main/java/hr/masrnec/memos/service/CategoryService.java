package hr.masrnec.memos.service;

import java.util.List;

import hr.masrnec.memos.entity.Category;

public interface CategoryService {
	
	public List<Category> getAllCategories();
	
	public Category getCategoryById(int id);
	
}
