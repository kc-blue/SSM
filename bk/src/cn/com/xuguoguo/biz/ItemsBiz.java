package cn.com.xuguoguo.biz;

import java.util.List;

import cn.com.xuguoguo.entity.Items;
/**
 * 
 * @ClassName:ItemsBiz
 * @Description:
 * @author:许锅锅
 * @Date 2018年12月10日 下午9:25:10
 */
public interface ItemsBiz {
	public Items findOne(int id);
	
	public List<Items> findAll();
	
	public void add(Items items);
	
	public void upd(Items items);
	
	public void del(int id);
}
