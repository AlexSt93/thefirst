package com.astranatko.thefirst;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.astranatko.thefirst.repository")
public class ThefirstApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThefirstApplication.class, args);
	}

}
