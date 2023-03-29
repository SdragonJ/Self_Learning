package woo.edu.c.vo;

public class listVo {
	
	private String 	boardTitle;
	private String 	boardUser;
	private int 	boardNum;
	private String 	boardContent;
	private String 	boardPostdate;
	
	public String getBoardPostdate() {
		return boardPostdate;
	}
	public void setBoardPostdate(String boardPostdate) {
		this.boardPostdate = boardPostdate;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardUser() {
		return boardUser;
	}
	public void setBoardUser(String boardUser) {
		this.boardUser = boardUser;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	@Override
	public String toString() {
		return "listVo [boardTitle=" + boardTitle + ", boardUser=" + boardUser + ", boardNum=" + boardNum
				+ ", boardContent=" + boardContent + ", boardPostdate=" + boardPostdate + "]";
	}
	

	
	
	
	
	


}
