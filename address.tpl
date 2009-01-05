<script type="text/javascript">
	idSelectedCountry = {if isset($smarty.post.id_state)}{$smarty.post.id_state|intval}{else}false{/if};
	countries = new Array();
	{foreach from=$countries item='country'}
	{if isset($country.states)}
	countries[{$country.id_country|intval}] = new Array();
	{foreach from=$country.states item='state' name='states'}
	countries[{$country.id_country|intval}]['{$state.id_state|intval}'] = '{$state.name}';
	{/foreach}
	{/if}
	{/foreach}
</script>

{capture name=path}{l s='Your addresses'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}

<h2>{l s='Your addresses'}</h2>

<h3>{if isset($id_address)}{l s='Modify the address'} "{$smarty.post.alias}"{else}{l s='To add a new address, please fill out the form below.'}{/if}</h3>

{include file=$tpl_dir./errors.tpl}

<form action="{$request_uri}" method="post" class="std">
	<fieldset>
		<h3>{if isset($id_address)}{l s='Your address'}{else}{l s='New address'}{/if}</h3>
		<p>
			<input type="hidden" name="token" value="{$token}" />
			<label for="company">{l s='Company'}</label>
			<input type="text" id="company" name="company" value="{if isset($smarty.post.company)}{$smarty.post.company}{/if}" />
		</p>
		<p class="required">
			<label for="firstname">{l s='First name'}</label>
			<input type="text" name="firstname" id="firstname" value="{if isset($smarty.post.firstname)}{$smarty.post.firstname}{/if}" />
			<sup>*</sup>
		</p>
		<p class="required">
			<label for="lastname">{l s='Last name'}</label>
			<input type="text" id="lastname" name="lastname" value="{if isset($smarty.post.lastname)}{$smarty.post.lastname}{/if}" />
			<sup>*</sup>
		</p>
		<p class="required">
			<label for="address1">{l s='Address'}</label>
			<input type="text" id="address1" name="address1" value="{if isset($smarty.post.address1)}{$smarty.post.address1}{/if}" />
			<sup>*</sup>
		</p>
		<p class="required">
			<label for="address2">{l s='Address (2)'}</label>
			<input type="text" id="address2" name="address2" value="{if isset($smarty.post.address2)}{$smarty.post.address2}{/if}" />
		</p>
		<p class="required">
			<label for="postcode">{l s='Postal code / Zip code'}</label>
			<input type="text" id="postcode" name="postcode" value="{if isset($smarty.post.postcode)}{$smarty.post.postcode}{/if}" />
			<sup>*</sup>
		</p>
		<p class="required">
			<label for="city">{l s='City'}</label>
			<input type="text" name="city" id="city" value="{if isset($smarty.post.city)}{$smarty.post.city}{/if}" maxlength="64" />
			<sup>*</sup>
		</p>
		<p class="required">
			<label for="id_country">{l s='Country'}</label>
			<select id="id_country" name="id_country">{$countries_list}</select>
			<sup>*</sup>
		</p>
		<p class="required id_state">
			<label for="id_state">{l s='State'}</label>
			<select name="id_state" id="id_state">
				<option value="">-</option>
			</select>
			<sup>*</sup>
		</p>
		<p>
			<label for="other">{l s='Additional information'}</label>
			<textarea id="other" name="other" cols="26" rows="3">{if isset($smarty.post.other)}{$smarty.post.other}{/if}</textarea>
		</p>
		<p>
			<label for="phone">{l s='Home phone'}</label>
			<input type="text" id="phone" name="phone" value="{if isset($smarty.post.phone)}{$smarty.post.phone}{/if}" />
		</p>
		<p>
			<label for="phone_mobile">{l s='Mobile phone'}</label>
			<input type="text" id="phone_mobile" name="phone_mobile" value="{if isset($smarty.post.phone_mobile)}{$smarty.post.phone_mobile}{/if}" />
		</p>
		<p class="required">
			<label for="alias">{l s='Assign an address title for future reference'}</label>
			<input type="text" id="alias" name="alias" value="{if isset($smarty.post.alias)}{$smarty.post.alias}{else}{l s='My address'}{/if}" />
			<sup>*</sup>
		</p>
	</fieldset>
		<p class="submit">
			{if isset($id_address)}<input type="hidden" name="a" value="{$id_address|intval}" />{/if}
			{if isset($back)}<input type="hidden" name="back" value="{$back}" />{/if}
			<input type="submit" name="submitAddress" id="submitAddress" value="{l s='Save'}" class="button" />
		</p>
		<p class="required"><sup>*</sup>{l s='Required field'}</p>
</form>
