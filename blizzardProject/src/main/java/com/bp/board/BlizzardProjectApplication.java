package com.bp.board;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages="com.bp.board.dao")
public class BlizzardProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlizzardProjectApplication.class, args);
	}

}