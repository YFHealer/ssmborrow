package cn.byau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.byau.service.BorrowKindService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by tjh on 2017/5/13.
 */
@Controller
@RequestMapping("/borrowKind")
public class BorrowKindController {

	@Resource(name = "borrowKindService")
	private BorrowKindService borrowKindService;
	@RequestMapping("/list")
	public ModelAndView list(HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/WEB-INF/views/borrowkind/list.jsp");
		mv.addObject("list", borrowKindService.list());
		return mv;
	}

	@RequestMapping("/getByKindId")
	public ModelAndView getBykindId(HttpServletRequest request, HttpServletResponse response) {
		String kindId = request.getParameter("kindId");
		System.out.println(kindId);
		ModelAndView mv = new ModelAndView("/WEB-INF/views/borrowkind/getByKindId.jsp");
		mv.addObject("borrowKind", borrowKindService.getByKindId(kindId));
		
		return mv;
	}
}