package com.astranatko.thefirst.rest.impl;

import com.astranatko.thefirst.entities.Country;
import com.astranatko.thefirst.rest.api.CountryControllerApi;
import com.astranatko.thefirst.rest.model.response.CountryListResponse;
import com.astranatko.thefirst.rest.model.response.CountryResponse;
import com.astranatko.thefirst.service.WorldDataService;
import io.swagger.v3.oas.annotations.Parameter;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("countries/")
public class CountryController implements CountryControllerApi {

    private final WorldDataService worldDataService;

    public CountryController(WorldDataService worldDataService) {
        this.worldDataService = worldDataService;
    }

    @Override
    public ResponseEntity<CountryResponse> getCountry(@Parameter(description = "Country Id") Integer countryId) {
        try {
            Country country = worldDataService.getCountryById(countryId);
            return country != null
                    ? ResponseEntity.ok(new CountryResponse(country))
                    : ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @Override
    public ResponseEntity<CountryListResponse> getAllCountries() {
        try {
            List<Country> countryList = worldDataService.getAllCountries();
            List<CountryResponse> countryResponseList = countryList.stream().map(CountryResponse::new).toList();
            return ResponseEntity.ok(new CountryListResponse(countryResponseList));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}
