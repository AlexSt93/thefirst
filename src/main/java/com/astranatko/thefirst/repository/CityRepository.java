package com.astranatko.thefirst.repository;

import com.astranatko.thefirst.entities.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CityRepository extends JpaRepository<City, Integer> {

    Optional<City> findByName(String name);

    Optional<City> findByIdOrName(Integer id, String name);

    List<City> findByCountryId(Integer countryId);
}
