package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.listVo;

public interface BoardService {
	
	// 리스트 전체 
	List<listVo> listAll() throws Exception;
	
	// 리스트 작성
	void create(listVo list) throws Exception;
	
	// 리스트 상세
	listVo listDetail(int boardNum) throws Exception;
	
	// 리스트 삭제
	listVo listDelete(int boardNum) throws Exception;
	
	// 리스트 수정
	void listUpdate(listVo listvo) throws Exception;
	
	// ---------------------------------------------------------
	
	// Ajax 리스트 작성
	void AjaxCreate(listVo list) throws Exception;
	
	// Ajax 리스트 삭제
	listVo AjaxListDelete(int boardNum) throws Exception;
	
	
	
}
