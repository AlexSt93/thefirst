package com.astranatko.thefirst.rest.model.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

import java.math.BigDecimal;

@Data
@Builder
public class CityRequest {

    @Schema(description = "Id", example = "01")
    private Integer id;
    @NonNull
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
    @NonNull
    @Schema(description = "Country Id", example = "148")
    private Integer countryId;
}
