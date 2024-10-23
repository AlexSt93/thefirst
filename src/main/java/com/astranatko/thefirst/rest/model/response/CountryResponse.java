package com.astranatko.thefirst.rest.model.response;

import com.astranatko.thefirst.entities.Country;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Schema(description = "Country")
public class CountryResponse {

    public CountryResponse(Country country) {
        this.id = country.getId();
        this.countryCode = country.getCountryCode();
        this.name = country.getName();
        this.officialName = country.getOfficialName();
        this.population = country.getPopulation();
        this.areaSqKm = country.getAreaSqKm();
        this.latitude = country.getLatitude();
        this.longitude = country.getLongitude();
        this.timezone = country.getTimezone();
    }

    @Schema(description = "Id", example = "01")
    private Integer id;
    @Schema(description = "Country code", example = "RU")
    private String countryCode;
    @Schema(description = "Country name", example = "Russia")
    private String name;
    @Schema(description = "Official Country name", example = "Russian Federation")
    private String officialName;
    @Schema(description = "Population", example = "142123000")
    private Long population;
    @Schema(description = "Area of the Country, square kilometers", example = "17098242")
    private BigDecimal areaSqKm;
    @Schema(description = "Latitude", example = "60")
    private BigDecimal latitude;
    @Schema(description = "Longitude", example = "100")
    private BigDecimal longitude;
    private String timezone;
}
