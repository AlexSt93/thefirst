package com.astranatko.thefirst.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;

@Entity
@Table(name = "CITIES")
@Data
@NoArgsConstructor
public class City extends Base {

    public City (String name, Country country) {
        this.name = name;
        this.country = country;
    }

    @Column(name = "OFFICIAL_NAME", length = 200)
    private String officialName;

    @Column(name = "POPULATION")
    private Integer population;

    @ColumnDefault("'N'")
    @Column(name = "IS_CAPITAL")
    private Boolean isCapital = false;

    @Column(name = "LATITUDE", precision = 8, scale = 5)
    private BigDecimal latitude;

    @Column(name = "LONGITUDE", precision = 8, scale = 5)
    private BigDecimal longitude;

    @Column(name = "TIMEZONE", length = 40)
    private String timezone;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "COUNTRY_ID", nullable = false)
    private Country country;

}