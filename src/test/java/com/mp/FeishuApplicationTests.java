package com.mp;

import com.mp.feishu.domain.User;
import com.mp.feishu.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest
class FeishuApplicationTests {
    @Resource
    private UserMapper mapper;
//    @Test
    void contextLoads() {
        System.out.println(("----- selectAll method test ------"));
        List<User> userList = mapper.selectList(null);
        userList.forEach(System.out::println);
    }

}
