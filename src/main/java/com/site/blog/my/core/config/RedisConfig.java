package com.site.blog.my.core.config;

import com.site.blog.my.core.redis.CustomRedisSerializer;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettucePoolingClientConfiguration;
import org.springframework.data.redis.core.*;

import java.time.Duration;

/**
 * @ClassName: RedisConfig
 * @Description: redis配置
 * @Author yy
 * @Date 2019/8/26 12:52
 */
@Configuration
public class RedisConfig {

    @Value("${spring.redis.database}")
    private int database;

    @Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.password}")
    private String password;

    @Value("${spring.redis.port}")
    private int port;

    @Value("${spring.redis.timeout}")
    private long timeout;

    @Value("${spring.redis.lettuce.pool.max-idle}")
    private int maxIdle;

    @Value("${spring.redis.lettuce.pool.min-idle}")
    private int minIdle;

    @Value("${spring.redis.lettuce.pool.max-active}")
    private int maxActive;

    @Value("${spring.redis.lettuce.pool.max-wait}")
    private long maxWait;

    /**
     * GenericObjectPoolConfig 连接池配置
     *
     * @return
     */
    @Bean
    public GenericObjectPoolConfig genericObjectPoolConfig()
    {
        GenericObjectPoolConfig genericObjectPoolConfig = new GenericObjectPoolConfig();
        genericObjectPoolConfig.setMaxIdle(maxIdle);
        genericObjectPoolConfig.setMinIdle(minIdle);
        genericObjectPoolConfig.setMaxTotal(maxActive);
        genericObjectPoolConfig.setMaxWaitMillis(maxWait);
        return genericObjectPoolConfig;
    }

    @Bean
    LettuceConnectionFactory lettuceConnectionFactory(GenericObjectPoolConfig genericObjectPoolConfig)
    {
        // 单机版配置
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration();
        redisStandaloneConfiguration.setDatabase(database);
        redisStandaloneConfiguration.setHostName(host);
        redisStandaloneConfiguration.setPort(port);
        redisStandaloneConfiguration.setPassword(password);

        // 集群版配置
//        RedisClusterConfiguration redisClusterConfiguration = new RedisClusterConfiguration();
//        String[] serverArray = clusterNodes.split(",");
//        Set<RedisNode> nodes = new HashSet<RedisNode>();
//        for (String ipPort : serverArray) {
//            String[] ipAndPort = ipPort.split(":");
//            nodes.add(new RedisNode(ipAndPort[0].trim(), Integer.valueOf(ipAndPort[1])));
//        }
//        redisClusterConfiguration.setPassword(RedisPassword.of(password));
//        redisClusterConfiguration.setClusterNodes(nodes);
//        redisClusterConfiguration.setMaxRedirects(maxRedirects);
        LettuceClientConfiguration clientConfig = LettucePoolingClientConfiguration.builder()
                .commandTimeout(Duration.ofMillis(timeout))
                .poolConfig(genericObjectPoolConfig)
                .build();
        LettuceConnectionFactory factory = new LettuceConnectionFactory(redisStandaloneConfiguration, clientConfig);
        return factory;
    }

    @Bean
    public RedisTemplate<String, Object> redisTemplate(LettuceConnectionFactory lettuceConnectionFactory)
    {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(lettuceConnectionFactory);
        template.setDefaultSerializer(new CustomRedisSerializer());
        return template;
    }

    /**
     * 对hash类型的数据操作
     *
     * @param redisTemplate
     * @return
     */
    @Bean
    public HashOperations<String, String, String> hashStringOperations(RedisTemplate<String, String> redisTemplate)
    {
        return redisTemplate.opsForHash();
    }

    /**
     * 对hash类型的数据操作
     *
     * @param redisTemplate
     * @return
     */
    @Bean
    public HashOperations<String, Object, String> hashObjectOperations(RedisTemplate<String, Object> redisTemplate)
    {
        return redisTemplate.opsForHash();
    }

    /**
     * 对redis字符串类型数据操作
     *
     * @param redisTemplate
     * @return
     */
    @Bean
    public ValueOperations<String, String> valueOperations(RedisTemplate<String, String> redisTemplate)
    {
        return redisTemplate.opsForValue();
    }

    /**
     * 对链表类型的数据操作
     *
     * @param redisTemplate
     * @return
     */
    @Bean
    public ListOperations<String, String> listOperations(RedisTemplate<String, String> redisTemplate)
    {
        return redisTemplate.opsForList();
    }

    /**
     * 对无序集合类型的数据操作
     *
     * @param redisTemplate
     * @return
     */
    @Bean
    public SetOperations<String, String> setOperations(RedisTemplate<String, String> redisTemplate)
    {
        return redisTemplate.opsForSet();
    }

    /**
     * 对有序集合类型的数据操作
     *
     * @param redisTemplate
     * @return
     */
    @Bean
    public ZSetOperations<String, String> zSetOperations(RedisTemplate<String, String> redisTemplate)
    {
        return redisTemplate.opsForZSet();
    }

}
