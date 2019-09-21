package com.site.blog.my.core.common;

import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * @description  
 * @param: null 
 * @return  
 * @author YY
 * @date 2019/9/21/021 
 */
public class Result implements Serializable
{

    private int code;
    private Object obj;
    private String msg;
    private String sessionID;

    public Result()
    {
        this.code = HttpStatus.OK.value();
        this.msg = "success";
    }

    public Result(Object obj)
    {
        this.obj = obj;
        this.code = HttpStatus.OK.value();
        this.msg = "success";
    }

    public Result(int code, String msg)
    {
        this.code = code;
        this.msg = msg;
    }

    public Result(Object obj, int code, String msg, String sessionID)
    {
        this.obj = obj;
        this.code = code;
        this.msg = msg;
        this.sessionID = sessionID;
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

    public Object getObj()
    {
        return obj;
    }

    public void setObj(Object obj)
    {
        this.obj = obj;
    }
}
