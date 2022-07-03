package OwnerPackage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import vo.StoreVO;

public interface OwnerController {

	//-----------------------------------------------------------------------------------------------------------
	// 업체 등록 처리
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView addregi(@ModelAttribute("regi") StoreVO memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
