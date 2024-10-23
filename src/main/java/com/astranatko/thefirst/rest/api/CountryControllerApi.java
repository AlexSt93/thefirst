package com.astranatko.thefirst.rest.api;

import com.astranatko.thefirst.rest.model.response.CountryListResponse;
import com.astranatko.thefirst.rest.model.response.CountryResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Tag(name = "Country", description = "The Country API")
public interface CountryControllerApi {

    @Operation(summary = "Gets a Country by Id")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Found the Country",
                    content = {
                            @Content(
                                    mediaType = "application/json",
                                    schema = @Schema(implementation = CountryResponse.class)
                            )
                    }
            )
    })
    @GetMapping("/{countryId}")
    ResponseEntity<CountryResponse> getCountry(@PathVariable("countryId") Integer id);


    @Operation(summary = "Gets all Countries")
    @ApiResponses(value = {
            @ApiResponse(
                    responseCode = "200",
                    description = "Found Countries",
                    content = {
                            @Content(
                                    mediaType = "application/json",
                                    schema = @Schema(implementation = CountryListResponse.class)
                            )
                    }
            )
    })
    @GetMapping("/all")
    ResponseEntity<CountryListResponse> getAllCountries();
}
