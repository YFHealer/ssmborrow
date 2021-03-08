package cn.byau.pojo;

public class Borrow {
    private String borrowId;

	private String userId;

    private String bookId;

	private String stime;

    private String etime;

    private String borrowRemark;

    private BorrowKind borrowKind;
    
    public Borrow() {
		super();
	}
    
    public Borrow(String borrowId, String userId, String bookId, String stime, String etime,
			String borrowRemark) {
		super();
		this.borrowId = borrowId;
		this.userId = userId;
		this.bookId = bookId;
		this.stime = stime;
		this.etime = etime;
		this.borrowRemark = borrowRemark;
	}

   
	public String getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(String borrowId) {
		this.borrowId = borrowId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getBorrowRemark() {
		return borrowRemark;
	}

	public void setBorrowRemark(String borrowRemark) {
		this.borrowRemark = borrowRemark;
	}

	public BorrowKind getBorrowKind() {
		return borrowKind;
	}

	public void setBorrowKind(BorrowKind borrowKind) {
		this.borrowKind = borrowKind;
	}

	@Override
	public String toString() {
		return "Borrow [borrowId=" + borrowId + ", userId=" + userId + ", bookId=" + bookId
				+ ", stime=" + stime + ", etime=" + etime + ", borrowRemark=" + borrowRemark
				+ "]";
	}

    
}