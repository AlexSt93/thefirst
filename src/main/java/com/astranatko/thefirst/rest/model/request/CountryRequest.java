package com.astranatko.thefirst.rest.model.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

import java.math.BigDecimal;

@Data
@Builder
public class CountryRequest {

    @NonNull
    @Schema(description = "Id", example = "01")
    private Integer id;
    @Schema(description = "Country code", example = "RU")
    private String countryCode;
    @Schema(description = "Country name", example = "Russia")
    @NonNull
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
