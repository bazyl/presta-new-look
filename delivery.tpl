{capture name=path}{l s='Shipments and returns'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}

<h2>{l s='Shipments and returns'}</h2>

<h3>{l s='Your pack shipment'}</h3>

<p>{l s='Packages are generally dispatched within 2 days after receipt of payment and are shipped via Colissimo with tracking and drop-off without signature. If you prefer delivery by Colissimo Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make,'} {l s='we will provide you with a link to track your package online.'}</p>
<p>{l s='Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects'}.<br /><br />{l s='Boxes are amply sized and your items are well-protected'}.</p>

<br />
<p><a href="{$base_dir}" title="{l s='Home'}"><img src="{$img_dir}icon/home.gif" alt="{l s='Home'}" class="icon" /></a><a href="{$base_dir}" title="{l s='Home'}">{l s='Home'}</a></p>
