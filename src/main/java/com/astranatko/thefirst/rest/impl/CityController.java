package com.astranatko.thefirst.rest.impl;


import com.astranatko.thefirst.entities.City;
import com.astranatko.thefirst.rest.api.CityControllerApi;
import com.astranatko.thefirst.rest.model.request.CityRequest;
import com.astranatko.thefirst.rest.model.response.CityResponse;
import com.astranatko.thefirst.rest.model.response.CityListResponse;
import com.astranatko.thefirst.service.WorldDataService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("cities/")
public class CityController implements CityControllerApi {

    private final WorldDataService worldDataService;

    public CityController(WorldDataService worldDataService) {
       this.worldDataService = worldDataService;
    }

    @Override
    public ResponseEntity<CityListResponse> getCitiesInCountry(Integer countryId) {
        try {
            List<City> cityList = worldDataService.getAllCitiesByCountryId(countryId);
            List<CityResponse> cityResponseList = cityList.stream().map(CityResponse::new).toList();
            return ResponseEntity.ok(new CityListResponse(cityResponseList));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @Override
    public ResponseEntity<CityListResponse> getAllCities() {
        try {
            List<City> cityList = worldDataService.findAllCities();
            List<CityResponse> cityResponseList = cityList.stream().map(CityResponse::new).toList();
            return ResponseEntity.ok(new CityListResponse(cityResponseList));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @Override
    public ResponseEntity<CityResponse> addCity(CityRequest cityRequest) {
        try {
            City city = worldDataService.addCity(cityRequest);
            return ResponseEntity.ok(new CityResponse(city));
        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().build();
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @Override
    public ResponseEntity<Void> deleteCity(Integer cityId) {
        try {
            worldDataService.deleteCityById(cityId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @Override
    public ResponseEntity<CityResponse> getCityByName(String cityName) {
        try {
            City city = worldDataService.getCityByName(cityName);
            return ResponseEntity.ok(new CityResponse(city));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @Override
    public ResponseEntity<CityResponse> getCityById(Integer cityId) {
        try {
            City city = worldDataService.getCityById(cityId);
            return ResponseEntity.ok(new CityResponse(city));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}
