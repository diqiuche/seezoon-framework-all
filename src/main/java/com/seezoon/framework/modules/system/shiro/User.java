package com.seezoon.framework.modules.system.shiro;

import java.io.Serializable;
import java.util.Set;

import org.crazycake.shiro.AuthCachePrincipal;

public class User implements Serializable,AuthCachePrincipal{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userId;
	private String deptId;
	private String deptName;
	private String loginName;
	private String name;
	private Set<String> permissions;

	public User(String userId, String deptId, String deptName, String loginName, String name) {
		super();
		this.userId = userId;
		this.deptId = deptId;
		this.deptName = deptName;
		this.loginName = loginName;
		this.name = name;
	}

	public Set<String> getPermissions() {
		return permissions;
	}

	public void setPermissions(Set<String> permissions) {
		this.permissions = permissions;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getAuthCacheKey() {
		return userId;
	}

}
