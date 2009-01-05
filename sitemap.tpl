{capture name=path}{l s='Sitemap'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}

<h2>{l s='Sitemap'}</h2>
<div id="sitemap_content">
	<div class="sitemap_block">
		<h3>{l s='Information'}</h3>
		<ul>
			<li><a href="{$base_dir}delivery.php">{l s='Shipping'}</a></li>
			<li><a href="{$base_dir}mentions.php">{l s='Legal notice'}</a></li>
			<li><a href="{$base_dir}conditions.php">{l s='Conditions'}</a></li>
			<li><a href="{$base_dir}secure-payment.php">{l s='Secure payment'}</a></li>
			<li><a href="{$base_dir}contact-form.php">{l s='Contact'}</a></li>
			<li><a href="{$base_dir}about-us.php">{l s='About us'}</a></li>
		</ul>
	</div>
	<div class="sitemap_block">
		<h3>{l s='Our offers'}</h3>
		<ul>
			<li><a href="{$base_dir}new-products.php">{l s='New products'}</a></li>
			<li><a href="{$base_dir}best-sales.php">{l s='Top sellers'}</a></li>
			<li><a href="{$base_dir}prices-drop.php">{l s='Specials'}</a></li>
			<li><a href="{$base_dir}manufacturer.php">{l s='Manufacturers'}</a></li>
			<li><a href="{$base_dir}supplier.php">{l s='Suppliers'}</a></li>
		</ul>
	</div>
	<div class="sitemap_block">
		<h3>{l s='Your Account'}</h3>
		<ul>
			<li><a href="{$base_dir_ssl}my-account.php">{l s='Your Account'}</a></li>
			<li><a href="{$base_dir_ssl}identity.php">{l s='Personal information'}</a></li>
			<li><a href="{$base_dir_ssl}addresses.php">{l s='Addresses'}</a></li>
			{if $voucherAllowed}<li><a href="{$base_dir_ssl}discount.php">{l s='Discount'}</a></li>{/if}
			<li><a href="{$base_dir_ssl}history.php">{l s='Orders history'}</a></li>
		</ul>
	</div>
	<br class="clear" />
</div>
<div class="categTree">
	<h3>{l s='Categories'}</h3>
	<div class="tree_top"><a href="{$base_dir_ssl}">{$categoriesTree.name|escape:'htmlall':'UTF-8'}</a></div>
	<ul class="tree">
	{foreach from=$categoriesTree.children item=child name=sitemapTree}
		{if $smarty.foreach.sitemapTree.last}
			{include file=$tpl_dir./category-tree-branch.tpl node=$child last='true'}
		{else}
			{include file=$tpl_dir./category-tree-branch.tpl node=$child}
		{/if}
	{/foreach}
	</ul>
</div>