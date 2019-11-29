package cn.com.xuguoguo.inteceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.com.xuguoguo.entity.User;

public class LoginIncetepor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object hander) throws Exception {
		// TODO Auto-generated method stub
		//获取请求的URL地址
		String url=request.getRequestURI();
		if(url.indexOf("/checkLogin.action")>=0){
			return true;
		}
		if(url.indexOf("/register.action")>=0)
		{
			return true;
		}
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user1");
		if(user!=null){
			return true;
		}
		request.getRequestDispatcher("/Login.jsp").forward(request, response);
		return false;
	}

}
