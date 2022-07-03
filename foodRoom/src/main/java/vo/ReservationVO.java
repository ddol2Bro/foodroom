package vo;

import org.springframework.stereotype.Component;

@Component("ReservationVO")
public class ReservationVO {
	
	private int fr_room_no;
	private String fr_name;
	private String fr_reservation_person_no;
	private String fr_reservation_date;
	private String fr_reservation_ox;
	
	public ReservationVO() {}
	
	public ReservationVO(int fr_room_no, String fr_name, String fr_reservation_person_no,
							String fr_reservation_date, String fr_reservation_ox) {
		this.fr_room_no					= fr_room_no;
		this.fr_name	= fr_name;
		this.fr_reservation_person_no				= fr_reservation_person_no;
		this.fr_reservation_date				= fr_reservation_date;
		this.fr_reservation_ox				= fr_reservation_ox;
	}

	public int getFr_room_no() {
		return fr_room_no;
	}

	public void setFr_room_no(int fr_room_no) {
		this.fr_room_no = fr_room_no;
	}

	public String getFr_name() {
		return fr_name;
	}

	public void setFr_name(String fr_name) {
		this.fr_name = fr_name;
	}

	public String getFr_reservation_person_no() {
		return fr_reservation_person_no;
	}

	public void setFr_reservation_person_no(String fr_reservation_person_no) {
		this.fr_reservation_person_no = fr_reservation_person_no;
	}

	public String getFr_reservation_date() {
		return fr_reservation_date;
	}

	public void setFr_reservation_date(String fr_reservation_date) {
		this.fr_reservation_date = fr_reservation_date;
	}

	public String getFr_reservation_ox() {
		return fr_reservation_ox;
	}

	public void setFr_reservation_ox(String fr_reservation_ox) {
		this.fr_reservation_ox = fr_reservation_ox;
	}

	@Override
	public String toString() {
		return "ReservationVO [fr_room_no=" + fr_room_no + ", fr_name=" + fr_name + ", fr_reservation_person_no="
				+ fr_reservation_person_no + ", fr_reservation_date=" + fr_reservation_date + ", fr_reservation_ox="
				+ fr_reservation_ox + "]";
	}

	
	
}