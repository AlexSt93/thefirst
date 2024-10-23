package com.astranatko.thefirst.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Entity
@Table(name = "COUNTRIES")
@Data
@NoArgsConstructor
public class Country extends Base{

    @Column(name = "COUNTRY_CODE", nullable = false, length = 2)
    private String countryCode;

    @Column(name = "NAME", nullable = false, length = 100)
    private String name;

    @Column(name = "OFFICIAL_NAME", length = 200)
    private String officialName;

    @Column(name = "POPULATION")
    private Long population;

    @Column(name = "AREA_SQ_KM", precision = 10, scale = 2)
    private BigDecimal areaSqKm;

    @Column(name = "LATITUDE", precision = 8, scale = 5)
    private BigDecimal latitude;

    @Column(name = "LONGITUDE", precision = 8, scale = 5)
    private BigDecimal longitude;

    @Column(name = "TIMEZONE", length = 40)
    private String timezone;

}