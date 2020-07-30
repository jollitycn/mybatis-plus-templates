package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};

import ${package.Entity}.dto.${entity}AddDTO;
import ${package.Entity}.dto.${entity}EditDTO;
import ${package.Entity}.dto.${entity}PageDTO;
import ${package.Entity}.vo.${entity}DetailVO;
import ${package.Entity}.vo.${entity}PageVO;
import java.io.Serializable;
/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {

${entity}DetailVO detail(Serializable id);

boolean delete(Long id);

boolean add(${entity}AddDTO ${entity?uncap_first}}AddDTO);

IPage<${entity}PageVO> page(${entity}PageDTO ${entity?uncap_first}DTO);

 boolean edit(${entity}EditDTO  ${entity?uncap_first}EditDTO);
}
</#if>
