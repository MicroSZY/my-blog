package com.site.blog.my.core.entity;

import java.util.Date;

import lombok.Data;

@Data
public class BlogTagRelation {
    private Long relationId;

    private Long blogId;

    private Integer tagId;

    private Date createTime;

}