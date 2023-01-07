package my.advanced.project.adw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.advanced.project.adw.dao.MagazineRepository;
import my.advanced.project.adw.domain.Magazine;
@Service
public class MagazineService {
	@Autowired
	private MagazineRepository magazineRepository;
	
	public Magazine save(Magazine magazine) {
		return magazineRepository.save(magazine);
	}
	
	public List<Magazine> getAllMagazines(){
		return magazineRepository.findAll();
	}
	
	public Magazine findById(Integer id) {
		return magazineRepository.findById(id).get();
	}
}
