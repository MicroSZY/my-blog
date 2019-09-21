package com.site.blog.my.core.common;

import com.github.pagehelper.Page;
import lombok.Data;
import org.springframework.http.HttpStatus;

import java.io.Serializable;
import java.util.List;

/**
 * @description  
 * @param: null 
 * @return  
 * @author YY
 * @date 2019/9/21/021 
 */
@Data
public class PageResult<T> implements Serializable
{

    /**
     *
     */
    private static final long serialVersionUID = 2984636422561292981L;

    private int code;
    private String msg;
    private long totalRows = 0;
    private int totalPages = 0;
    private int pageNum = 1;
    private int pageSize = 0;
    private List<T> rows;

    public PageResult()
    {
    }

    /**
     * 构造函数
     *
     * @param list
     */
    public PageResult(List<T> list)
    {
        this.code = HttpStatus.OK.value();
        this.msg = "success!";
        //分页插件的结果集
        if (list instanceof Page)
        {
            Page<T> page = (Page<T>) list;
            this.totalPages = page.getPages();
            this.totalRows = page.getTotal();
            this.pageNum = page.getPageNum();
            this.pageSize = page.getPageSize();
            this.rows = page.getResult();
        } else
        {
            this.rows = list;
        }
    }

    public long getTotalRows()
    {
        return totalRows;
    }

    public void setTotalRows(long totalRows)
    {
        this.totalRows = totalRows;
    }

    public int getTotalPages()
    {
        return totalPages;
    }

    public void setTotalPages(int totalPages)
    {
        this.totalPages = totalPages;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public List<T> getRows()
    {
        return rows;
    }

    public void setRows(List<T> rows)
    {
        this.rows = rows;
    }

}
