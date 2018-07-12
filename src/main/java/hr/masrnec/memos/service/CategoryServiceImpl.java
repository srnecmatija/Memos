package hr.masrnec.memos.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.masrnec.memos.dao.CategoryDao;
import hr.masrnec.memos.entity.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	@Transactional
	public List<Category> getAllCategories() {

		return categoryDao.getAllCategories();
	}

	@Override
	@Transactional
	public Category getCategoryById(int id) {

		return categoryDao.getCategoryById(id);
	}

}
