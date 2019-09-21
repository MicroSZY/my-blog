package com.site.blog.my.core.common;

import lombok.Data;

/**
 * @description
 * @param: null 
 * @return  
 * @author YY
 * @date 2019/9/21/021 
 */
@Data
public class PageRequest {
    private int pageNum = 1;

    private int pageSize = 10;
}
