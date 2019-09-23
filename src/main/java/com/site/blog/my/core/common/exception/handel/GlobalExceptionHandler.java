package com.site.blog.my.core.common.exception.handel;

import com.site.blog.my.core.common.MyResult;
import com.site.blog.my.core.common.exception.MyException;
import lombok.extern.log4j.Log4j2;
import org.springframework.dao.DeadlockLoserDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author: Wang Chen Chen
 * @Date: 2018/10/29 10:48
 * @describe：
 * @version: 1.0
 */
@Log4j2
@RestControllerAdvice
public class GlobalExceptionHandler
{

    /**
     * 400 - Bad Request
     */
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public MyResult handleHttpMessageNotReadableException(
            HttpMessageNotReadableException e)
    {
        log.error("could_not_read_json...", e.getMessage());
        return new MyResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "JSON 格式错误");
    }

    /**
     * 认证错误
     */
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(AuthenticationException.class)
    public MyResult handleAuthenticationException(
            AuthenticationException e)
    {
        log.error("认证错误", e.getMessage());
        return new MyResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "用户密码错误，请重新输入!");
    }

    /**
     * 400 - Bad Request
     */
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({MethodArgumentNotValidException.class})
    public MyResult handleValidationException(MethodArgumentNotValidException e)
    {
        log.error("parameter_validation_exception...", e);
        return new MyResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "请求类型不支持！");
    }

    /**
     * 405 - Method Not Allowed。HttpRequestMethodNotSupportedException
     * 是ServletException的子类,需要Servlet API支持
     */
//    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public MyResult handleHttpRequestMethodNotSupportedException(
            HttpRequestMethodNotSupportedException e)
    {
        log.error("request_method_not_supported...", e);
        return new MyResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "不被支持的访问方法！");
    }

    /**
     * 415 - Unsupported Media Type。HttpMediaTypeNotSupportedException
     * 是ServletException的子类,需要Servlet API支持
     */
//    @ResponseStatus(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
    @ExceptionHandler({HttpMediaTypeNotSupportedException.class})
    public MyResult handleHttpMediaTypeNotSupportedException(Exception e)
    {
        log.error("content_type_not_supported...", e);
        return new MyResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "不支持的媒体类型！");
    }

    /**
     * 参数绑定异常处理
     * @param e
     * @return
     */
    @ExceptionHandler(BindException.class)
    public MyResult bindExceptionHandler(BindException e){
        List<FieldError> fieldErrors = e.getBindingResult().getFieldErrors();
        //只输出第一个校验异常信息
        String errorMsg = fieldErrors.get(0).getDefaultMessage();
        MyResult resultModel = new MyResult();
        resultModel.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
        resultModel.setMsg(errorMsg);
        return resultModel;
    }

    @ExceptionHandler(value = DeadlockLoserDataAccessException.class)
    public MyResult deadlockLoserDataAccessExceptionHandler(DeadlockLoserDataAccessException e){
        log.error("事务锁异常！" + e);
        MyResult result = new MyResult();
        result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
        result.setMsg("操作频繁，请稍后再试！");
        return result;
    }

    @ExceptionHandler(value = MyException.class)
    public MyResult livegameExceptionExceptionHandler(MyException e){
        log.error(e.getMsg());
        MyResult result = new MyResult();
        result.setCode(e.getCode());
        result.setMsg(e.getMsg());
        return result;
    }

    // 捕捉其他所有异常
    @ExceptionHandler(RuntimeException.class)
    public MyResult exceptionHandler(HttpServletRequest request, Exception e)
    {
        log.error("捕获异常~",e);
        boolean flag = false;
        if("Access is denied".equals(e.getMessage())) {
            flag = true;
        } else if("不允许访问".equals(e.getMessage()))
        {
            flag = true;
        } else if(e.getCause() != null && e.getCause().getMessage().indexOf("org.springframework.security.access.expression.method.MethodSecurityExpressionRoot") != -1)
        {
            flag = true;
        }
        if(flag)
        {
            MyResult result = new MyResult();
            result.setCode(HttpStatus.UNAUTHORIZED.value());
            result.setMsg("没有操作权限");
            return result;
        }
        MyResult result = new MyResult();
        result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
        result.setMsg("系统错误~");
        return result;
    }

    private HttpStatus getStatus(HttpServletRequest request)
    {
        Integer statusCode = (Integer) request.getAttribute("javax.service.error.status_code");
        if (statusCode == null)
        {
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return HttpStatus.valueOf(statusCode);
    }

}
