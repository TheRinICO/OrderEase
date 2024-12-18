package com.example.mapper;

import com.example.entity.OrdersItem;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作orders_item相关数据接口
 */
public interface OrdersItemMapper {

    /**
     * 新增
     */
    int insert(OrdersItem ordersItem);

    /**
     * 删除
     */
    int deleteById(Integer id);

    /**
     * 修改
     */
    int updateById(OrdersItem ordersItem);

    /**
     * 根据ID查询
     */
    OrdersItem selectById(Integer id);

    /**
     * 查询所有
     */
    List<OrdersItem> selectAll(OrdersItem ordersItem);

    @Delete("DELETE FROM orders_item WHERE order_id = #{id}")
    void deleteByOrderId(Integer OrdersId);
}