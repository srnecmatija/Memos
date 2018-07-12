package hr.masrnec.memos.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import hr.masrnec.memos.entity.User;

public interface UserService extends UserDetailsService {

    public User findByUserName(String userName);
    
    public User findById(int userId);
    
}