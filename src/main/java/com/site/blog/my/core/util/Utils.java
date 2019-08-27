package com.site.blog.my.core.util;

import javax.servlet.http.HttpServletRequest;

public class Utils {

    /**
     * 获取请求IP地址
     *
     * @param request
     * @return
     */
    public static String getIp(HttpServletRequest request)
    {
        //获取IP地址
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
        {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
        {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
        {
            ip = request.getRemoteAddr();
        }
        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip))
        {
            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
            if (ip.indexOf(",") != -1)
            {
                ip = ip.split(",")[0];
            }
        } else
        {
            ip = "未知";
        }
        if ("127.0.0.1".equals(ip) || "0:0:0:0:0:0:0:1".equals(ip))
        {
            ip = "127.0.0.1";
        }
        return ip;
    }
}
