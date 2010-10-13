{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{def $base_uri=concat( '/newsletter/register_subscription/', $subscriptionList.url_alias )}

<h1>{'Register subscription'|i18n('ezxnewsletter')}</h1>

{if $warning}
    <div class="message-warning">
        <h2>{$warning|wash}</h2>
    </div>
{/if}

<form name="subscription_list" method="post" action={$base_uri|ezurl}>

    {* FirstName. *}
        <label>{"Firstname"|i18n( 'ezxnewsletter' )}:</label>
        <input class="halfbox" id="subscriptionFirstname" type="text" name="Firstname" value="{cond( is_set( $user ), '', $firstname)|wash}" title="{'Firstname of the subscriber.'|i18n('ezxnewsletter')}"
               {*cond( is_set( $user ), 'readonly="readonly"', '')*} />

    {* Name. *}
        <label>{"Name"|i18n( 'ezxnewsletter' )}:</label>
        <input class="halfbox" id="subscriptionName" type="text" name="Name" value="{cond( is_set( $user ), $user.contentobject.name, $name)|wash}" title="{'Name of the subscriber.'|i18n('ezxnewsletter')}"
               {*cond( is_set( $user ), 'readonly="readonly"', '')*} />

    {* Mobile. *}
        <label>{"Mobile"|i18n( 'ezxnewsletter' )}:</label>
        <input class="halfbox" id="subscriptionMoile" type="text" name="Mobile" value="{cond( is_set( $user ), $user.$mobile, $mobile)|wash}" title="{'Mobile Nr. of the subscriber.'|i18n('ezxnewsletter')}"
               {*cond( is_set( $user ), 'readonly="readonly"', '')*} />

    {* Email. *}
        <label>{"Email"|i18n( 'ezxnewsletter' )}:</label>
        <input class="halfbox" id="subscriptionEmail" type="text" name="Email" value="{cond( is_set( $user ), $user.email, $email)|wash}" title="{'Email of the subscriber.'|i18n('ezxnewsletter')}"
               {*cond( is_set( $user ), 'readonly="readonly"', '')*} />

    {if $subscriptionList.require_password}
        {* Password. *}
            <label>{"Password"|i18n( 'ezxnewsletter' )}:</label>
            <input name="Password1" size="25" type="password" value="password" {*cond( is_set( $user ), 'readonly="readonly"', '' )*} />
            <input name="Password2" size="25" type="password" value="password" {*cond( is_set( $user ), 'readonly="readonly"', '' )*} />
    {/if}
    
    {if $output_map}

            <label>{"Output format"|i18n( 'ezxnewsletter' )}:</label>
            <select name="OutputFormat[]" multiple="multiple" title="{'OutputFormat'|i18n( 'ezxnewsletter' )}"
	    {*cond( is_set( $user ), 'disabled="disabled"', '')*} >
            {foreach $output_map as $value => $out_name}
                <option value="{$value|wash}" {cond( eq($value, 2), 'selected="selected"', '')}>{$out_name|wash}</option>
            {/foreach}
        </select>
    {/if}

<p>
        <input class="button" type="submit" name="StoreButton" value="{'Apply'|i18n( 'ezxnewsletter' )}" title="{'Add to subscription.'|i18n('ezxnewsletter')}" />
        <input class="button" type="submit" name="CancelButton" value="{'Discard'|i18n( 'ezxnewsletter' )}" title="{'Cancel, and discard.'|i18n('ezxnewsletter')}" />
</p>
</form>

<p></p>
<p></p>
<p>
<a href={"services/newsletter"|ezurl}>{'Back to the newsletter overview'|i18n( 'ezxnewsletter' )}</a> 
</p>