package com.astranatko.thefirst;

import com.astranatko.thefirst.entities.City;
import com.astranatko.thefirst.rest.impl.CityController;
import com.astranatko.thefirst.rest.model.response.CityListResponse;
import com.astranatko.thefirst.rest.model.response.CityResponse;
import com.astranatko.thefirst.service.WorldDataService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ActiveProfiles;

import java.util.Collections;

import static com.astranatko.thefirst.TestDataUtils.*;
import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

@SpringBootTest
@ActiveProfiles("test")
public class CitiesControllerTest {

    @Autowired
    private CityController cityController;
    @MockBean
    private WorldDataService worldDataService;
    @Autowired
    private TestDataUtils testDataUtils;

    @BeforeEach
    public void setUp() {
        City defaultCity = testDataUtils.getDefaultCity();

        when(this.worldDataService.getCityByName(DEFAULT_CITY_NAME)).thenReturn(defaultCity);
        when(this.worldDataService.getCityById(DEFAULT_CITY_ID)).thenReturn(defaultCity);

        when(this.worldDataService.addCity(testDataUtils.getMoscowCityRequest())).thenReturn(testDataUtils.getMoscowCity());
        when(this.worldDataService.addCity(testDataUtils.getDefaultCityRequest())).thenThrow(new IllegalStateException());
        when(this.worldDataService.getAllCitiesByCountryId(RUSSIA_COUNTRY_ID)).thenReturn(Collections.singletonList(testDataUtils.getMoscowCity()));

        doThrow(RuntimeException.class).when(this.worldDataService).deleteCityById(DEFAULT_CITY_ID);
    }

    @Test
    public void testGetCityByName_returnsDefault() {
        ResponseEntity<CityResponse> response = cityController.getCityByName(DEFAULT_CITY_NAME);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);

        CityResponse cityResponse = response.getBody();
        assertThat(cityResponse).isNotNull();
        assertThat(cityResponse.getId()).isEqualTo(DEFAULT_CITY_ID);
    }

    @Test
    public void testGetCityById_returnsDefault() {
        ResponseEntity<CityResponse> response = cityController.getCityById(DEFAULT_CITY_ID);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);

        CityResponse cityResponse = response.getBody();
        assertThat(cityResponse).isNotNull();
        assertThat(cityResponse.getName()).isEqualTo(DEFAULT_CITY_NAME);
    }

    @Test
    public void testGetCityById_returnNotFound() {
        ResponseEntity<CityResponse> response = cityController.getCityById(DEFAULT_CITY_ID + 1);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.NOT_FOUND);
    }

    @Test
    public void testAddCity_returnsMoscow() {
        ResponseEntity<CityResponse> response = cityController.addCity(testDataUtils.getMoscowCityRequest());
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);

        CityResponse cityResponse = response.getBody();
        assertThat(cityResponse).isNotNull();
        assertThat(cityResponse.getName()).isEqualTo(MOSCOW_CITY_NAME);
    }

    @Test
    public void testAddCity_returnsBadRequest() {
        ResponseEntity<CityResponse> response = cityController.addCity(testDataUtils.getDefaultCityRequest());
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
    }

    @Test
    public void testDeleteCity_returnsNotFound() {
        ResponseEntity<Void> response = cityController.deleteCity(DEFAULT_CITY_ID);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.NOT_FOUND);
    }

    @Test
    public void testGetCitiesInCountry_returnsMoscow() {
        ResponseEntity<CityListResponse> foundCities = this.cityController.getCitiesInCountry(RUSSIA_COUNTRY_ID);

        assertThat(foundCities.getStatusCode()).isEqualTo(HttpStatus.OK);

        CityListResponse cityListResponse = foundCities.getBody();
        assertThat(cityListResponse).isNotNull();
        assertThat(cityListResponse.getCities().size()).isEqualTo(1);
        assertThat(cityListResponse.getCities().get(0).getName()).isEqualTo(MOSCOW_CITY_NAME);
    }
}
