<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang_iso}">
	<head>
		<base href="{$protocol}{$smarty.server.HTTP_HOST|escape:'htmlall':'UTF-8'}{$base_dir}" />
		<title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:htmlall:'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:htmlall:'UTF-8'}" />
{/if}
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,follow" />
		<link rel="shortcut icon" href="{$img_dir}favicon.ico" />
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
		<link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
	{/foreach}
{/if}
		<script type="text/javascript" src="{$base_dir}js/tools.js"></script>
		<script type="text/javascript">
			//global JS variable
			var baseDir = '{$base_dir}';
			var static_token = '{$static_token}';
			var token = '{$token}';
		</script>
		<script type="text/javascript" src="{$base_dir}js/jquery/jquery.pack.js"></script>
		<script type="text/javascript" src="{$base_dir}js/jquery/jquery.easing.1.3.js"></script>
{if isset($js_files)}
	{foreach from=$js_files item=js_uri}
		<script type="text/javascript" src="{$js_uri}"></script>
	{/foreach}
{/if}
		{$HOOK_HEADER}
	</head>
	
	<body {if $page_name}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if}>
		<div id="page">

			<!-- Header -->
			<div>
				<h1 id="logo"><a href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}"><img src="{$base_dir}img/logo.jpg" alt="{$shop_name|escape:'htmlall':'UTF-8'}" /></a></h1>
				<div id="header">
					{$HOOK_TOP}
				</div>
			</div>

			<!-- Left -->
			<div id="left_column" class="column">
				{$HOOK_LEFT_COLUMN}
			</div>

			<!-- Center -->
			<div id="center_column">
