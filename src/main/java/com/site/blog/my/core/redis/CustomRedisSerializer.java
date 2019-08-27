package com.site.blog.my.core.redis;

import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.util.Assert;

import java.nio.charset.Charset;

public class CustomRedisSerializer implements RedisSerializer<Object> {
    private final Charset charset;

    public CustomRedisSerializer() {
        this(Charset.forName("UTF8"));
    }

    public CustomRedisSerializer(Charset charset) {
        Assert.notNull(charset);
        this.charset = charset;
    }

    public String deserialize(byte[] bytes) {
        return (bytes == null ? null : new String(bytes, charset));
    }

    public byte[] serialize(Object object) {
        if (object == null) {
            return new byte[0];
        } else if (object instanceof Boolean || object instanceof Character || object instanceof Integer || object instanceof Float
                || object instanceof Double || object instanceof Long || object instanceof String || object instanceof Byte) {
            return String.valueOf(object).getBytes(charset);
        } else {
            return new byte[0];
        }
    }
}
