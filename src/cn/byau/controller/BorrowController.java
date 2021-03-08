package cn.byau.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.byau.pojo.Borrow;
import cn.byau.pojo.BorrowKind;

import cn.byau.pojo.LogInfo;
import cn.byau.service.BorrowKindService;
import cn.byau.service.BorrowService;
import cn.byau.util.Result;

/**
 * Created by tjh on 2017/5/13.
 */
@Controller
@RequestMapping("/borrow")
public class BorrowController {

	@Resource(name = "BorrowService")
	private BorrowService borrowService;
	@Resource(name = "borrowKindService")
	private BorrowKindService borrowKindService;

	/**
	 * 跳转到分页显示页面
	 * 
	 * @param pageNum
	 *            为当前页号
	 * @param courseId
	 *            为查询的课程编号
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/listByPage")
	public ModelAndView listByPage(@RequestParam(defaultValue = "1", required = false) Integer pageNo,
			@RequestParam(defaultValue = "5", required = false) Integer pageSize,
			@RequestParam(defaultValue = "", required = false) String borrowId, 
			String bookId,
			HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		Borrow borrow=new Borrow();
		borrow.setBorrowId(borrowId);
		borrow.setBookId(bookId);
		mv.setViewName("/WEB-INF/views/borrow/list.jsp");

		PageHelper.startPage(pageNo, pageSize);
		List<Borrow> borrowList = borrowService.listByPage(borrow);
		PageInfo<Borrow> pageInfo = new PageInfo<Borrow>(borrowList);
		request.setAttribute("pageInfo", pageInfo);

		request.setAttribute("borrowId", borrowId);
		request.setAttribute("bookId", bookId);
		
		List<BorrowKind> borrowKindList = borrowKindService.list();
		request.setAttribute("borrowKindlist", borrowKindList);

		return mv;

	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping("/save")
	@ResponseBody
	public Result save(Borrow borrow) {
		
		Result result = new Result();
		try{
			borrowService.save(borrow);
     		result.setMsg("OK");
		}catch(Exception e){
	        result.setMsg("FAIL"); 		
		}
		return result;
	

	}


	/**
	 * 跳转到更新页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping("/getById")
	@ResponseBody
	public Borrow updatePage(HttpServletRequest request) {
		String borrowId = request.getParameter("borrowId");
		Borrow borrow = borrowService.getById(borrowId);

//		ModelAndView mv = new ModelAndView("/WEB-INF/views/course/update.jsp");
//		mv.addObject("course", course);

//		List<CourseKind> list = courseKindService.list();
//		mv.addObject("list", list);

		return borrow;
	}

	@RequestMapping("/update")
	@ResponseBody
	public Result update(Borrow borrow) {
		Result result = new Result();
		try {
			borrowService.update(borrow);
			result.setMsg("OK");
		} catch (Exception e) {
			result.setMsg("FAIL");
		}
		return result;

	}

	@RequestMapping("/delete")
	@ResponseBody
	public Result delete(String borrowId) {
		Result result = new Result();
		
		try {
			borrowService.delete(borrowId);
			result.setMsg("OK");
		} catch (Exception e) {
			result.setMsg("FAIL");
		}
		return result;
	}

	
}
