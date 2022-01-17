package com.bp.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bp.board.services.BlizzardApiService;
import com.bp.board.services.MemberService;

@Controller
public class MainController {
	
	@Resource(name = "MemberService")
	private MemberService memberService;
	
	@Resource(name = "BlizzardApiService")
	private BlizzardApiService apiService;
	
	@RequestMapping(value = "/")
	public String main(Model model) {
		
		try {
			memberService.selectUserList(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main";
	}
	
	@RequestMapping(value = "/searchTokenPrice")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchTokenPrice(HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {
		Map<String, Object> responseMap = new HashMap<String, Object>();

		try {
			responseMap.put("result", "SUCC");
			responseMap.put("tokenMap", apiService.selectTokenPrice());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return new ResponseEntity<Map<String, Object>>(responseMap, HttpStatus.CREATED);
	}
	
}
