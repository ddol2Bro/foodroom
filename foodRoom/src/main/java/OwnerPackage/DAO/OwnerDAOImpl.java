package OwnerPackage.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import vo.ReservationVO;
import vo.RoomVO;
import vo.StoreVO;

@Repository("OwnerDAO")
public class OwnerDAOImpl implements OwnerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	//-----------------------------------------------------------------------------------------------------------
	// 업체 등록 처리
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public int addregi(StoreVO storeVO) throws DataAccessException {
		
		return sqlSession.insert("mapper.store.addregi", storeVO);
	}

	
	//-----------------------------------------------------------------------------------------------------------
	// 업체 중복 등록 방지용
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public int regiForm(String sfr_id) throws DataAccessException {
	
		return sqlSession.selectOne("mapper.store.regiForm", sfr_id);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 로그인한 id와 일치하는 fr_no 찾기
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public int findFr_no(String fr_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.store.findFr_no", fr_id);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 로그인한 id와 일치하는 fr_no 받아와서 리스트로 뿌리기
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public List<RoomVO> revRoomList(HashMap<String, Object> map) throws DataAccessException {
		List<RoomVO> revRoomList = sqlSession.selectList("mapper.room.revRoomList", map);
		
		return revRoomList;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 오프라인 예약 처리하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int ownerRevOk(HashMap<String, Object> map) throws DataAccessException{
		System.out.println("넘겨받은 룸 번호, 날짜 ==> " + map);
		
		return sqlSession.insert("mapper.room.ownerRevOk", map);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 로그인한 id와 일치하는 fr_no 받아와서 리스트로 뿌리기
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public List<RoomVO> frRoomNoList(HashMap<String, Object> map) throws DataAccessException {
		List<RoomVO> frRoomNoList = sqlSession.selectList("mapper.room.frRoomNoList", map);	
		return frRoomNoList;
	}
	
}
