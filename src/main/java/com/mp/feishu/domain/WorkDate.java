package com.mp.feishu.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * <p>
 * 用户实体对应表 work_date
 * </p>
 *
 * @author hubin
 * @since 2018-08-11
 */
@Data
@TableName("work_date")
@Accessors(chain = true)
public class WorkDate {

    private Long id;
    private Date calDate;
    private Integer workFlag;
}
