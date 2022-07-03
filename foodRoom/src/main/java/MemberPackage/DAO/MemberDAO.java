package MemberPackage.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import vo.SelectVO;
import vo.StoreVO;

public interface MemberDAO {

	//-----------------------------------------------------------------------------------------------------------
	// 이용 가능한 업체 리스트 페이지
	//-----------------------------------------------------------------------------------------------------------
	public List<StoreVO> storeViewList() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 이용 가능한 업체 지역(대분류)별 검색
	//-----------------------------------------------------------------------------------------------------------
	public List<StoreVO> findStoreList(SelectVO selectVO) throws DataAccessException;
	
}
