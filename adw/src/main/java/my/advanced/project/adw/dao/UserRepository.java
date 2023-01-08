package my.advanced.project.adw.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import my.advanced.project.adw.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	List<User> findByEmail(String email);
}
