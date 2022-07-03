package MemberPackage.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import vo.SelectVO;
import vo.StoreVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	//-----------------------------------------------------------------------------------------------------------
	// 이용 가능한 업체 리스트 페이지
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<StoreVO> storeViewList() throws DataAccessException {
		List<StoreVO> storeViewList = sqlSession.selectList("mapper.store.approveOkList");
		return storeViewList;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 이용 가능한 업체 지역(대분류)별 검색
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<StoreVO> findStoreList(SelectVO selectVO) throws DataAccessException {
		List<StoreVO> findBigStore = sqlSession.selectList("mapper.store.findStoreList", selectVO);			

		return findBigStore;
	}

}
