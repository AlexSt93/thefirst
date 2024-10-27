package com.astranatko.thefirst;

import com.astranatko.thefirst.rest.impl.CityController;
import com.astranatko.thefirst.rest.impl.CountryController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
class ThefirstApplicationTests {

	private final CityController cityController;
	private final CountryController countryController;

	@Autowired
	public ThefirstApplicationTests(CityController cityController,
									CountryController countryController) {
		this.cityController = cityController;
		this.countryController = countryController;
	}

	@Test
	void contextLoads() {
		assertThat(cityController).isNotNull();
		assertThat(countryController).isNotNull();
	}

}
