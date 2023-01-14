package my.advanced.project.adw.service;

import java.io.IOException;
import java.util.Base64;

import org.springframework.web.multipart.MultipartFile;

import my.advanced.project.adw.domain.Magazine;

public class MagazinesDTOHelper {
	public static Magazine createEntity(MultipartFile file, String name, String description, Double price) throws IOException {
		Magazine magazine = new Magazine();
		magazine.setName(name);
		magazine.setDescription(description);
		magazine.setPrice(price);
		magazine.setEncodedImage(Base64.getEncoder().encodeToString(file.getBytes()));
		
		return magazine;
	}
}
