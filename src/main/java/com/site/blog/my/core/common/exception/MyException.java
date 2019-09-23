package com.site.blog.my.core.common.exception;

import com.site.blog.my.core.common.enums.ResultEnum;
import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * @description
 * @date 2018/4/8 14:12 create
 */
public class MyException extends RuntimeException implements Serializable
{

    private int code;
    private String msg;

    public MyException(String msg)
    {
        super();
        this.code = HttpStatus.INTERNAL_SERVER_ERROR.value();
        this.msg = msg;
    }

    public MyException(ResultEnum msg)
    {
        super();
        this.code = HttpStatus.INTERNAL_SERVER_ERROR.value();
        this.msg = msg.getMessage();
    }

    public MyException(int code, String msg)
    {
        super();
        this.code = code;
        this.msg = msg;
    }

    public MyException(int code, ResultEnum msg)
    {
        super();
        this.code = code;
        this.msg = msg.getMessage();
    }

    public MyException(int common_param_null_error_code, String common_param_null_error, String msg)
    {
        super();
        this.code = common_param_null_error_code;
        this.msg = msg;
    }

    public MyException(int code, String msg, Throwable e)
    {
        super(e);
        this.code = code;
        this.msg = msg;
    }

    public int getCode()
    {
        return code;
    }

    public void setCode(int code)
    {
        this.code = code;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }
}
