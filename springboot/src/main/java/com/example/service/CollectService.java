package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Business;
import com.example.entity.Collect;
import com.example.mapper.CollectMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 业务处理
 **/
@Service
public class CollectService {

    @Resource
    private CollectMapper collectMapper;
    @Resource
    private BusinessService businessService;

    /**
     * 新增
     */
    public void add(Collect collect) {
        collectMapper.insert(collect);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        collectMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            collectMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Collect collect) {
        collectMapper.updateById(collect);
    }

    /**
     * 根据ID查询
     */
    public Collect selectById(Integer id) {
        return collectMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    @Transactional
    public List<Collect> selectAll(Collect collect) {
        // 拿到当前的登录用户信息
        Account currentUser = TokenUtils.getCurrentUser();
        String role = currentUser.getRole();
        if (RoleEnum.BUSINESS.name().equals(role)) {  // 如果是商家的话   只能查询自己的店铺收藏
            collect.setBusinessId(currentUser.getId());  // 设置商家自己的Id作为查询条件
        }

        return collectMapper.selectAll(collect);
    }

    /**
     * 分页查询
     */
    public PageInfo<Collect> selectPage(Collect collect, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Collect> list = collectMapper.selectAll(collect);
        return PageInfo.of(list);
    }

    public void saveCollect(Collect collect) {
        List<Collect> collectList = this.selectAll(collect);
        if (!collectList.isEmpty()) {  // 说明收藏过了
            this.deleteById(collectList.get(0).getId());  //删除收藏
        } else {
            // 新的收藏
            collect.setTime(DateUtil.now());
            this.add(collect);
        }
    }

    /**
     * 获取当前用户收藏
     */
    public List<Collect> getUserCollect(Integer userId) {
        List<Collect> userCollect = collectMapper.getUserCollect(userId);
        for (Collect collect : userCollect) {
            Business business = businessService.selectById(collect.getBusinessId());
            collect.setBusiness(business);
        }
        return userCollect;
    }
}