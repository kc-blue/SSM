package cn.com.xuguoguo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.xuguoguo.biz.UserBiz;
import cn.com.xuguoguo.entity.User;
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserBiz userBiz;
	@RequestMapping(value="/checkLogin",produces = {"application/json;charset=UTF-8" })	 
	public @ResponseBody User checkLogin(@RequestBody User user,Model model,HttpSession session){
		User user1=userBiz.CheckLoginAndPwd(user.getUsername(), user.getPassword());
			session.setAttribute("user1", user1);
			return user1;	
	}
	//注销
	@RequestMapping("/LogOut")
	public String LogOut(HttpSession session){
		session.invalidate();
		return "redirect:/Login.jsp";
	}
	//注册
	@RequestMapping(value="/register",method={RequestMethod.GET,RequestMethod.POST})
	public String register(User user,Model model){
		userBiz.addUser(user);
		model.addAttribute("msg", "注册成功");
		return "success";
	}
}
