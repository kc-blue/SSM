package cn.com.xuguoguo.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.xuguoguo.biz.UserBiz;
import cn.com.xuguoguo.entity.User;
import cn.com.xuguoguo.mapper.UserMapper;
@Service
public class UserBizImpl implements UserBiz {
	@Autowired
	private UserMapper userMapper;
	@Override
	public User CheckLoginAndPwd(String name, String pwd) {
		// TODO Auto-generated method stub
		return userMapper.CheckLoginAndPwd(name, pwd);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}
}
