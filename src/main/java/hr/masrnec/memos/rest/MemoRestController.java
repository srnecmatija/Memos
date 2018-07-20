package hr.masrnec.memos.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hr.masrnec.memos.entity.Category;
import hr.masrnec.memos.entity.Memo;
import hr.masrnec.memos.entity.User;
import hr.masrnec.memos.service.CategoryService;
import hr.masrnec.memos.service.MemoService;
import hr.masrnec.memos.service.UserService;

@RestController
@RequestMapping("/api")
public class MemoRestController {

	@Autowired
	private MemoService memoService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	// get all memos for user id
	@GetMapping("/memos/{userId}/all")
	public List<?> getAllMemosForUser(@PathVariable int userId) {
		
		// get user by id
		User user = userService.findById(userId);
		
		// check if exists
		if (user == null) {
			throw new NotFoundException("User not found id: " + userId);
		}
		
		return memoService.getAllMemosForUser(user);
	}
	
	// get all favorite memos for user id
	@GetMapping("/memos/{userId}/favorite")
	public List<?> getAllFavoriteMemosForUser(@PathVariable int userId) {
		
		// get user by id
		User user = userService.findById(userId);
		
		// check if exists
		if (user == null) {
			throw new NotFoundException("User not found id: " + userId);
		}
		
		return memoService.getAllFavoriteMemosForUser(user);
	}
	
	// get memo by id
	@GetMapping("/memos/{memoId}")
	public Memo getMemoById(@PathVariable int memoId) {
		
		// get memo by id
		Memo memo = memoService.getMemoById(memoId);
		
		// check if exists
		if (memo == null) {
			throw new NotFoundException("Memo not found id: " + memoId);
		}
		
		return memo;
	}
	
	// add new memo
	@PostMapping("/memos/{userId}/{categoryId}")
	public Memo addMemo(@PathVariable int userId, 
			@PathVariable int categoryId,
			@RequestBody Memo memo) {
		
		// get user by id
		User user = userService.findById(userId);
		
		// check if exists
		if (user == null) {
			throw new NotFoundException("User not found id: " + userId);
		}
		
		// get category by id
		Category category = categoryService.getCategoryById(categoryId);
		
		// check if exists
		if (category == null) {
			throw new NotFoundException("Category not found id: " + categoryId);
		}
		
		// add new memo
		memo.setId(0);
		
		// set user and category
		memo.setUser(user);
		memo.setCategory(category);
		
		// add memo
		memoService.saveMemo(memo);
		
		return memo;
	}
	
	// update a memo
	@PutMapping("/memo/{memoId}")
	public Memo updateMemo(@PathVariable int memoId, @RequestBody Memo memo) {
		
		return null;
	}
	
	// delete a memo
	@DeleteMapping("/memo/{memoId}")
	public RestResponseMessage deleteMemo(@PathVariable int memoId) {
		
		// get memo by id
		Memo memo = memoService.getMemoById(memoId);
		
		// check if exists
		if (memo == null) {
			throw new NotFoundException("Memo not found id: " + memoId);
		}
		
		// delete memo
		memoService.deleteMemoById(memoId);
		
		// response message
		RestResponseMessage message = new RestResponseMessage();
		message.setStatus(HttpStatus.OK.value());
		message.setMessage("Deleted Memo id: " + memoId);
		message.setTimestamp(System.currentTimeMillis());
		
		return message;
	}
}
