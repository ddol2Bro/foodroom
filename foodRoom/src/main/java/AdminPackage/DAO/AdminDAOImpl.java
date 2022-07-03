package AdminPackage.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import vo.RoomVO;
import vo.StoreVO;
import vo.UserVO;


@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//-----------------------------------------------------------------------------------------------------------
    // 승인 요청 List 페이지 폼
    //-----------------------------------------------------------------------------------------------------------
	@Override
	public List<StoreVO> approveList() throws DataAccessException {
		
		List<StoreVO> approveList = sqlSession.selectList("mapper.store.approveList");		
		System.out.println("결과값 ==>" + approveList);
		return approveList; 			
	}

	//-----------------------------------------------------------------------------------------------------------
	// 미등록 업체 승인하기 
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int approveGo(StoreVO storeVO) throws DataAccessException {
		System.out.println("미등록 업체 승인 테스트값 ==> " + storeVO);
		
		return sqlSession.update("mapper.store.approveGo", storeVO);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체 승인시 fr_class를 12로 변경 
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public int approveOwnerGo(StoreVO storeVO) throws DataAccessException {
		System.out.println("승인 시 fr_class 변경 테스트값 ==> " + storeVO);
		
		return sqlSession.update("mapper.store.approveOwnerGo", storeVO);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 승인된 업체 관리 List 페이지 폼
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public List<StoreVO> approveOkList() throws DataAccessException {
		List<StoreVO> approveOkList = sqlSession.selectList("mapper.store.approveOkList");	
		return approveOkList;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체검색 (업체명)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<StoreVO> findStoreOk(@RequestParam("selectText") String selectText) throws DataAccessException {
		List<StoreVO> okList = sqlSession.selectList("mapper.store.findStoreOk", selectText);	
		System.out.println(okList);
		return okList;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 업체검색 (주소)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<StoreVO> findAddressOk(@RequestParam("selectText") String selectText) throws DataAccessException {
		List<StoreVO> okList = sqlSession.selectList("mapper.store.findAddressOk", selectText);	
		System.out.println(okList);
		return okList;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 룸 정보 List 페이지 폼
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public List<StoreVO> roomList(RoomVO roomVO) throws DataAccessException {
		List<StoreVO> roomList = sqlSession.selectList("mapper.room.roomList", roomVO);	
		return roomList;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 룸 정보 추가
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int addRoomImage(RoomVO roomVO) throws DataAccessException {
		System.out.println("freeBoardVO DAO ==> " + roomVO);
		int result = sqlSession.insert("mapper.room.addRoomImage", roomVO);
		return result;
	}
	
}
