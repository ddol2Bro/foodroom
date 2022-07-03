package OwnerPackage.DAO;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import vo.ReservationVO;
import vo.RoomVO;
import vo.StoreVO;

public interface OwnerDAO {

	//-----------------------------------------------------------------------------------------------------------
	// 업체 등록 페이지
	//-----------------------------------------------------------------------------------------------------------
	public int regiForm(String sfr_id) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체 등록 처리
	//-----------------------------------------------------------------------------------------------------------
	public int addregi(StoreVO storeVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 승인된 업체 관리 List 페이지 폼
	//-----------------------------------------------------------------------------------------------------------
	public List<RoomVO> revRoomList(HashMap<String, Object> map) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체번호 찾아오기
	//-----------------------------------------------------------------------------------------------------------
	public int findFr_no(String fr_id) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 오프라인 예약 처리
	//-----------------------------------------------------------------------------------------------------------
	public int ownerRevOk(HashMap<String, Object> map) throws DataAccessException;  
	
	//-----------------------------------------------------------------------------------------------------------
	// 승인된 업체 관리 List 페이지 폼
	//-----------------------------------------------------------------------------------------------------------
	public List<RoomVO> frRoomNoList(HashMap<String, Object> map) throws DataAccessException;
	
}
