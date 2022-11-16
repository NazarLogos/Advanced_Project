package my.advanced.project.adw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import my.advanced.project.adw.domain.Magazine;

public interface MagazineRepository extends JpaRepository<Magazine, Integer> {

}
