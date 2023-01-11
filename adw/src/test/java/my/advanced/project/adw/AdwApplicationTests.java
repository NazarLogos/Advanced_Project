package my.advanced.project.adw;

import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Date;
import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import my.advanced.project.adw.dao.BucketRepository;
import my.advanced.project.adw.dao.MagazineRepository;
import my.advanced.project.adw.dao.UserRepository;
import my.advanced.project.adw.domain.Bucket;
import my.advanced.project.adw.domain.Magazine;
import my.advanced.project.adw.domain.User;
import my.advanced.project.adw.domain.UserRole;
import my.advanced.project.adw.service.BucketService;
import my.advanced.project.adw.service.MagazineService;
import my.advanced.project.adw.service.UserService;

@RunWith(SpringRunner.class)
@DataJpaTest
class AdwApplicationTests {

	@Autowired
	private UserService userService;

	@Autowired
	private MagazineService magazinesService;

	@Autowired
	private BucketService bucketService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MagazineRepository  magazineRepository;

	@Autowired
	private BucketRepository bucketRepository;

	@Test
	public void testSaveUser() {
		List<User> users = userRepository.findAll();
		assertThat(users, hasSize(0));

		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		users = userRepository.findAll();
		assertThat(users, hasSize(1));

		User userFromDb = users.get(0);
		assertTrue(userFromDb.getEmail().equals(user.getEmail()));
		assertTrue(userFromDb.getFirstName().equals(user.getFirstName()));
		assertTrue(userFromDb.getLastName().equals(user.getLastName()));
		assertTrue(userFromDb.getRole().equals(user.getRole()));
	}

	@Test
	public void testFindByEmail() {
		List<User> users = userRepository.findAll();
		assertThat(users, hasSize(0));

		User user = new User();
		user.setEmail("myCustomEmail@gmail.com");
		user.setFirstName("2");
		user.setLastName("2");
		user.setPassword("2");
		user.setPasswordConfirm("2");
		user.setRole(UserRole.ROLE_USER);

		userRepository.save(user);

		users = userRepository.findAll();
		assertThat(users, hasSize(1));

		User findByEmail = userService.findByEmail(user.getEmail());

		assertTrue(findByEmail.getEmail().equals(user.getEmail()));
		assertTrue(findByEmail.getFirstName().equals(user.getFirstName()));
		assertTrue(findByEmail.getLastName().equals(user.getLastName()));
		assertTrue(findByEmail.getRole().equals(user.getRole()));
	}

	@Test
	public void testSavePeriodical() {
		List<Magazine> magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(0));

		Magazine magazine = new Magazine();
		magazine.setName("1");
		magazine.setDescription("1");
		magazine.setEncodedImage("1");
		magazine.setPrice(1d);

		magazinesService.save(magazine);

		magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(1));

		Magazine magazineFromDb = magazines.get(0);
		assertTrue(magazineFromDb.getName().equals(magazine.getName()));
		assertTrue(magazineFromDb.getDescription().equals(magazine.getDescription()));
		assertTrue(magazineFromDb.getEncodedImage().equals(magazine.getEncodedImage()));
		assertTrue(magazineFromDb.getPrice().equals(magazine.getPrice()));
	}

	@Test
	public void testFindById() {
		List<Magazine> magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(0));

		Magazine magazine = new Magazine();
		magazine.setName("1");
		magazine.setDescription("1");
		magazine.setEncodedImage("1");
		magazine.setPrice(1d);

		magazineRepository.save(magazine);

		magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(1));

		Magazine magazineFromDb = magazinesService.findById(magazines.get(0).getId());

		assertTrue(magazineFromDb.getName().equals(magazine.getName()));
		assertTrue(magazineFromDb.getDescription().equals(magazine.getDescription()));
		assertTrue(magazineFromDb.getEncodedImage().equals(magazine.getEncodedImage()));
		assertTrue(magazineFromDb.getPrice().equals(magazine.getPrice()));
	}

	@Test
	public void testGetAllPeriodicals() {
		List<Magazine> magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(0));

		Magazine magazine = new Magazine();
		magazine.setName("1");
		magazine.setDescription("1");
		magazine.setEncodedImage("1");
		magazine.setPrice(1d);
		
		Magazine magazine2 = new Magazine();
		magazine.setName("12");
		magazine.setDescription("12");
		magazine.setEncodedImage("12");
		magazine.setPrice(12d);
		

		magazineRepository.saveAll(Arrays.asList(magazine, magazine2));

		magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(2));

		List<Magazine> magazinesFromDb = magazinesService.getAllMagazines();

		assertTrue(magazinesFromDb.get(0).getName().equals(magazine.getName()));
		assertTrue(magazinesFromDb.get(0).getDescription().equals(magazine.getDescription()));
		assertTrue(magazinesFromDb.get(0).getEncodedImage().equals(magazine.getEncodedImage()));
		assertTrue(magazinesFromDb.get(0).getPrice().equals(magazine.getPrice()));

		assertTrue(magazinesFromDb.get(1).getName().equals(magazine2.getName()));
		assertTrue(magazinesFromDb.get(1).getDescription().equals(magazine2.getDescription()));
		assertTrue(magazinesFromDb.get(1).getEncodedImage().equals(magazine2.getEncodedImage()));
		assertTrue(magazinesFromDb.get(1).getPrice().equals(magazine2.getPrice()));
	}

	@Test
	public void testAddToBucket() {
		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		User userFromDb = userRepository.findAll().stream().findFirst().get();

		List<Magazine> magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(0));

		Magazine magazine = new Magazine();
		magazine.setName("1");
		magazine.setDescription("1");
		magazine.setEncodedImage("1");
		magazine.setPrice(1d);

		magazinesService.save(magazine);

		Magazine magazineFromDb = magazineRepository.findAll().stream().findFirst().get();

		Date now = new Date();
		Bucket bucket = new Bucket();
		bucket.setMagazine(magazineFromDb);
		bucket.setUser(userFromDb);
		bucket.setPurchaseDate(now);

		List<Bucket> buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(0));

		bucketService.add(bucket);

		buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(1));

		Bucket bucketFromDb = buckets.get(0);

		assertTrue(bucketFromDb.getMagazine().equals(magazineFromDb));
		assertTrue(bucketFromDb.getUser().equals(userFromDb));
		assertTrue(bucketFromDb.getPurchaseDate().equals(now));
	}

	@Test
	public void testDeleteFromBucket() {
		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		User userFromDb = userRepository.findAll().stream().findFirst().get();

		List<Magazine> magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(0));

		Magazine magazine = new Magazine();
		magazine.setName("1");
		magazine.setDescription("1");
		magazine.setEncodedImage("1");
		magazine.setPrice(1d);

		Magazine magazine2 = new Magazine();
		magazine2.setName("12");
		magazine2.setDescription("12");
		magazine2.setEncodedImage("12");
		magazine2.setPrice(12d);

		magazineRepository.saveAll(Arrays.asList(magazine, magazine2));

		List<Magazine> magazinesFromDb = magazineRepository.findAll();

		Date now = new Date();
		Bucket bucket = new Bucket();
		bucket.setMagazine(magazinesFromDb.get(0));
		bucket.setUser(userFromDb);
		bucket.setPurchaseDate(now);

		Bucket bucket2 = new Bucket();
		bucket2.setMagazine(magazinesFromDb.get(1));
		bucket2.setUser(userFromDb);
		bucket2.setPurchaseDate(now);

		List<Bucket> buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(0));

		bucketRepository.saveAll(Arrays.asList(bucket, bucket2));

		buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(2));

		bucketService.delete(buckets.get(0));

		buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(1));
	}

	@Test
	public void testGetAll() {
		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		User userFromDb = userRepository.findAll().stream().findFirst().get();

		List<Magazine> magazines = magazineRepository.findAll();
		assertThat(magazines, hasSize(0));

		Magazine magazine = new Magazine();
		magazine.setName("1");
		magazine.setDescription("1");
		magazine.setEncodedImage("1");
		magazine.setPrice(1d);

		Magazine magazine2 = new Magazine();
		magazine2.setName("12");
		magazine2.setDescription("12");
		magazine2.setEncodedImage("12");
		magazine2.setPrice(12d);

		magazineRepository.saveAll(Arrays.asList(magazine, magazine2));

		List<Magazine> magazinesFromDb = magazineRepository.findAll();

		Date now = new Date();
		Bucket bucket = new Bucket();
		bucket.setMagazine(magazinesFromDb.get(0));
		bucket.setUser(userFromDb);
		bucket.setPurchaseDate(now);

		Bucket bucket2 = new Bucket();
		bucket2.setMagazine(magazinesFromDb.get(1));
		bucket2.setUser(userFromDb);
		bucket2.setPurchaseDate(now);

		List<Bucket> buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(0));

		bucketRepository.saveAll(Arrays.asList(bucket, bucket2));

		List<Bucket> bucketsFromDb = bucketService.getAll();
		assertThat(bucketsFromDb, hasSize(2));
	}

}
