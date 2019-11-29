package cn.com.xuguoguo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.xuguoguo.biz.ItemsBiz;
import cn.com.xuguoguo.entity.Items;

@Controller
@RequestMapping("/items")
public class ItemsController {
	@Autowired
	private ItemsBiz itemsBiz;
	@RequestMapping("/queryItems")
	public String queryItems(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//引入分页查询插件,pn是第几页，5是每行显示多少页
		PageHelper.startPage(pn, 5);
		//紧跟的查询就是一个分页查询
		List<Items> list=itemsBiz.findAll();
		//使用PageInfo包装查询后的结果,5是连续显示的页数
		PageInfo<Items> pageInfo=new PageInfo<Items>(list,5);
		model.addAttribute("pageInfo", pageInfo);
		return "showItems";
	}
	//添加商品
	@RequestMapping("/addItems")
	public String addItems(Items items,MultipartFile items_pic,HttpServletRequest req) throws IllegalStateException, IOException{
				
				String path=req.getServletContext().getRealPath("upload");
				
				String pic_name=items_pic.getOriginalFilename();
				
				String newname=UUID.randomUUID().toString()+
						pic_name.substring(pic_name.lastIndexOf("."));
				
				File picFile=new File(path,newname);
				if(!picFile.exists()){
					picFile.mkdirs();
				}
				
				items_pic.transferTo(picFile);
				items.setPic(newname);
				itemsBiz.add(items);
				return "redirect:queryItems.action";
	}
	//删除
	@RequestMapping("/del")
	public String del(int id){
		itemsBiz.del(id);
		return "redirect:queryItems.action";
	}
	//查询单个
	@RequestMapping("/findOne")
	public String findOne(Model model,int id){
		Items items=itemsBiz.findOne(id);
		model.addAttribute("items", items);
		return "upd";
	}
	//修改
	@RequestMapping("/upd")
	public String upd(Items items,MultipartFile items_pic1,HttpServletRequest req) throws IllegalStateException, IOException{
		items.setPic(itemsBiz.findOne(items.getId()).getPic());
		String path=req.getServletContext().getRealPath("upload");
		String pic_name=items_pic1.getOriginalFilename();
		if(items_pic1!=null&&pic_name!=null&&pic_name.length()>0){			
			String newname=UUID.randomUUID().toString()+
					pic_name.substring(pic_name.lastIndexOf("."));
			File picFile=new File(path,newname);
			if(!picFile.exists()){
				picFile.mkdirs();
			}
			items_pic1.transferTo(picFile);
			items.setPic(newname);
		}		
		itemsBiz.upd(items);
		return "redirect:queryItems.action";
	}
}
