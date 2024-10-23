package com.astranatko.thefirst.service;

import com.astranatko.thefirst.entities.City;
import com.astranatko.thefirst.entities.Country;
import com.astranatko.thefirst.repository.CityRepository;
import com.astranatko.thefirst.repository.CountryRepository;
import com.astranatko.thefirst.rest.model.request.CityRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class WorldDataService {

    private final CityRepository cityRepository;
    private final CountryRepository countryRepository;

    public WorldDataService(CityRepository cityRepository, CountryRepository countryRepository) {
        this.cityRepository = cityRepository;
        this.countryRepository = countryRepository;
    }

    public City getCityById(Integer cityId) {
        Optional<City> city = cityRepository.findById(cityId);
        return city.orElseThrow(() -> new RuntimeException("The city " + cityId + "doesn't exist"));
    }

    public City getCityByName(String name) {
        Optional<City> city = cityRepository.findByName(name);
        return city.orElseThrow(() -> new RuntimeException("The city " + name + "doesn't exist"));
    }

    public List<City> findAllCities() {
        return cityRepository.findAll();
    }

    public void deleteCityById(Integer cityId) {
        cityRepository.deleteById(cityId);
    }

    public List<City> getAllCitiesByCountryId(Integer countryId) {
        return cityRepository.findByCountryId(countryId);
    }

    public void addCity(CityRequest cityRequest) {
        Optional<City> foundCity = cityRepository.findByIdOrName(cityRequest.getId(), cityRequest.getName());
        if (foundCity.isEmpty()) {
            Country foundCountry = countryRepository.findById(cityRequest.getCountryId())
                    .orElseThrow(() -> new RuntimeException ("The country " + cityRequest.getCountryId() + " doesn't exist"));
            City newCity = new City(cityRequest.getName(), foundCountry);
            cityRepository.save(newCity);
        } else {
            throw new RuntimeException("The city " + cityRequest.getName() + " already exists");
        }
    }

    public Country getCountryById(Integer countryId) {
        Optional<Country> country = countryRepository.findById(countryId);
        return country.orElseThrow(() -> new RuntimeException("The country " + countryId + " doesn't exist"));
    }

    public List<Country> getAllCountries() {
        return countryRepository.findAll();
    }



}