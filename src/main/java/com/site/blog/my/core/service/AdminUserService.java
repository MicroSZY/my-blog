package com.site.blog.my.core.service;

import com.site.blog.my.core.entity.AdminUser;

import javax.servlet.http.HttpServletRequest;

public interface AdminUserService {

    AdminUser login(String userName, String password);

    /**
     * 获取用户信息
     *
     * @param loginUserId
     * @return
     */
    AdminUser getUserDetailById(Integer loginUserId);

    /**
     * 修改当前登录用户的密码
     *
     * @param loginUserId
     * @param originalPassword
     * @param newPassword
     * @return
     */
    Boolean updatePassword(Integer loginUserId, String originalPassword, String newPassword);

    /**
     * 修改当前登录用户的名称信息
     *
     * @param loginUserId
     * @param loginUserName
     * @param nickName
     * @return
     */
    Boolean updateName(Integer loginUserId, String loginUserName, String nickName);

    /**
     * @description  获取token
     * @param: adminUser 
     * @param: request
     * @return java.lang.String 
     * @author YY
     * @date 2019/9/23/023 
     */
    //String getToken(AdminUser adminUser, HttpServletRequest request);

}
