package com.example.service;

import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Business;
import com.example.entity.Category;
import com.example.exception.CustomException;
import com.example.mapper.CategoryMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * 商品分类业务处理
 **/
@Service
public class CategoryService {

    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private BusinessService businessService;

    /**
     * 新增
     */
    public void add(Category category) {
        //校验权限
        businessService.checkBusinessAuth();

        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.BUSINESS.name().equals(currentUser.getRole())) {
            category.setBusinessId(currentUser.getId());
        }
        categoryMapper.insert(category);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        //校验权限
        businessService.checkBusinessAuth();
        categoryMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            categoryMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Category category) {
        categoryMapper.updateById(category);
    }

    /**
     * 根据ID查询
     */
    public Category selectById(Integer id) {
        return categoryMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Category> selectAll(Category category) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.BUSINESS.name().equals(currentUser.getRole())) {
            category.setBusinessId(currentUser.getId());
        }
        return categoryMapper.selectAll(category);
    }

    /**
     * 分页查询
     */
    public PageInfo<Category> selectPage(Category category, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Category> list = categoryMapper.selectAll(category);
        return PageInfo.of(list);
    }

}