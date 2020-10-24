package com.mp.feishu.control;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.mp.feishu.domain.WorkDate;
import com.mp.feishu.mapper.WorkDateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.PostConstruct;
import java.util.Date;

@Slf4j
@RestController
public class TestController {
    @Autowired
    private WorkDateMapper workDateMapper;

    public String test() throws InterruptedException {
        String dateStr = "2020-12-16";
        Date date = DateUtil.parse(dateStr);
        for (int i = 0; i < 500; i++) {
            DateTime newDate2 = DateUtil.offsetDay(date, i);
            WorkDate workDate = new WorkDate();
//        System.out.println(newDate2.dayOfWeek());
//            日 1 六 7
            workDate.setCalDate(newDate2);
            if ((newDate2.dayOfWeek() % 7 == 1) || (newDate2.dayOfWeek() % 7 == 0)) {
                workDate.setWorkFlag(1);
            } else {
                workDate.setWorkFlag(0);
            }
            workDateMapper.insert(workDate);
        }
        return "test demo ";
    }

    public static void testHutoolGet() {
        String getResult = HttpUtil
                .createGet("https://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=15677386236")
                .execute()
                .charset("gbk")
                .body();
        log.info("getResult:" + getResult);
    }

    public static void testHutoolPost(String cameraId) {
        JSONObject jsonObject = JSONUtil.createObj();
        jsonObject.put("cameraId", cameraId);
        jsonObject.put("startTime", DateUtil.now());
        jsonObject.put("callback", "http://www.baidu.com");
        String postResult = HttpRequest
                .post("http://localhost:8080/v1/platedetect/tasks")
                .header("Content-Type", "application/json")
                .body(jsonObject.toString())
                .execute()
                .body();
        log.info("postResult:" + postResult);
    }
}
