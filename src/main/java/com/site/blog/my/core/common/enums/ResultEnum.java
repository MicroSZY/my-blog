package com.site.blog.my.core.common.enums;

/**
 * @Name：ResultEnum
 * @Description：操作结果枚举
 * @Version：V1.0.0
 * @Author：mYunYu
 * @Create Date：2018/12/18 16:05
 */
public enum ResultEnum {

    SYSTEM_ERROR(0000, "系统错误！"),

    ACCESSLOG_ADD_EXCEPTION(1000, "访问日志数据添加异常！"),

    LOGINLOG_ADD_EXCEPTION(2000, "登录日志数据添加异常！"),
    LOGINLOG_UPDATE_EXCEPTION(2010, "登录日志数据更新异常！"),

    USER_LOGIN_EXCEPTION(3000, "用户登录异常！"),
    USER_LOGIN_CREATE_CODE_EXCEPTION(3001, "验证码生成错误！"),
    USER_LOGIN_CODE_EXCEPTION(3001, "验证码错误！"),
    USER_LOGIN_USERNAME_ISNULL_EXCEPTION(3002, "用户名不能为空！"),
    USER_LOGIN_PASSWORD_ISNULL_EXCEPTION(3003, "密码不能为空！"),
    USER_LOGIN_USER_NOT_FIND_EXCEPTION(3004, "用户不存在！"),
    USER_LOGIN_PASSWORD_ERROR_EXCEPTION(3005, "密码不正确！"),
    USER_LOGIN_USER_FREEZE_EXCEPTION(3006, "用户已被冻结,请联系管理员！"),
    USER_LOGIN_USER_TIMEOUT_EXCEPTION(3007, " 登录过期，请重新登录！"),

    USER_LOGIN_TOKEN_ISNULL_EXCEPTION(3002, "token不能为空！"),

    USER_LOGIN_USER_IS_FIND_EXCEPTION(3008, "用户已存在！"),

    USER_BALANCE_MONEY_IS_INSUFFICE_EXCEPTION(3008, "账户余额不足！"),

    PHONE_NUMBER_ISNULL_EXCEPTION(3009, "手机号不能为空！"),
    PHONE_NUMBER_FORMAT_ERROR_EXCEPTION(3010, "手机号格式不正确！"),

    ORDER_REPEAT_DATA_EXCEPTION(3010, "交易单号重复，数据异常！"),

    CACHE_EXCEPTION(4001, "缓存处理异常！"),

    USER_INCOME_MONEY_EXCEPTION(3010, "转入账户余额异常！"),
    USER_INCOME_MONEY_LESS_EXCEPTION(3010, "账户余额不足！"),

//    verifyCode
    VERIFY_CODE_EXCEPTION(4001, "验证码错误！"),

    //手机号不能为空      该手机号格式不正确

    USER_LOGOUT_EXCEPTION(3010, "用户注销失败！"),
    USER_LOGOUT_SUCCESS(3011, "用户注销成功！"),

    USER_LIST_PAGE_EXCEPTION(3020, "分页查询用户数据失败！"),
    USER_LIST_EXCEPTION(3030, "获取用户数据失败！"),
    USER_ADD_EXCEPTION(3040, "用户数据添加异常！"),
    USER_UPDATE_EXCEPTION(3050, "用户数据更新异常！"),
    USER_DELETE_EXCEPTION(3060, "用户数据删除异常！"),
    USER_IS_NULL_EXCEPTION(3061, "用户数据不存在！"),

    USER_RESET_PASSWORD_EXCEPTION(3069, "重置用户密码异常！"),
    USER_PASSWORD_UPDATE_EXCEPTION(3070, "密码更新异常！"),
    USER_PASSWORD_NOT_NULL_EXCEPTION(3071, "用户密码为空！"),
    USER_OLD_PASSWORD_NOT_EQUALS_EXCEPTION(3072, "原密码输入错误！"),
    USER_NEW_PASSWORD_NOT_EQUALS_EXCEPTION(3073, "两次密码输入不一致！"),;


    private Integer code;
    private String message;

    ResultEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
