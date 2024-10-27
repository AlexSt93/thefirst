package com.astranatko.thefirst;

import com.astranatko.thefirst.entities.Country;
import com.astranatko.thefirst.rest.impl.CountryController;
import com.astranatko.thefirst.rest.model.response.CountryListResponse;
import com.astranatko.thefirst.rest.model.response.CountryResponse;
import com.astranatko.thefirst.service.WorldDataService;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.junit.jupiter.api.Test;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.Collections;

import static com.astranatko.thefirst.TestDataUtils.*;
import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@SpringBootTest
@ActiveProfiles("test")
public class CountryControllerTest {

    @MockBean
    private WorldDataService worldDataService;
    @Autowired
    private CountryController countryController;
    @Autowired
    private TestDataUtils testDataUtils;

    @BeforeEach
    public void setUp() {
        Country defaultCountry = testDataUtils.getDefaultCountry();

        when(this.worldDataService.getCountryById(0)).thenReturn(defaultCountry);
        when(this.worldDataService.getAllCountries()).thenReturn(Collections.singletonList(defaultCountry));
    }

    @Test
    public void testGetCountry_returnsDefault() {
        ResponseEntity<CountryResponse> foundCountry = this.countryController.getCountry(DEFAULT_COUNTRY_ID);

        assertThat(foundCountry.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(foundCountry.getBody()).isNotNull();
        assertThat(foundCountry.getBody().getName()).isEqualTo(DEFAULT_COUNTRY_NAME);
    }

    @Test
    public void testGetCountry_returnsNotFound() {
        ResponseEntity<CountryResponse> foundCountry = this.countryController.getCountry(DEFAULT_COUNTRY_ID + 1);

        assertThat(foundCountry.getStatusCode()).isEqualTo(HttpStatus.NOT_FOUND);
    }

    @Test
    public void testGetAllCountries_returnsDefault(){
        ResponseEntity<CountryListResponse> foundCountries = this.countryController.getAllCountries();

        assertThat(foundCountries.getStatusCode()).isEqualTo(HttpStatus.OK);

        CountryListResponse countryListResponse = foundCountries.getBody();
        assertThat(countryListResponse).isNotNull();
        assertThat(countryListResponse.getCountries().size()).isEqualTo(1);
        assertThat(countryListResponse.getCountries().get(0).getName()).isEqualTo(DEFAULT_COUNTRY_NAME);
    }

}
