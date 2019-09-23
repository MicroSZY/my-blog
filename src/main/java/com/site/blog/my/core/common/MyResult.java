package com.site.blog.my.core.common;

import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * @description
 * @date 2018/4/8 11:12 create
 */
public class MyResult implements Serializable
{

    private int code;
    private Object obj;
    private String msg;
    private String sessionID;

    public MyResult()
    {
        this.code = HttpStatus.OK.value();
        this.msg = "success";
    }

    public MyResult(Object obj)
    {
        this.obj = obj;
        this.code = HttpStatus.OK.value();
        this.msg = "success";
    }

    public MyResult(int code, String msg)
    {
        this.code = code;
        this.msg = msg;
    }

    public MyResult(Object obj, int code, String msg, String sessionID)
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
