package my.advanced.project.adw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import my.advanced.project.adw.domain.Bucket;

public interface BucketRepository extends JpaRepository<Bucket, Integer> {

}
