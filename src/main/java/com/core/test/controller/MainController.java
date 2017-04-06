package com.core.test.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.core.test.service.MainService;
import com.core.test.vo.IsMasterVo;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	@RequestMapping("")
	public String index() {

		return "index";
	}

	// 사원 리스트
	@RequestMapping("/main")
	public String main(@RequestParam(value = "page", required = true, defaultValue = "1") int page,
			@RequestParam(value = "kwd", required = true, defaultValue = "") String keyword,
			@RequestParam(value = "filterCheck", required = true, defaultValue = "1") String filterCheck, Model model) {
		// 사원 리스트
		Map<String, Object> map = mainService.getEmpList(page, keyword, filterCheck);
		model.addAttribute("map", map);
		return "/main";
	}

	// 사원 삭제
	@RequestMapping("delete")
	public String delete(@RequestParam(value = "chbox", required = true) List<Integer> values) {

		// list 출력
//		for (Integer value : values) {
//			System.out.println(value);
//		}
		mainService.deleteEmp(values);

		return "redirect: main";
	}

	// 사원 정보 넘기기
	@RequestMapping("modify")
	public String modify(@RequestParam(value = "chbox", required = true) List<Integer> values, Model model) {
		if (values.size() == 1) {
			int no = values.get(0);
			IsMasterVo isMasterVo = mainService.modifyEmp(no);
			model.addAttribute("isMasterVo", isMasterVo);
			return "modify";
		} else {
			return "redirect:main";
		}

	}

	// 수정
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(@ModelAttribute IsMasterVo isMasterVo, 
			@RequestParam("file") MultipartFile multipartFile) {
		mainService.modify(isMasterVo, multipartFile);
		return "redirect:/main";
	}

	@RequestMapping("join")
	public String Join() {
		return "page4";
	}

	// 등록
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute IsMasterVo isMasterVo, @RequestParam("file") MultipartFile multipartFile) {
		mainService.write(isMasterVo, multipartFile);
		return "redirect:/main";
	}

	// 네비게이션
	@RequestMapping("left")
	public String left() {
		return "left";
	}
}
