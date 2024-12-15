package com.example.service;

import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.OrdersItem;
import com.example.mapper.OrdersItemMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * 订单详情表业务处理
 **/
@Service
public class OrdersItemService {

    @Resource
    private OrdersItemMapper ordersItemMapper;

    /**
     * 新增
     */
    public void add(OrdersItem ordersItem) {
        ordersItemMapper.insert(ordersItem);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        ordersItemMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            ordersItemMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(OrdersItem ordersItem) {
        ordersItemMapper.updateById(ordersItem);
    }

    /**
     * 根据ID查询
     */
    public OrdersItem selectById(Integer id) {
        return ordersItemMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<OrdersItem> selectAll(OrdersItem ordersItem) {
        return ordersItemMapper.selectAll(ordersItem);
    }

    /**
     * 分页查询
     */
    public PageInfo<OrdersItem> selectPage(OrdersItem ordersItem, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<OrdersItem> list = ordersItemMapper.selectAll(ordersItem);
        return PageInfo.of(list);
    }

    /**
     * 根据订单ID删除
     */
    public void deleteByOrderId(Integer OrdersId) {
        ordersItemMapper.deleteByOrderId(OrdersId);
    }
}