package ${package.Controller};


import com.insigma.ordercenter.base.CodeMsg;
import com.insigma.ordercenter.base.Result;
import com.insigma.ordercenter.controller.BaseController;

import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;

<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
 import ${package.Service}.${table.serviceName};
</#if>

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>
 @Resource
 private ${table.serviceName} ${table.serviceName?uncap_first};

@PostMapping("/page")
@ApiOperation(value = "获取列表", response = ${entity }PageVO.class)
public Result<?> page(@Valid @RequestBody ${entity}PageDTO ${entity?uncap_first}PageDTO) {
 IPage<${entity }PageVO> result = ${table.serviceName?uncap_first}.page( ${entity?uncap_first}PageDTO);
  return Result.success(result);
  }

  @PostMapping("/add")
  @ApiOperation(value = "新增")
  public Result<?> add(@Valid @RequestBody ${entity}AddDTO ${entity?uncap_first}AddDTO) {
  boolean status = ${table.serviceName?uncap_first}.add(${entity?uncap_first}AddDTO, redisUser());

  if (status) {
  return Result.success();
  } else {
  return Result.error(CodeMsg.DATA_INSERT_ERROR);
  }
  }

  @PutMapping("/edit")
  @ApiOperation(value = "编辑")
  public Result<?> edit(@Valid @RequestBody ${entity}EditDTO ${entity?uncap_first}EditDTO) {

  boolean status = ${table.serviceName?uncap_first}.edit(${entity?uncap_first}EditDTO);

  if (status) {
  return Result.success();
  } else {
  return Result.error(CodeMsg.DATA_UPDATE_ERROR);
  }
  }

  @DeleteMapping("/delete/{id}")
  @ApiOperation(value = "删除")
  public Result<?> delete(@PathVariable Long id) {

  boolean status = ${table.serviceName?uncap_first}.delete(id);

  if (status) {
  return Result.success();
  } else {
  return Result.error(CodeMsg.DATA_UPDATE_ERROR);
  }
  }


 @DeleteMapping("/detail/{id}")
 @ApiOperation(value = "详情")
 public Result<?> detail(@Valid @PathVariable Long id) {
 ${entity}DetailVO  result = ${table.serviceName?uncap_first}.detail(id);
  return Result.success(result);
  }
}
</#if>
