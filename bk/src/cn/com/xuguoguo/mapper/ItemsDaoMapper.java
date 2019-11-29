package cn.com.xuguoguo.mapper;

import java.util.List;

import cn.com.xuguoguo.entity.Items;

public interface ItemsDaoMapper {
	
	public Items findOne(int id);
	
	public List<Items> findAll();
	
	public void add(Items items);
	
	public void upd(Items items);
	
	public void del(int id);
}
