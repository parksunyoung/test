package com.core.test.vo;

public class ComWorkVo {

	private String workPlace;
	private String longFrom;
	private String longTo;
	private String conCom;
	private String slae;
	private String sattlePredict;
	private String sattleDate;
	private String no;
	
	
	@Override
	public String toString() {
		return "ComWorkVo [workPlace=" + workPlace + ", longFrom=" + longFrom + ", longTo=" + longTo + ", conCom="
				+ conCom + ", slae=" + slae + ", sattlePredict=" + sattlePredict + ", sattleDate=" + sattleDate
				+ ", no=" + no + "]";
	}
	public String getWorkPlace() {
		return workPlace;
	}
	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
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
	public String getConCom() {
		return conCom;
	}
	public void setConCom(String conCom) {
		this.conCom = conCom;
	}
	public String getSlae() {
		return slae;
	}
	public void setSlae(String slae) {
		this.slae = slae;
	}
	public String getSattlePredict() {
		return sattlePredict;
	}
	public void setSattlePredict(String sattlePredict) {
		this.sattlePredict = sattlePredict;
	}
	public String getSattleDate() {
		return sattleDate;
	}
	public void setSattleDate(String sattleDate) {
		this.sattleDate = sattleDate;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	
}
