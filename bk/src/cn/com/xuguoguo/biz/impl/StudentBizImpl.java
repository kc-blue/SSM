package cn.com.xuguoguo.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.xuguoguo.biz.StudentBiz;
import cn.com.xuguoguo.entity.Items;
import cn.com.xuguoguo.mapper.ItemsDaoMapper;
import cn.com.xuguoguo.mapper.StudentDaoMapper;
@Service
public class StudentBizImpl implements StudentBiz{
	@Autowired
	private StudentDaoMapper studentDaoMapper;
	@Override
	public List<Items> findAll() {
		// TODO Auto-generated method stub
		return studentDaoMapper.findAll();
	}

	@Override
	public void add(Items items) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Items findOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void upd(Items items) {
		// TODO Auto-generated method stub
		
	}

}
