package com.core.test.vo;

public class ComLegVo {


	private String comName;
	private String longFrom;
	private String longTo;
	private String pos;
	private String no;
	private String place;
	
	
	@Override
	public String toString() {
		return "ComLegVo [comName=" + comName + ", longFrom=" + longFrom + ", longTo=" + longTo + ", pos=" + pos
				+ ", no=" + no + ", place=" + place + "]";
	}
	
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getLongFrom() {
		return longFrom;
	}
	public void setLongFrom(String longFrom) {
		this.longFrom = longFrom;
	}
	public String getLongTo() {
		return longTo;
	}
	public void setLongTo(String longTo) {
		this.longTo = longTo;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	
}
