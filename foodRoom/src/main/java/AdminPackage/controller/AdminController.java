package AdminPackage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import vo.RoomVO;


public interface AdminController {

	//-----------------------------------------------------------------------------------------------------------
	// 룸 정보 추가
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView addRoomInfo(@ModelAttribute("RoomVO") RoomVO roomVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}



