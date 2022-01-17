package com.bp.board.services.impl;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.bp.board.services.BlizzardApiService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service("BlizzardApiService")
public class BlizzardApiServiceImpl implements BlizzardApiService {

	@Override
	public Map<String, Object> selectTokenPrice() {
		Map<String,Object> tokenMap = null;
		
		try {
		
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));    //Response Header to UTF-8  

			String url = "https://kr.api.blizzard.com/data/wow/token/index";

			Map<String, String> uriParams = new HashMap<String, String>();

			UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(url);
			
			//parameter 입력 부.
			builder.queryParam("namespace", "dynamic-kr");
			builder.queryParam("locale", "en_US");
			builder.queryParam("access_token", "USzZsEwA2pi8gBDuiLkbNwXCLIwZLm764e");

			ParameterizedTypeReference<Map<String, Object>> responseType = new ParameterizedTypeReference<Map<String, Object>>() {};
			ResponseEntity<Map<String, Object>> response = restTemplate.exchange(builder.buildAndExpand(uriParams).toUri(), 
					HttpMethod.GET, 
					new HttpEntity<String>(headers), 
					responseType);
			if(response.getStatusCodeValue() == 200) {
				ObjectMapper mapper = new ObjectMapper();
				tokenMap = mapper.convertValue(response.getBody(), new TypeReference<Map<String, Object>>(){});

			}else {
				tokenMap = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tokenMap;
	}
}
