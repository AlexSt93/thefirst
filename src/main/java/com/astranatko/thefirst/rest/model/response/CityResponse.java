package com.astranatko.thefirst.rest.model.response;

import com.astranatko.thefirst.entities.City;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class CityResponse {

    public CityResponse(City city) {
        this.id = city.getId();
        this.name = city.getName();
        this.officialName = city.getOfficialName();
        this.population = city.getPopulation();
        this.isCapital = city.getIsCapital();
        this.latitude = city.getLatitude();
        this.longitude = city.getLongitude();
        this.timezone = city.getTimezone();
        this.country = new CountryResponse(city.getCountry());
    }

    @Schema(description = "Id", example = "01")
    private Integer id;
    @Schema(description = "City name", example = "Moscow")
    private String name;
    @Schema(description = "Official City name", example = "Moscow")
    private String officialName;
    @Schema(description = "Population", example = "14212300")
    private Integer population;
    @Schema(description = "Is Capital?", example = "true")
    private Boolean isCapital;
    @Schema(description = "Latitude", example = "60")
    private BigDecimal latitude;
    @Schema(description = "Longitude", example = "100")
    private BigDecimal longitude;
    private String timezone;
    @Schema(description = "Country")
    private CountryResponse country;
}
