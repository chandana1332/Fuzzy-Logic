package com.fuzzylogic.front;

public class DataInfo {
	private long id;
	private String strTitle;
	private String strContent;
	
	public DataInfo(){
		id = 0;
		strTitle = "";
		strContent = "";
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getStrTitle() {
		return strTitle;
	}
	public void setStrTitle(String strTitle) {
		this.strTitle = strTitle;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String strContent) {
		this.strContent = strContent;
	}
	
	
	
}
