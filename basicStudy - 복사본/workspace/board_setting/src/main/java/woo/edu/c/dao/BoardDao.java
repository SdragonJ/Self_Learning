package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.listVo;

public interface BoardDao {

	// 리스트
	public List<listVo> listAll() throws Exception ;
	
	// 게시글 작성
	public void create(listVo list) throws Exception;
	
	// 상세 리스트 
	public listVo listDetail(int boardNum) throws Exception ;
	
	// 게시글 삭제
	public listVo listDelete(int boardNum) throws Exception ;
	
	// 게시글 수정
	public void listUpdate(listVo listvo) throws Exception ;
	
	// ----------------------------------------------------------
	
	// ajax 게시글 작성
	public void AjaxCreate(listVo list) throws Exception;
	
	// ajax 리스트 삭제
	public listVo AjaxListDelete(int boardNum) throws Exception ;
	
	
}
