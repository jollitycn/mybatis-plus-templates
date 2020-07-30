package ${package.Entity}.vo;
import ${package.Entity}.${entity};
<#list table.importPackages as pkg>
    import ${pkg};
</#list>
<#if swagger2>
    import io.swagger.annotations.ApiModel;
    import io.swagger.annotations.ApiModelProperty;
</#if>
<#if entityLombokModel>
    import lombok.Data;
    import lombok.EqualsAndHashCode;
    import lombok.experimental.Accessors;
</#if>
/**
* <p>
    * ${table.comment!}DetailVO
    * </p>
*
* @author ${author}
* @since ${date}
*/
<#if entityLombokModel>
    @Data
    <#if superEntityClass??>
        @EqualsAndHashCode(callSuper = true)
    <#else>
        @EqualsAndHashCode(callSuper = false)
    </#if>
    @Accessors(chain = true)
</#if>
<#if table.convert>
    @TableName("${table.name}")
</#if>
<#if swagger2>
    @ApiModel(value="${entity}DetailVO对象", description="${table.comment!}DetailVO")
</#if>
public class ${entity}DetailVO extends ${entity} {
<#if entitySerialVersionUID>
    private static final long serialVersionUID = 1L;
</#if>
}