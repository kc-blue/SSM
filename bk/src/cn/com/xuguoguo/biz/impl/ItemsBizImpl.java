package cn.com.xuguoguo.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.xuguoguo.biz.ItemsBiz;
import cn.com.xuguoguo.entity.Items;
import cn.com.xuguoguo.mapper.ItemsDaoMapper;
@Service
public class ItemsBizImpl implements ItemsBiz {
	@Autowired
	private ItemsDaoMapper itemsDaoMapper;
	@Override
	public Items findOne(int id) {
		// TODO Auto-generated method stub
		return itemsDaoMapper.findOne(id);
	}

	@Override
	public List<Items> findAll() {
		// TODO Auto-generated method stub
		return itemsDaoMapper.findAll();
	}

	@Override
	public void add(Items items) {
		// TODO Auto-generated method stub
		itemsDaoMapper.add(items);
	}

	@Override
	public void upd(Items items) {
		// TODO Auto-generated method stub
		itemsDaoMapper.upd(items);
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		itemsDaoMapper.del(id);

	}

}
