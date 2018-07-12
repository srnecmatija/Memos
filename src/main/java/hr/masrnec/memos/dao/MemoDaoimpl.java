package hr.masrnec.memos.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hr.masrnec.memos.entity.Memo;
import hr.masrnec.memos.entity.User;

@Repository
public class MemoDaoimpl implements MemoDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Memo> getAllMemos() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Memo> query = currentSession.createQuery("from Memo "
				+ "order by datetime desc", Memo.class);
		
		// execute a query
		List<Memo> listMemo = query.getResultList();
		
		return listMemo;
	}
	
	@Override
	public List<Memo> getAllFavoriteMemos() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Memo> query = currentSession.createQuery("from Memo "
				+ "where favorite = 1 "
				+ "order by datetime desc", Memo.class);
		
		// execute a query
		List<Memo> listMemo = query.getResultList();
		
		return listMemo;
	}

	@Override
	public List<Memo> getAllMemosForUser(User user) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Memo> query = currentSession.createQuery("from Memo "
				+ "where user_id=:user "
				+ "order by datetime desc", Memo.class);
		query.setParameter("user", user);
		
		// execute a query
		List<Memo> listMemo = query.getResultList();
				
		return listMemo;
	}
	
	@Override
	public List<Memo> getAllFavoriteMemosForUser(User user) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Memo> query = currentSession.createQuery("from Memo "
				+ "where user_id=:user and favorite = 1 "
				+ "order by datetime desc", Memo.class);
		query.setParameter("user", user);
		
		// execute a query
		List<Memo> listMemo = query.getResultList();
		
		return listMemo;
	}
	
	@Override
	public List<Memo> getMemosByTitleSearch(String searchTitle) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Memo> query = null;
		
		// create a query
		if (searchTitle != null && searchTitle.trim().length() > 0) {
			
			// search for title or description ... case insensitive
			query = currentSession.createQuery("from Memo where "
					+ "lower(title) like :theSearchTitle or lower(description) like :theSearchTitle "
					+ "order by datetime desc", Memo.class);
			query.setParameter("theSearchTitle", "%" + searchTitle.toLowerCase() + "%");
		}
		else {
			query = currentSession.createQuery("from Memo order by datetime desc", Memo.class);
		}
		
		// execute a query
		List<Memo> listMemo = query.getResultList();
		
		return listMemo;
	}

	@Override
	public void saveMemo(Memo memo) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/update the memo
		currentSession.saveOrUpdate(memo);
	}

	@Override
	public Memo getMemoById(int id) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Memo> query = currentSession.createQuery("from Memo "
				+ "where id=:memoId", Memo.class);
		query.setParameter("memoId", id);
		
		// execute the query
		Memo memo = query.getSingleResult();
				
		return memo;
	}

	@Override
	public void deleteMemoById(int id) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query<?> query = 
				currentSession.createQuery("delete from Memo where id=:memoId");
		query.setParameter("memoId", id);
		
		// execute the query
		query.executeUpdate();		
	}

}
