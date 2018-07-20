package hr.masrnec.memos.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "memo")
public class Memo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@NotNull(message = "is required")
	@Size(min=1, message = "is required")
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@NotNull(message = "is required")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "datetime")
	private Date datetime;
	
	@Column(name = "favorite")
	private int favorite;
	
	@ManyToOne(
			cascade= { CascadeType.DETACH, CascadeType.MERGE, 
			 		   CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "category_id")
	private Category category;
	
	@ManyToOne(
			cascade= { CascadeType.DETACH, CascadeType.MERGE, 
			 		   CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "user_id")
	private User user;
	
	public Memo() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@JsonIgnore
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Memo [id=" + id + ", title=" + title + ", description=" + description + ", datetime=" + datetime
				+ ", favorite=" + favorite + ", category=" + category + ", user=" + user + "]";
	}

}
