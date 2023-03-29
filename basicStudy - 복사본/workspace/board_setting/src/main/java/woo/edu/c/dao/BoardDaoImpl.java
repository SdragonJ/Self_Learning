package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.listVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "boardMapper";

	// 리스트
	@Override
	public List<listVo> listAll() throws Exception {
		return sql.selectList(namespace + ".listAll");
	}
	
	// 게시글 작성
	public void create(listVo list) throws Exception {
		sql.insert(namespace + ".insert", list);
	}
	
	// 상세 리스트
	@Override
	public listVo listDetail(int boardNum) throws Exception {
		return sql.selectOne(namespace + ".listDetail", boardNum);
	}
	
	// 게시글 삭제
	@Override
	public listVo listDelete(int boardNum) throws Exception {
		return sql.selectOne(namespace + ".listDelete", boardNum);
	}
		
	// 게시글 수정
	@Override
	public void listUpdate(listVo listvo) throws Exception {
		 sql.update(namespace + ".listUpdate", listvo);
	}
	
	// ----------------------------------------------------------------
	
	// 게시글 작성
	public void AjaxCreate(listVo list) throws Exception {
		sql.insert(namespace + ".insert", list);
	}
	
	// ajax 게시글 삭제
	@Override
	public listVo AjaxListDelete(int boardNum) throws Exception {
		return sql.selectOne(namespace + ".listDelete", boardNum);
	}
	
	
}
