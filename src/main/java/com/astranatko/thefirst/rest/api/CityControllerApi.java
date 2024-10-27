package com.astranatko.thefirst.rest.api;

import com.astranatko.thefirst.rest.model.request.CityRequest;
import com.astranatko.thefirst.rest.model.response.CityResponse;
import com.astranatko.thefirst.rest.model.response.CityListResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Tag(name = "City", description = "The City API")
public interface CityControllerApi {

    @Operation(summary = "Store a City to database")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Returns the City in case of success"
            )
    })
    @PutMapping("/")
    ResponseEntity<CityResponse> addCity(@RequestBody CityRequest cityRequest);

    @Operation(summary = "Deletes a City from database")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Returns nothing in case of success"
            )
    })
    @DeleteMapping("/{cityId}")
    ResponseEntity<Void> deleteCity(@PathVariable("cityId") Integer cityId);

    @Operation(summary = "Gets a City by Id")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Found the City",
                    content = {
                            @Content(
                                    mediaType = "application/json",
                                    schema = @Schema(implementation = CityResponse.class)
                            )
                    }
            )
    })
    @GetMapping("/id/{cityId}")
    ResponseEntity<CityResponse> getCityById(
            @Parameter(description = "City Id")
            @PathVariable("cityId") Integer cityId);

    @Operation(summary = "Gets a City by name")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Found the City",
                    content = {
                            @Content(
                                    mediaType = "application/json",
                                    schema = @Schema(implementation = CityResponse.class)
                            )
                    }
            )
    })
    @GetMapping("/name/{cityName}")
    ResponseEntity<CityResponse> getCityByName(
            @Parameter(description = "City Name")
            @PathVariable("cityName") String cityName);

    @Operation(summary = "Gets all  Cities in the Country")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Found the all cities in the Country",
                    content = {
                            @Content(
                                    mediaType = "application/json",
                                    schema = @Schema(implementation = CityListResponse.class)
                            )
                    }
            )
    })
    @GetMapping("/all/{countryId}")
    ResponseEntity<CityListResponse> getCitiesInCountry(@Parameter(description = "Country Id") @PathVariable("countryId") Integer countryId);

    @Operation(summary = "Gets all  Cities stored in database")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Found the all cities",
                    content = {
                            @Content(
                                    mediaType = "application/json",
                                    schema = @Schema(implementation = CityListResponse.class)
                            )
                    }
            )
    })
    @GetMapping("/all")
    ResponseEntity<CityListResponse> getAllCities();

}
