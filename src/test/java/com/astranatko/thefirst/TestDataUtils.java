package com.astranatko.thefirst;

import com.astranatko.thefirst.entities.City;
import com.astranatko.thefirst.entities.Country;
import com.astranatko.thefirst.rest.model.request.CityRequest;
import org.springframework.stereotype.Component;

@Component
public class TestDataUtils {

    public static final String DEFAULT_COUNTRY_NAME = "Default Country";
    public static final Integer DEFAULT_COUNTRY_ID = 0;
    public static final String DEFAULT_CITY_NAME = "Default City";
    public static final Integer DEFAULT_CITY_ID = 0;

    public static final String RUSSIA_COUNTRY_NAME = "Russia";
    public static final Integer RUSSIA_COUNTRY_ID = 148;
    public static final String MOSCOW_CITY_NAME = "Moscow";
    public static final Integer MOSCOW_CITY_ID = 403;

    public Country getDefaultCountry() {
        Country defaultCountry = new Country();
        defaultCountry.setId(DEFAULT_COUNTRY_ID);
        defaultCountry.setName(DEFAULT_COUNTRY_NAME);

        return defaultCountry;
    }

    public City getDefaultCity() {
        City defaultCity = new City();
        defaultCity.setId(DEFAULT_CITY_ID);
        defaultCity.setName(DEFAULT_CITY_NAME);
        defaultCity.setCountry(getDefaultCountry());

        return defaultCity;
    }

    public City getMoscowCity() {
        City moscowCity = new City();
        moscowCity.setId(MOSCOW_CITY_ID);
        moscowCity.setName(MOSCOW_CITY_NAME);
        moscowCity.setCountry(getRussiaCountry());

        return moscowCity;
    }

    public Country getRussiaCountry() {
        Country russiaCountry = new Country();
        russiaCountry.setId(RUSSIA_COUNTRY_ID);
        russiaCountry.setName(RUSSIA_COUNTRY_NAME);
//        russiaCountry.setOfficialName("Russian Federation");

        return russiaCountry;
    }

    public CityRequest getMoscowCityRequest() {
        return CityRequest.builder()
                .id(MOSCOW_CITY_ID)
                .name(MOSCOW_CITY_NAME)
                .countryId(RUSSIA_COUNTRY_ID)
                .build();
    }

    public CityRequest getDefaultCityRequest() {
        return CityRequest.builder()
                .id(DEFAULT_CITY_ID)
                .name(DEFAULT_CITY_NAME)
                .countryId(DEFAULT_COUNTRY_ID)
                .build();
    }
}
