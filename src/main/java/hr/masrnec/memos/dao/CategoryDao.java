package hr.masrnec.memos.dao;

import java.util.List;

import hr.masrnec.memos.entity.Category;

public interface CategoryDao {
	
	public List<Category> getAllCategories();
	
	public Category getCategoryById(int id);

}
