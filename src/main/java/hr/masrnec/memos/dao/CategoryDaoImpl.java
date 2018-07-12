package hr.masrnec.memos.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hr.masrnec.memos.entity.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Category> getAllCategories() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Category> query = currentSession.createQuery("from Category order by name asc", Category.class);
		
		// execute the query
		List<Category> listCategory = query.getResultList();
		
		return listCategory;
	}
	
	@Override
	public Category getCategoryById(int id) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Category> query = currentSession.createQuery("from Category "
				+ "where id=:categoryId", Category.class);
		query.setParameter("categoryId", id);
		
		// execute the query
		Category category = query.getSingleResult();
		
		return category;
	}

}
