{capture name=path}{l s='Legal'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}

<h2>{l s='Legal'}</h2>

<p>{l s='[Your legals]'}</p>

<ul class="shop_info">
	<li>{$conf.PS_SHOP_NAME|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_ADDR1|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_ADDR2|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_CODE|escape:'htmlall':'UTF-8'}&nbsp;{$conf.PS_SHOP_CITY|escape:'htmlall':'UTF-8'}</li>
	<li>{$conf.PS_SHOP_COUNTRY|escape:'htmlall':'UTF-8'}</li>
</ul>
<h3>{l s='Credits'}</h3>
<p>{l s='Concept and production:'} <a href="http://www.bazyl.org.pl">bAzyl</a></p>
<p>{l s='This Web site was created using'} <a href="http://www.prestashop.com">PrestaShop</a>&trade; {l s='open-source software.'}</p>
<br />
<p><a href="{$base_dir}" title="{l s='Home'}"><img src="{$img_dir}icon/home.gif" alt="{l s='Home'}" class="icon" /></a><a href="{$base_dir}" title="{l s='Home'}">{l s='Home'}</a></p>
