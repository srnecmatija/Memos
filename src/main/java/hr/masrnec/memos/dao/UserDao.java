package hr.masrnec.memos.dao;

import hr.masrnec.memos.entity.User;

public interface UserDao {

    public User findByUserName(String userName);

    public User findById(int userId);
    
}