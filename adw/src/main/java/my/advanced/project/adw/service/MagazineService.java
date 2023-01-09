package my.advanced.project.adw.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.advanced.project.adw.dao.MagazineRepository;
import my.advanced.project.adw.domain.Magazine;
@Service
public class MagazineService {
	
	private Logger logger = LoggerFactory.getLogger(MagazineService.class);
	
	@Autowired
	private MagazineRepository magazineRepository;
	
	public Magazine save(Magazine magazine) {
		logger.info("Create magazine item {} : " + magazine);
		return magazineRepository.save(magazine);
	}
	
	public List<Magazine> getAllMagazines(){
		logger.info("Get all magazines items");
		return magazineRepository.findAll();
	}
	
	public Magazine findById(Integer id) {
		logger.info("Get magazine item by id: " + id);
		return magazineRepository.findById(id).get();
	}
}
