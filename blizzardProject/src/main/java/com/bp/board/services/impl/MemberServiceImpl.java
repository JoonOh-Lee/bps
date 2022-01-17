package com.bp.board.services.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bp.board.dao.MainMapper;
import com.bp.board.services.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MainMapper mainMapper;

	public void selectUserList(Model model) {
		List<HashMap<String, Object>> test = mainMapper.selectUserList();
		System.out.println("값 확인 : " + test);
		model.addAttribute("test", test);
	}

}
