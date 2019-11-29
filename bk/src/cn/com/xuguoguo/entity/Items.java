package cn.com.xuguoguo.entity;

import java.util.Date;
/**
 * 
 * @Title:Items
 * @Description:	商品
 * @author:许锅锅
 * @Date 2018年12月14日 下午6:58:55
 */
public class Items {

	private int id;
	private String name;
	private float price;
	private String detail;
	private String pic;
	private Date createtime;
	@Override
	public String toString() {
		return "Items [id=" + id + ", name=" + name + ", price=" + price
				+ ", detail=" + detail + ", pic=" + pic + ", createtime="
				+ createtime + "]";
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Items(int id, String name, float price, String detail,
			Date createtime) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.detail = detail;
		
		this.createtime = createtime;
	}
	
	public Items(int id, String name, float price, String detail, String pic,
			Date createtime) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.pic = pic;
		this.createtime = createtime;
	}
	public Items() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
