package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.exception.CustomException;
import com.example.mapper.*;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

/**
 * 商家相关的业务方法
 */
@Service
public class BusinessService {

    @Resource
    private BusinessMapper businessMapper;
    @Resource
    private CollectMapper collectMapper;
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private OrdersMapper ordersMapper;
    @Resource
    private OrdersItemMapper ordersItemMapper;

    /**
     * 检查商家的权限  看看是否可以新增数据
     */
    public void checkBusinessAuth() {
        Account currentUser = TokenUtils.getCurrentUser();  // 获取当前的用户信息
        if (RoleEnum.BUSINESS.name().equals(currentUser.getRole())) {   // 如果是商家 的话
            Business business = selectById(currentUser.getId());
            if (!"通过".equals(business.getStatus())) {   // 未审核通过的商家  不允许添加数据
                throw new CustomException(ResultCodeEnum.NO_AUTH);
            }
        }
    }

    /**
     * 登录
     */
    public Account login(Account account) {
        Account dbBusiness = businessMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbBusiness)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbBusiness.getPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String tokenData = dbBusiness.getId() + "-" + RoleEnum.BUSINESS.name();
        String token = TokenUtils.createToken(tokenData, dbBusiness.getPassword());
        dbBusiness.setToken(token);
        return dbBusiness;
    }

    /**
     * 注册
     */
    public void register(Account account) {
        Business business = new Business();
        BeanUtils.copyProperties(account, business);  // 拷贝 账号和密码2个属性
        if (ObjectUtil.isEmpty(account.getName())) {
            business.setName(business.getUsername());
        }
        this.add(business);  // 添加账户信息
    }

    /**
     * 新增商家
     */
    public void add(Business business) {
        Business dbBusiness = this.selectByUsername(business.getUsername());
        // 如果根据新增数据的账号查询查到了数据  那么这个数据不允许插入，因为账号不能重复
        if (ObjectUtil.isNotEmpty(dbBusiness)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        business.setRole(RoleEnum.BUSINESS.name());
        businessMapper.insert(business);
    }

    /**
     * 单个删除
     */
    public void deleteById(Integer id) {
        businessMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            this.deleteById(id);
        }
    }

    /**
     * 修改商家
     */
    public void updateById(Business business) {
        // 先根据id查询商家是否存在，商家不存在那就返回错误信息
        Business dbBusiness1 = selectById(business.getId());
        if (ObjectUtil.isEmpty(dbBusiness1)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        Business dbBusiness2 = this.selectByUsername(business.getUsername());
        //  根据当前更新的商家的账号查询数据库  如果数据库存在跟当前更新商家一样账号的数据  那么当前的更新是不合法的  数据重复了
        if (ObjectUtil.isNotEmpty(dbBusiness2) && !Objects.equals(dbBusiness2.getId(), business.getId())) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        businessMapper.updateById(business);
    }

    /**
     * 查询所有
     */
    @Transactional
    public List<Business> selectAll(Business business) {
        List<Business> businesses = businessMapper.selectAll(business);
        for (Business b : businesses) {
            List<Comment> commentList = commentMapper.selectByBusinessId(b.getId());
            Double sum = commentList.stream().map(Comment::getStar).reduce(Double::sum).orElse(0D)+5D;
            Double score = BigDecimal.valueOf(sum).divide(BigDecimal.valueOf(commentList.size() + 1), 1, BigDecimal.ROUND_UP).doubleValue();
            b.setScore(score);

            //查出所有完成订单
            List<Orders> ordersList = ordersMapper.selectByBusinessId(b.getId());

            //销售额
            int nums=0;
            for (Orders orders : ordersList) {
                OrdersItem ordersItem = new OrdersItem();
                ordersItem.setOrderId(orders.getId());
                List<OrdersItem> ordersItems = ordersItemMapper.selectAll(ordersItem);
                nums += ordersItems.stream().map(OrdersItem::getNum).reduce(Integer::sum).orElse(0);
            }

            b.setNums(nums);
        }
        return businesses;
    }

    /**
     * 根据账号查询
     */
    public Business selectByUsername(String username) {
        Business params = new Business();
        params.setUsername(username);
        List<Business> list = this.selectAll(params);
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * 根据ID查询
     */
    public Business selectById(Integer id) {
        Business params = new Business();
        params.setId(id);
        List<Business> list = this.selectAll(params);
        Business business = list.isEmpty() ? null : list.get(0);

        if (business != null) {
            Account currentUser = TokenUtils.getCurrentUser();
            Collect collect = new Collect();
            collect.setBusinessId(id);
            collect.setUserId(currentUser.getId());
            List<Collect> collectList = collectMapper.selectAll(collect);
            business.setIsCollect(!collectList.isEmpty());
        }

        return business;
    }

    /**
     * 分页条件查询
     */
    public PageInfo<Business> selectPage(Business business, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Business> list = businessMapper.selectAll(business);
        return PageInfo.of(list);
    }

}