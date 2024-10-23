package com.astranatko.thefirst.repository;

import com.astranatko.thefirst.entities.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryRepository extends JpaRepository<Country, Integer> {
}
