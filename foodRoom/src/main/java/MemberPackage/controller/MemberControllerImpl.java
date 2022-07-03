package MemberPackage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import MemberPackage.DAO.MemberDAO;
import vo.SelectVO;
import vo.StoreVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private SelectVO selectVO;

	//-----------------------------------------------------------------------------------------------------------
	// 이용 가능한 업체 리스트 페이지
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/storeViewListForm.do", method=RequestMethod.GET)
	private ModelAndView storeViewList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<StoreVO> storeView = memberDAO.storeViewList();	// 이용 가능한 업체 List로 보여주기	
		
		ModelAndView mav = new ModelAndView("/member/storeListPage");
		mav.addObject("storeViewList", storeView);
		return mav;
	}
	//-----------------------------------------------------------------------------------------------------------
	// 이용 가능한 업체 지역(대분류)별 검색
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/findStoreList.do", method=RequestMethod.GET)
	private ModelAndView findStoreList(@RequestParam("findBigStore") String findBigStore, @RequestParam("findSmallStore") String findSmallStore,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("넘긴값" + findBigStore);
		
		SelectVO select = new SelectVO();			// 비어있는 selectVO 생성
		select.setFindBigStore(findBigStore);		// findBigStore 값 VO에 담기
		if(findSmallStore.equals("모두")) {			// 소분류가 모두인 경우 findSmallStore값을 / 로 바꿔준다.
			select.setFindSmallStore("/");
		}
		else {											// 소분류가 지정된 경우 가져온 소분류 값을 그대로 VO에 담는다.
			select.setFindSmallStore(findSmallStore);	// findSmallStore 값 VO에 담기
			System.out.println("소분류 확인 findSmallStore 값 => "+ select);
		}
		List<StoreVO> FindStore = new ArrayList<> ();
		
		FindStore = memberDAO.findStoreList(select);
		System.out.println("FindStore 가져온 값 => "+ FindStore);
	
		ModelAndView mav = new ModelAndView("/member/storeListPage");
		mav.addObject("storeViewList", FindStore);
		return mav;
		
	}
}
