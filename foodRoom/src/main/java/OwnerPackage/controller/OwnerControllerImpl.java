package OwnerPackage.controller;

import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import OwnerPackage.DAO.OwnerDAO;
import vo.ReservationVO;
import vo.RoomVO;
import vo.StoreVO;

@Controller("OwnerController")
public class OwnerControllerImpl implements OwnerController {

	@Autowired
	private OwnerDAO ownerDAO;
	@Autowired
	private StoreVO storeVO;
	@Autowired
	private ReservationVO reservationVO;
	
    //-----------------------------------------------------------------------------------------------------------
    // 업체정보 등록 페이지 폼
    //-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/regiForm.do", method=RequestMethod.GET)
		private ModelAndView regiForm(HttpServletRequest request, HttpServletResponse response) throws Exception { 	   
	   
	// 세션 가져오기
		HttpSession session = request.getSession();
		// 세션에 담긴 아이디 저장
		String sfr_id  = (String) session.getAttribute("fr_id");
		System.out.println("controllerFr_id ==>" + sfr_id );
		
		// 세션으로 가져온 아이디가 업체등록한 아이디인지 비교
		int idCount = ownerDAO.regiForm(sfr_id);
		
		ModelAndView mav = new ModelAndView();
		
		// 등록한 업체가 없는 경우
		if(idCount == 0) {
			mav.setViewName("/owner/regiForm"); // 업체 등록 페이지로 이동
		}
		// 등록한 업체가 있는 경우
		else {
			mav = new ModelAndView("redirect:/index.do"); // 메인 페이지로 이동
		}	
		return mav;
	 }

	//-----------------------------------------------------------------------------------------------------------
	// 업체 등록 처리
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="/addregi.do", method=RequestMethod.POST)
	public ModelAndView addregi(@ModelAttribute("store") StoreVO storeVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		// 세션에 담긴 아이디 저장
		String sfr_id  = (String) session.getAttribute("fr_id");
		// storeVO에 세션에 담긴 아이디 값 저장
		storeVO.setFr_id(sfr_id);
		System.out.println("controllerVO ==>" + storeVO);
		
		ModelAndView mav = new ModelAndView();
		
		int result = ownerDAO.addregi(storeVO); // 업체 등록
		System.out.println("dao 업체등록 결과 ==>" + result);
		mav = new ModelAndView("redirect:/index.do");
		
		return mav;
	}
   
    //-----------------------------------------------------------------------------------------------------------
    // 업체 예약관리 달력 페이지
    //-----------------------------------------------------------------------------------------------------------
    @RequestMapping(value="/reservation.do", method=RequestMethod.GET)
    private ModelAndView reservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/owner/reservation");
        return mav;
    }
   
    //-----------------------------------------------------------------------------------------------------------
    // 예약 관리 업체별 룸 정보 뿌리기
    //-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/reservationForm.do", method=RequestMethod.GET)
	private ModelAndView reservationForm(@RequestParam("fr_reservation_date") String fr_reservation_date, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String fr_id = (String)session.getAttribute("fr_id");
		
				
		int fr_no = ownerDAO.findFr_no(fr_id);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fr_reservation_date", fr_reservation_date);
		map.put("fr_no", fr_no);

		//예약 완료된 룸 리스트
		List<RoomVO> revRoomList = ownerDAO.revRoomList(map);
		
		//예약 가능한 룸 리스트
		List<RoomVO> frRoomNoList = ownerDAO.frRoomNoList(map);

		ModelAndView mav = new ModelAndView("/owner/reservationForm");
		
		mav.addObject("revRoomList", revRoomList);
		mav.addObject("frRoomNoList", frRoomNoList);
		mav.addObject("fr_reservation_date", fr_reservation_date);
		
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 오프라인 예약 완료 처리
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/ownerRevOk.do", method=RequestMethod.GET)
	public ModelAndView ownerRevOk(@RequestParam("fr_room_no") int fr_room_no, @RequestParam("fr_reservation_date") String fr_reservation_date,
		   HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fr_reservation_date", fr_reservation_date);
		map.put("fr_room_no", fr_room_no);
		
		ownerDAO.ownerRevOk(map);
		
		ModelAndView mav = new ModelAndView("redirect:/reservationForm.do");
		mav.addObject("fr_reservation_date", fr_reservation_date);
		return mav;
	}
	
	
   
}