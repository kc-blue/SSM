package cn.com.xuguoguo.entity;

import java.util.Date;
/**
 * 
 * @Title:User
 * @Description: 用户
 * @author:许锅锅
 * @Date 2018年12月14日 下午6:58:46
 */
public class User {
private int id;
private String username;
private String password;
private Date birthday;
private int sex;
private String address;
@Override
public String toString() {
	return "User [id=" + id + ", username=" + username + ", password="
			+ password + ", birthday=" + birthday + ", sex=" + sex
			+ ", address=" + address + "]";
}
public User() {
	super();
	// TODO Auto-generated constructor stub
}
public User(int id, String username, String password, Date birthday, int sex,
		String address) {
	super();
	this.id = id;
	this.username = username;
	this.password = password;
	this.birthday = birthday;
	this.sex = sex;
	this.address = address;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
public int getSex() {
	return sex;
}
public void setSex(int sex) {
	this.sex = sex;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
}
