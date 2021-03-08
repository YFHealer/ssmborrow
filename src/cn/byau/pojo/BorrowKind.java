package cn.byau.pojo;

import java.util.List;

public class BorrowKind {
    private String kindId;
    private String kindName;
    private String kindRemark;
    
    private List<Borrow> borrowList;

    public String getKindId() {
		return kindId;
	}

	public void setKindId(String kindId) {
		this.kindId = kindId;
	}

	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public String getKindRemark() {
		return kindRemark;
	}

	public void setKindRemark(String kindRemark) {
		this.kindRemark = kindRemark;
	}

	public List<Borrow> getBorrowList() {
        return borrowList;
    }

    public void setBorrowList(List<Borrow> borrowList) {
        this.borrowList = borrowList;
    }

    
}