package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.listVo;


@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;
	
	// 리스트
	@Override
	public List<listVo> listAll() throws Exception {
		return boardDao.listAll();
	}
	
	// 게시글 작성
	@Override
	public void create(listVo list) throws Exception {
		boardDao.create(list);
	}
	
	// 상세 리스트
	@Override
	public listVo listDetail(int boardNum) throws Exception {
		return boardDao.listDetail(boardNum);
	}
	
	// 리스트 삭제
	@Override
	public listVo listDelete(int boardNum) throws Exception {
		return boardDao.listDelete(boardNum);
	}
	
	// 리스트 수정
	@Override
	public void listUpdate(listVo listvo) throws Exception {
		 boardDao.listUpdate(listvo);
	}
	
	// -------------------------------------------------------------
	
	// ajax 게시글 작성
	@Override
	public void AjaxCreate(listVo list) throws Exception {
		boardDao.create(list);
	}
	
	// ajax 리스트 삭제
	@Override
	public listVo AjaxListDelete(int boardNum) throws Exception {
		return boardDao.listDelete(boardNum);
	}
	
	
}
