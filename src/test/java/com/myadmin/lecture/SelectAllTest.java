package com.myadmin.lecture;

import com.myadmin.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectAllTest {

    @Autowired
    LectureService service;

    @Test
    void contextLoads() {

        try {
            service.get();
            log.info("======================================");
            log.info("select All 완료");
            log.info("======================================");
        } catch (Exception e) {
            log.info("lecture select All test error");
            e.printStackTrace();
        }
    }
}
