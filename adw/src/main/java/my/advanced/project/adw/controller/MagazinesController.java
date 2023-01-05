package my.advanced.project.adw.controller;



import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import my.advanced.project.adw.domain.Magazine;
import my.advanced.project.adw.service.MagazineService;
import my.advanced.project.adw.service.MagazinesDTOHelper;

@Controller
public class MagazinesController {
	@Autowired
	MagazineService magazineService;

	@RequestMapping(value = "/addMagazine", method = RequestMethod.POST)
	public ModelAndView createMagazine(
			@RequestParam MultipartFile image, 
			@RequestParam String name, 
			@RequestParam String description, 
			@RequestParam Double price) throws IOException {		
		
		magazineService.save(MagazinesDTOHelper.createEntity(image, name, description, price));
		return new ModelAndView("redirect:/home");
	}
	}
