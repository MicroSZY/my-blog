package com.site.blog.my.core.redis;

import org.springframework.data.redis.core.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RedisService {

    @Resource
    private RedisTemplate<String, String> redisTemplate;

    @Resource(name = "hashObjectOperations")
    private HashOperations<String, Object, String> hashOps;

    @Resource(name = "hashStringOperations")
    private HashOperations<String, String, String> hashEntryOps;

    @Resource
    private SetOperations<String, String> setOps;

    // 对redis字符串类型数据操作
    @Resource
    private ValueOperations<String, String> valueOps;

    @Resource
    private ListOperations<String, String> listOps;
    
    @Resource
    private ZSetOperations<String, String> zsetOps;

    /**
     * 后台ip信息录入
     * @param uid
     * @param ip
     */
    public void setBackUser(String uid,String ip)
    {
        hashOps.put(RedisKey.HBACK_USER,uid,ip);
    }

    /**
     * @description  验证码
     * @param: key
     * @param: value
     * @return void
     * @author YY
     * @date 2019/9/21/021
     */
    public void putStringValue(String key, String value) throws Exception {
        valueOps.set(key, value);
    }

    /**
     * @description  验证码
     * @param: key
     * @return String
     * @author YY
     * @date 2019/9/21/021
     */
    public String getStringValue(String key){
        return valueOps.get(key);
    }
}
