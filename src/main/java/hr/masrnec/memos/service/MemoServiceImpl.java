package hr.masrnec.memos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hr.masrnec.memos.dao.MemoDao;
import hr.masrnec.memos.entity.Memo;
import hr.masrnec.memos.entity.User;

@Service
public class MemoServiceImpl implements MemoService {

	@Autowired
	private MemoDao memoDao;
	
	@Override
	@Transactional
	public List<Memo> getAllMemos() {
		
		return memoDao.getAllMemos();
	}
	
	@Override
	@Transactional
	public List<Memo> getAllFavoriteMemos() {

		return memoDao.getAllFavoriteMemos();
	}

	@Override
	@Transactional
	public List<Memo> getAllMemosForUser(User user) {
		
		return memoDao.getAllMemosForUser(user);
	}
	
	@Override
	@Transactional
	public List<Memo> getAllFavoriteMemosForUser(User user) {

		return memoDao.getAllFavoriteMemosForUser(user);
	}
	
	@Override
	@Transactional
	public List<Memo> getMemosByTitleSearch(String searchTitle) {

		return memoDao.getMemosByTitleSearch(searchTitle);
	}
	
	@Override
	@Transactional
	public void saveMemo(Memo memo) {
		
		memoDao.saveMemo(memo);
	}

	@Override
	@Transactional
	public Memo getMemoById(int id) {
	
		return memoDao.getMemoById(id);
	}

	@Override
	@Transactional
	public void deleteMemoById(int id) {
		
		memoDao.deleteMemoById(id);
	}

}
