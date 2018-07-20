package hr.masrnec.memos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import hr.masrnec.memos.entity.Category;
import hr.masrnec.memos.entity.Memo;
import hr.masrnec.memos.entity.User;
import hr.masrnec.memos.service.CategoryService;
import hr.masrnec.memos.service.MemoService;

@Controller
public class AppController {
	
	@Autowired
	private MemoService memoService;
	
	@Autowired
	private CategoryService categoryService;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
		//dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@GetMapping("/")
	public String showMemosList(@SessionAttribute("user") User user, Model model) {
		
		// get all memos from service
		List<Memo> memoList = memoService.getAllMemosForUser(user);
		
		// get all favorite memos from service
		List<Memo> memoFavoriteList = memoService.getAllFavoriteMemosForUser(user);
		
		// add memos to model
		model.addAttribute("memoList", memoList);
		model.addAttribute("memoFavoriteList", memoFavoriteList);
		
		return "list";
	}
	
	@GetMapping("/about")
	public String showAbout() {
		
		return "about";
	}
	
	@GetMapping("/add")
	public String showFormForAdd(Model model) {
		
		// create new memo object
		Memo memo = new Memo();
		
		// load categories for select options
		Map<String, String> mapCategories = generateMapCategories();
		
		// add to the model
		model.addAttribute("memo", memo);
		model.addAttribute("categories", mapCategories);
		
		return "add";
	}
	
	@GetMapping("/update")
	public String showFormForUpdate(@RequestParam("memoId") int memoId, Model model) {
		
		// get memo from service
		Memo memo = memoService.getMemoById(memoId);
		
		// load categories for select options
		Map<String, String> mapCategories = generateMapCategories();
		
		// add to the model
		model.addAttribute("memo", memo);
		model.addAttribute("categories", mapCategories);
		
		return "add";
	}
	
	@GetMapping("/delete")
	public String deleteMemo(@RequestParam("memoId") int id) {
		
		// delete memo
		memoService.deleteMemoById(id);
		
		return "redirect:/";
	}
	
	@PostMapping("/saveMemo")
	public String saveMemo(
			@SessionAttribute("user") User user, 
			//@RequestParam("category_id") int categoryId,
			Model model,
			@Valid @ModelAttribute("memo") Memo memo,
			BindingResult bindingResult) {
		
		// todo: datetime format
		
		if (bindingResult.hasErrors()) {
			
			System.out.println("Error:" + bindingResult.toString());
			
			// load categories for select options
			Map<String, String> mapCategories = generateMapCategories();
			
			model.addAttribute("categories", mapCategories);
			model.addAttribute("addError", "Error. Something went wrong");
			
			return "add";
		}
		else {
			
			// set user
			memo.setUser(user);
			
			System.out.println("Adding Memo: " + memo);
			
			// save memo
			memoService.saveMemo(memo);
			
			return "redirect:/";
		}

	}
	
	@PostMapping("/search")
	public String searchMemos(
			@SessionAttribute("user") User user, 
			@RequestParam("titleSearch") String titleSearch,
			Model model) {
		
		// search memos from service
		List<Memo> memoList = memoService.getMemosByTitleSearch(user, titleSearch);
		
		// add memos to model
		model.addAttribute("memoList", memoList);
		
		return "list";
	}
	
	private Map<String, String> generateMapCategories() {
		
		// get all categories
		List<Category> listCategories = categoryService.getAllCategories();
		
		Map<String, String> map = new HashMap<String, String>();
		
		// convert to map
		for (Category item : listCategories) {
			map.put(Integer.toString(item.getId()), item.getName());
		}
		
		return map;
	}
	
}