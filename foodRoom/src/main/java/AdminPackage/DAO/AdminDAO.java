package AdminPackage.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;

import vo.RoomVO;
import vo.StoreVO;
import vo.UserVO;



public interface AdminDAO {
	
	//-----------------------------------------------------------------------------------------------------------
	// 승인 요청 List 페이지 폼
	//-----------------------------------------------------------------------------------------------------------
	public List<StoreVO> approveList() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 미등록 업체 승인하기  
	//-----------------------------------------------------------------------------------------------------------
	public int approveGo(StoreVO storeVO) throws DataAccessException;  
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체 승인시 fr_class를 12로 변경
	//-----------------------------------------------------------------------------------------------------------
	public int approveOwnerGo(StoreVO storeVO) throws DataAccessException;  
	
	//-----------------------------------------------------------------------------------------------------------
	// 승인된 업체 관리 List 페이지 폼
	//-----------------------------------------------------------------------------------------------------------
	public List<StoreVO> approveOkList() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체검색 (업체명)
	//-----------------------------------------------------------------------------------------------------------
	public List<StoreVO> findStoreOk(@RequestParam("selectText") String selectText) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체검색 (주소)
	//-----------------------------------------------------------------------------------------------------------
	public List<StoreVO> findAddressOk(@RequestParam("selectText") String selectText) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 룸 정보 List 페이지 폼
	//-----------------------------------------------------------------------------------------------------------
	public List<StoreVO> roomList(RoomVO roomVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 룸 정보 추가
	//-----------------------------------------------------------------------------------------------------------
	public int addRoomImage(RoomVO roomVO) throws DataAccessException;
	

}