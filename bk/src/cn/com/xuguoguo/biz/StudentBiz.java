package cn.com.xuguoguo.biz;

import java.util.List;

import cn.com.xuguoguo.entity.Items;

public interface StudentBiz {

	List<Items> findAll();

	void add(Items items);

	void del(int id);

	Items findOne(int id);

	void upd(Items items);

}
