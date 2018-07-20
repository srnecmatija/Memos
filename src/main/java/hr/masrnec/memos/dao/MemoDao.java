package hr.masrnec.memos.dao;

import java.util.List;

import hr.masrnec.memos.entity.Memo;
import hr.masrnec.memos.entity.User;

public interface MemoDao {
	
	public List<Memo> getAllMemos();

	public List<Memo> getAllFavoriteMemos();
	
	public List<Memo> getAllMemosForUser(User user);
	
	public List<Memo> getAllFavoriteMemosForUser(User user);
	
	public List<Memo> getMemosByTitleSearch(User user, String searchTitle);
	
	public void saveMemo(Memo memo);
	
	public Memo getMemoById(int id);
	
	public void deleteMemoById(int id);
	
}