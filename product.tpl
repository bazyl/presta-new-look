{include file=$tpl_dir./errors.tpl}
{if $errors|@count == 0}
<script type="text/javascript">
// <![CDATA[

// PrestaShop internal settings
var currencySign = '{$currencySign|html_entity_decode:2:"UTF-8"}';
var currencyRate = '{$currencyRate|floatval}';
var currencyFormat = '{$currencyFormat|intval}';
var taxRate = {$product->tax_rate|floatval};

// Parameters
var id_product = '{$product->id|intval}';
var productHasAttributes = {if isset($groups)}true{else}false{/if};
var quantitiesDisplayAllowed = {if $display_qties == 1}true{else}false{/if};
var quantityAvailable = {if $display_qties == 1 && $product->quantity}{$product->quantity}{else}0{/if};
var allowBuyWhenOutOfStock = {if $allow_oosp == 1}true{else}false{/if};
var availabilityValue = '{$product->availability|escape:'quotes':'UTF-8'}';
var productPriceWithoutReduction = {$product->getPriceWithoutReduct()|default:'null'};
var reduction_percent = {$product->reduction_percent};
var reduction_price = {if $product->reduction_percent}0{else}{$product->getPrice(true, NULL, 2, NULL, true)}{/if};
var reduction_from = '{$product->reduction_from}';
var reduction_to = '{$product->reduction_to}';
var default_eco_tax = {$product->ecotax};
var currentDate = '{$smarty.now|date_format:'%Y-%m-%d'}';
var maxQuantityToAllowDisplayOfLastQuantityMessage = {$last_qties};
var noTaxForThisProduct = {if $no_tax == 1}true{else}false{/if};

// Translations
var doesntExist = '{l s='The product does not exist in this model. Please choose another.' js=1}';
var doesntExistNoMore = '{l s='This product is no longer in stock' js=1}';
var doesntExistNoMoreBut = '{l s='with those attributes but is available with others' js=1}';


{if isset($groups)}
	// Combinations
	{foreach from=$combinations key=idCombination item=combination}
		addCombination({$idCombination|intval}, new Array({$combination.list}), {$combination.quantity}, {$combination.price}, {$combination.ecotax}, {$combination.id_image});
	{/foreach}
	// Colors
	{if $colors|@count > 0}
		{if $product->id_color_default}var id_color_default = {$product->id_color_default|intval};{/if}
	{/if}
{/if}

//]]>
</script>

{include file=$tpl_dir./breadcrumb.tpl}

<div id="primary_block">

	<h2>{$product->name|escape:'htmlall':'UTF-8'}</h2>

	<!-- right infos-->
	<div id="pb-right-column">
		<!-- product img-->
		<div id="image-block">
		{if $have_image}
				<img src="{$img_prod_dir}{$cover.id_image}-large.jpg" alt="" id="bigpic" title="{$product->name|escape:'htmlall':'UTF-8'}"/>
		{else}
			<img src="{$img_prod_dir}{$lang_iso}-default-large.jpg" alt="" title="{$product->name|escape:'htmlall':'UTF-8'}" />
		{/if}
		</div>

		{if count($images) > 0}
		<!-- thumbnails -->
		<div id="views_block" {if count($images) < 2}class="hidden"{/if}>
		{if count($images) > 3}<a id="view_scroll_left" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">{l s='Next'}</a>{/if}
		<div id="thumbs_list">
			<ul style="width: {math equation="width * nbImages" width=82 nbImages=$images|@count}px">
				{foreach from=$images item=image name=thumbnails}
				<li>
					<a href="{$img_prod_dir}{$product->id}-{$image.id_image}-thickbox.jpg" rel="other-views" class="thickbox {if $smarty.foreach.thumbnails.first}shown{/if}">
						<img id="thumb_{$image.id_image}" src="{$img_prod_dir}{$product->id}-{$image.id_image}-medium.jpg" alt="{$image.legend|htmlspecialchars}" title="{$image.legend|htmlspecialchars}" />
					</a>
				</li>
				{/foreach}
			</ul>
		</div>
		{if count($images) > 3}<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">{l s='Next'}</a>{/if}
		</div>
		{/if}
	</div>

	<!-- left infos-->
	<div id="pb-left-column">
		{if $product->description_short}
		<div id="short_description_block">
			<div id="short_description_content" class="rte">{$product->description_short}</div>
			{if $product->description}
			<p class="buttons_bottom_block"><a href="javascript:{ldelim}{rdelim}" class="button">{l s='More details'}</a></p>
			{/if}
		</div>
		{/if}

		{if $colors}
		<!-- colors -->
		<div id="color_picker">
			<p>{l s='Pick a color:' js=1}</p>
			{foreach from=$colors key='id_attribute' item='color'}
				<a id="color_{$id_attribute|intval}" class="color_pick" style="background: {$color.value};" onclick="updateColorSelect({$id_attribute|intval});">{if file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}<img src="{$img_col_dir}{$id_attribute}.jpg" alt="" title="{$color.name}" />{/if}</a>
			{/foreach}
			<div class="clear"></div>
		</div>
		{/if}

		<!-- add to cart form-->
		<form id="buy_block" action="{$base_dir}cart.php" method="post">

			<!-- hidden datas -->
			<p class="hidden">
				<input type="hidden" name="token" value="{$token}" />
				<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
				<input type="hidden" name="add" value="1" />
				<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
			</p>

			<!-- prices -->
			<p class="price">
				{if $product->on_sale}
					<img src="{$img_dir}onsale_{$lang_iso}.gif" class="on_sale_img"/>
					<span class="on_sale">{l s='On sale!'}</span>
				{elseif ($product->reduction_price != 0 || $product->reduction_percent != 0) && ($product->reduction_from == $product->reduction_to OR ($smarty.now|date_format:'%Y-%m-%d' <= $product->reduction_to && $smarty.now|date_format:'%Y-%m-%d' >= $product->reduction_from))}
					<span class="discount">{l s='Price lowered!'}</span>
				{/if}
				<br />
				<span class="our_price_display"><span id="our_price_display">{convertPrice price=$product->getPrice(true, NULL, 2)}</span> {if $product->getPrice(true, NULL, 2) != $product->getPrice(false, NULL, 2)}{l s='incl. tax'}{/if}</span>
				<br />
				{if $displayPreTax AND $display_ht AND $product->id_tax}
				<br />
				<span id="pretaxe_price">{l s='('}<span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, NULL, 2)}</span> {l s='tax not incl.)'}</span>
				{/if}
			</p>
			{if ($product->reduction_price != 0 || $product->reduction_percent != 0) && ($product->reduction_from == $product->reduction_to OR ($smarty.now|date_format:'%Y-%m-%d' <= $product->reduction_to && $smarty.now|date_format:'%Y-%m-%d' >= $product->reduction_from))}
				<p id="old_price"><span class="bold"><span id="old_price_display">{convertPrice price=$product->getPriceWithoutReduct()}</span> {l s='incl. tax'}</span></p>
			{/if}
			{if $product->reduction_percent != 0 && ($product->reduction_from == $product->reduction_to OR ($smarty.now|date_format:'%Y-%m-%d' <= $product->reduction_to && $smarty.now|date_format:'%Y-%m-%d' >= $product->reduction_from))}
				<p id="reduction_percent">{l s='(price reduced by'} <span id="reduction_percent_display">{$product->reduction_percent|floatval}</span> %{l s=')'}</p>
			{/if}
			{if $product->ecotax != 0}
				<p class="price-ecotax">{l s='include'} <span id="ecotax_price_display">{convertPrice price=$product->ecotax}</span> {l s='for green tax'}</p>
			{/if}

			{if isset($groups)}

			<!-- attributes -->
			<div id="attributes">
			{foreach from=$groups key=id_attribute_group item=group}
			<p>
				<label for="group_{$id_attribute_group|intval}">{$group.name|escape:'htmlall':'UTF-8'} :</label>
				<select name="group_{$id_attribute_group|intval}" id="group_{$id_attribute_group|intval}" onchange="javascript:findCombination();">
					{foreach from=$group.attributes key=id_attribute item=group_attribute}
						<option value="{$id_attribute|intval}"{if $group.default==$id_attribute} selected="selected"{/if}>{$group_attribute|escape:'htmlall':'UTF-8'}</option>
					{/foreach}
				</select>
			</p>
			{/foreach}
			</div>
			{/if}

			<!-- quantity wanted -->
			<p id="quantity_wanted_p"{if !$allow_oosp && $product->quantity == 0} style="display:none;"{/if}><label>{l s='Quantity :'}</label> <input type="text" name="qty" id="quantity_wanted" class="text" value="1" size="2" maxlength="3" /></p>

			<!-- availability -->
			<p id="availability_statut"{if ($allow_oosp && $product->quantity == 0) || (!$product->availability && $display_qties != 1) } style="display:none;"{/if}>
				<span id="availability_label">{l s='Availability:'}</span>
				<span id="availability_value"{if $product->quantity == 0} class="warning-inline"{/if}>
					{if $product->quantity == 0}{l s='This product is no longer in stock'}{else}{$product->availability}{/if}
				</span>
			</p>

			<!-- number of item in stock -->
			<p id="pQuantityAvailable"{if $display_qties != 1 || ($allow_oosp && $product->quantity == 0)} style="display:none;"{/if}>
				<span id="quantityAvailable">{$product->quantity|intval}</span>
				<span{if $product->quantity > 1} style="display:none;"{/if} id="quantityAvailableTxt">{l s='item in stock'}</span>
				<span{if $product->quantity < 2} style="display:none;"{/if} id="quantityAvailableTxtMultiple">{l s='items in stock'}</span>
			</p>

			<p class="warning-inline" id="last_quantities"{if ($product->quantity > $last_qties || $product->quantity == 0) || $allow_oosp} style="display:none;"{/if} >{l s='Warning: Last items in stock!'}</p>

			<p{if !$allow_oosp && $product->quantity == 0} style="display:none;"{/if} id="add_to_cart" class="buttons_bottom_block"><input type="submit" name="Submit" value="{l s='Add to cart'}" class="exclusive" /></p>
		</form>

		<!-- usefull links-->
		<ul id="usefull_link_block">
{if $HOOK_EXTRA}
			{$HOOK_EXTRA}
{/if}
			<li><a href="javascript:print();">{l s='Print'}</a></li>
			{if $have_image}
			<li><span id="view_full_size" class="span_link">{l s='View full size'}</span></li>
			{/if}
		</ul>
			<br /><br /><big><big>{l s='Maker'} : <strong><a href="http://dzianamafia.pl/{$product->id_manufacturer}_{$product->maker}">{$product->maker}</a></strong></big></big>
	</div>
</div>
<br class="clear" />

{if $quantity_discounts}
<!-- quantity discount -->
<ul class="idTabs">
	<li><a href="#idTab3">{l s='Quantity discount'}</a></li>
</ul>
<table class="std">
<tbody>
<tr>
	<td>
	{l s='from'} 0 {l s='to'} {assign var=tmp value="`$quantity_discounts[0].quantity`"} {math equation="$tmp - 1"}
	</td>
{foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
	<td>
	{if !$smarty.foreach.quantity_discounts.last}
		{l s='from'}
		{$quantity_discount.quantity|intval}
		{l s='to'}
		{assign var=tmp value="`$quantity_discounts[$smarty.foreach.quantity_discounts.iteration].quantity`"} {math equation="$tmp - 1"}
	{else}
		{$quantity_discount.quantity|intval} {l s='and more'}
	{/if}
	</td>
{/foreach}

</tr>
<tr>
	<td><span class="price">{convertPrice price=$product->getPrice(true, NULL, 2)}</span></td>
	{foreach from=$quantity_discounts item='quantity_discount'}
	<td><span class="price">{convertPrice price=$quantity_discount.price}</span></td>
	{/foreach}
</tr>
</tbody>
</table>
{/if}

{$HOOK_PRODUCT_FOOTER}

<!-- description and features -->
{if $product->description || $features}
<div id="more_info_block" class="clear">
	<ul id="more_info_tabs" class="idTabs">
		{if $product->description}<li><a id="more_info_tab_more_info" href="#idTab1">{l s='More info'}</a></li>{/if}
		{if $features}<li><a id="more_info_tab_data_sheet" href="#idTab2">{l s='Data sheet'}</a></li>{/if}
		{$HOOK_PRODUCT_TAB}
	</ul>
	<div id="more_info_sheets" class="sheets">
	{if $product->description}
		<!-- full description -->
		<div id="idTab1" class="rte">{$product->description}</div>
	{/if}
	{if $features}
		<!-- product's features -->
		<ul id="idTab2" class="bullet">
		{foreach from=$features item=feature}
			<li><span>{$feature.name|escape:'htmlall':'UTF-8'}</span>{l s=':'} {$feature.value|escape:'htmlall':'UTF-8'}</li>
		{/foreach}
		</ul>
	{/if}
	{$HOOK_PRODUCT_TAB_CONTENT}
	</div>
</div>
{/if}

{if isset($accessories) AND $accessories}
<!-- accessories -->
<ul class="idTabs">
	<li><a href="#idTab3">{l s='Accessories'}</a></li>
</ul>
<div class="block products_block accessories_block">
	<div class="block_content">
		<ul>
		{foreach from=$accessories item=accessory name=accessories_list}
			{assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite)}
			<li class="ajax_block_product {if $smarty.foreach.accessories_list.first}first_item{elseif $smarty.foreach.accessories_list.last}last_item{else}item{/if}">
				<h5><a href="{$accessoryLink|escape:'htmlall':'UTF-8'}">{$accessory.name|truncate:28|escape:'htmlall':'UTF-8'}</a></h5>
				<p class="product_desc">
					<a href="{$accessoryLink|escape:'htmlall':'UTF-8'}" title="{$accessory.legend|escape:'htmlall':'UTF-8'}" class="product_image"><img src="{$img_prod_dir}{$accessory.id_image}-medium.jpg" alt="{$accessory.legend|escape:'htmlall':'UTF-8'}" /></a>
					<a href="{$accessoryLink|escape:'htmlall':'UTF-8'}" title="{l s='More'}">{$accessory.description_short|truncate:100}</a>
				</p>
				<p>
					<span class="price">{displayWtPrice p=$accessory.price}</span>
					<a class="button" href="{$accessoryLink|escape:'htmlall':'UTF-8'}" title="{l s='View'}">{l s='View'}</a>
					<a class="button ajax_add_to_cart_button" href="{$base_dir}cart.php?qty=1&amp;id_product={$accessory.id_product|intval}&amp;add" rel="ajax_id_product_{$accessory.id_product|intval}" title="{l s='Add to cart'}">{l s='Add to cart'}</a>
				</p>
			</li>
		{/foreach}
		</ul>
		<div class="clear"></div>
	</div>
</div>
{/if}
{/if}
