package woo.edu.c.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.util.Locale;
import java.util.Map;

import woo.edu.c.service.BoardService;
import woo.edu.c.vo.listVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService boardService;
	
	
	// 메인 화면
	@RequestMapping(value = "/board/home")
	public String home() throws Exception {
		logger.info("/board/home");
		return "home";
	} 
	
	// -----------------------------------------------------------------------------------------
	
	// 게시글 리스트
	@RequestMapping(value = "/board/board", method = RequestMethod.GET)
	public String boardList( Model model) throws Exception {
		
		logger.info("/board/board");
		List<listVo> list = boardService.listAll();
		System.out.println("list 뿌려줄거 ====="+list);
		model.addAttribute("boardList", list);
		return "/board/boardlist";
	}

	// -----------------------------------------------------------------------------------------
	
	// 게시글 작성1
	@RequestMapping(value = "/board/create", method = RequestMethod.GET)
	public String boardWrite() throws Exception {
		logger.info("/board/create");
		return "/board/write";
	}
	
	// 게시글 작성2
	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute listVo list, Locale locale) throws Exception {
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		list.setBoardPostdate(format.format(date));
		
		System.out.println(" 디비로 넘길거  " + list);
		
		boardService.create(list);	
		return "redirect:/board/board";
	}
	
	// -----------------------------------------------------------------------------------------
	
	// 상세 페이지
	@RequestMapping(value = "/board/listDetail", method = RequestMethod.GET)
	public String boardDetail( Model model, int boardNum ) throws Exception {
		listVo listDetail = boardService.listDetail(boardNum);
		System.out.println("상세뭐들어오나!!!!!!!!!"+listDetail);
		model.addAttribute("listDetail", listDetail);
		return "/board/detail";
	}
		
	// -----------------------------------------------------------------------------------------		
	
	// 게시글 수정 1
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String getupdate(int boardNum, Model model) throws Exception {
		listVo data = boardService.listDetail(boardNum);
		System.out.println("게시글수정엔뭐들어왔나!!" + data);
		model.addAttribute("data",data);
		return "/board/update";
	}
	
	// 게시글 수정 2
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String postupdate(listVo listvo) throws Exception{
		boardService.listUpdate(listvo);
		return "redirect:/board/board";
	}
	
	// -----------------------------------------------------------------------------------------	
		
	// 게시글 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String delete(int boardNum) throws Exception {
		boardService.listDelete(boardNum);
		return "redirect:/board/board";
	}
	
	
	// -----------------------------------------------------------------------------------------------------------
		 // Ajax       Ajax       Ajax       Ajax       Ajax       Ajax       Ajax       Ajax       Ajax       
	// -----------------------------------------------------------------------------------------------------------
	
	
	// Ajax 메인 화면
	@RequestMapping(value = "/board/boardAjaxMain" , method=RequestMethod.GET)
	public String boardAjaxMain() throws Exception {
		logger.info("/board/boardAjaxMain");
		return "/board/boardAjaxList";
	}
	
	// Ajax 게시판 조회
	@ResponseBody
	@RequestMapping(value = "/board/boardAjaxList" , method=RequestMethod.GET)
	public List<listVo> boardAjaxList() throws Exception {
		logger.info("/board/boardAjaxMain");
		List<listVo> list = boardService.listAll();
		System.out.println("아작스list는 뭐들어와 == "+ list);
		return list;
	}
	
	// Ajax 게시글 작성
		@RequestMapping(value = "/board/AjaxInsert", method = RequestMethod.POST)
		public String AjaxInsert(@ModelAttribute listVo list, Locale locale) throws Exception {
			
			Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
			list.setBoardPostdate(format.format(date));
			
			System.out.println("아작스 디비로 넘길거  " + list);
			
			boardService.AjaxCreate(list);	
			return "redirect:/board/boardAjaxList";
//			return "/board/boardAjaxList";
		}
		
	// ajax 게시글 삭제
	@RequestMapping(value = "/board/AjaxDelete", method = RequestMethod.POST)
	public String AjaxDelete(int boardNum) throws Exception {
		boardService.listDelete(boardNum);
//		return "/board/boardAjaxList";
		return "redirect:/board/boardAjaxList";
	}
	
		
	// -----------------------------------------------------------------------------------------------------------
	// 구구단   계산기   글자색         구구단   계산기   글자색         구구단   계산기   글자색         구구단   계산기   글자색
	// -----------------------------------------------------------------------------------------------------------	
	
	
	// 구구단 + 글자색변경
		@RequestMapping(value = "/board/board99")
		public String board99() throws Exception {
			logger.info("/board/board99");
			return "board/99";
		}

	// -----------------------------------------------------------------------------------------	
		
	// 계산기
		@RequestMapping(value = "/board/calculate")
		public String calculate() throws Exception {
			logger.info("/board/calculate");
			return "board/boardCalculate";
		}
		
	// -----------------------------------------------------------------------------------------------------------
	// 캘린더
	// -----------------------------------------------------------------------------------------------------------		
	
	// 캘린더
	@RequestMapping(value = "/board/calendar")
	public String calendar() throws Exception {
		return "board/calendar";
	}	
		
		
}




