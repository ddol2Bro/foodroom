package vo;

import org.springframework.stereotype.Component;

@Component("selectVO")
public class SelectVO {
	
	private String findBigStore;		// 업체 검색 (대분류)
	private String findSmallStore;		// 업체 검색 (소분류)
	private String menu;				// 메뉴 검색
	private int	   personNo;			// 인원수 검색
	
	public SelectVO() {}
	
	public SelectVO(String findBigStore, String findSmallStore, String menu, int personNO) {
		this.findBigStore 	= findBigStore;
		this.findSmallStore = findSmallStore;
		this.menu			= menu;
		this.personNo		= personNO;
	}

	public String getFindBigStore() {
		return findBigStore;
	}

	public void setFindBigStore(String findBigStore) {
		this.findBigStore = findBigStore;
	}

	public String getFindSmallStore() {
		return findSmallStore;
	}

	public void setFindSmallStore(String findSmallStore) {
		this.findSmallStore = findSmallStore;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getPersonNo() {
		return personNo;
	}

	public void setPersonNo(int personNo) {
		this.personNo = personNo;
	}

	@Override
	public String toString() {
		return "SelectVO [findBigStore=" + findBigStore + ", findSmallStore=" + findSmallStore + ", menu=" + menu
				+ ", personNo=" + personNo + "]";
	}

	
}
