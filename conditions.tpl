{if $thickbox}
	<h3>{l s='Conditions'}</h3>
{else}
	{capture name=path}{l s='Conditions'}{/capture}
	{include file=$tpl_dir./breadcrumb.tpl}
	<h2>{l s='Conditions'}</h2>
{/if}

<p>{l s='[Your conditions]'}</p>

<ul class="shop_info">
	<li>{$conf.PS_SHOP_NAME|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_ADDR1|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_ADDR2|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_CODE|escape:'htmlall':'UTF-8'}&nbsp;{$conf.PS_SHOP_CITY|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_COUNTRY|escape:'htmlall':'UTF-8'}</li>
</ul>
<p>{$conf.PS_SHOP_DETAILS|escape:'htmlall':'UTF-8'}</p>

{if !$thickbox}
	<p><a href="{$base_dir}" title="{l s='Home'}"><img src="{$img_dir}icon/home.gif" alt="{l s='Home'}" class="icon" /></a><a href="{$base_dir}" title="{l s='Home'}">{l s='Home'}</a></p>
{/if}
