package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import ${package.Entity}.dto.${entity}AddDTO;
import ${package.Entity}.dto.${entity}EditDTO;
import ${package.Entity}.dto.${entity}PageDTO;
import ${package.Entity}.vo.${entity}DetailVO;
import ${package.Entity}.vo.${entity}PageVO;
import org.springframework.stereotype.Service;
import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {

@Override
public  ${entity}DetailVO detail(Long id) {
 ${entity}DetailVO vo = new  ${entity}DetailVO();
 ${entity} bean = baseMapper.selectById(id);
BeanUtil.copyProperties(bean,vo);
return vo;
}

@Override
public boolean delete(Serializable id) {
return baseMapper.deleteById(id)>0;
}

 @Override
 public boolean deletes(Serializable id ... ) {
<#-- return baseMapper.deleteById(id)>0;-->
 }
@Override
public boolean add( ${entity}AddDTO bean) {
return baseMapper.insert(bean)>0;
}

@Override
public IPage< ${entity}PageVO> page( ${entity}PageDTO request) {
 Page< ${entity}PageVO> page = new Page< ${entity}PageVO>(request.getPageNum(), request.getPageSize());
   List< ${entity}PageVO> result = baseMapper.page(page, request);
    page.setRecords(result);
    return page;
    }

    @Override
    public boolean edit( ${entity}EditDTO bean) {
    return    baseMapper.updateById(bean)>0;
    }
}
</#if>
