package com.site.blog.my.core.entity;

import java.util.Date;

import lombok.Data;

@Data
public class BlogConfig {
    private String configName;

    private String configValue;

    private Date createTime;

    private Date updateTime;

}