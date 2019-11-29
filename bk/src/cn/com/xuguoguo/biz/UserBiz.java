package cn.com.xuguoguo.biz;

import cn.com.xuguoguo.entity.User;

public interface UserBiz {
	//查询用户名跟密码
		public User CheckLoginAndPwd(String name,String pwd);
		//注册用户
		public void addUser(User user);
}
