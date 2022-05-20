package com.jsp.command;

public class Criteria {
	private int page = 1;
	private int perPageNum = 10;
	
	private int starRowNum = 0;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page < 1) {
			this.page = 1;
		}else {
			this.page = page;
		}
		setStartRowNum();
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) {
			this.page = 1;
		}else {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}
	public int getStartRowNum() {
		return starRowNum;
	}
	public void setStartRowNum() {
		this.starRowNum = (this.page-1)*perPageNum;
	}
	
	
}
