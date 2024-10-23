package com.astranatko.thefirst.rest.model.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Data
@RequiredArgsConstructor
@Schema(description = "The list of Cities")
public class CityListResponse {

    private final List<CityResponse> cities;
}
