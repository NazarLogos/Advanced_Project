package my.advanced.project.adw.service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import my.advanced.project.adw.dao.UserRepository;
import my.advanced.project.adw.domain.User;
import my.advanced.project.adw.domain.UserRole;

@Service
public class UserService {

	private Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;


    public void save(User user) {
    	
		logger.info("Register new user {} : " + user);

        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setPasswordConfirm(bCryptPasswordEncoder.encode(user.getPasswordConfirm()));
        user.setRole(UserRole.ROLE_USER);
        userRepository.save(user);
    }
    public User findByEmail(String email) {
    	logger.info("Get user {} by email: " + email);

    	return userRepository.findByEmail(email).get();
    }
}
