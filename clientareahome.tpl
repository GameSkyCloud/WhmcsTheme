<div class="tiles clearfix">
    <div class="row">
        <div class="client-info row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="info-box" onclick="window.location='clientarea.php?action=services'">
                    <div class="icon blue">
                        <i class="fad fa-server"></i>
                    </div>
                    <div class="content-card">
                        <div class="text">{$LANG.navservices}</div>
                        <div class="number">{$clientsstats.productsnumactive}</div>
                    </div>
                </div>
            </div>
            {if $registerdomainenabled || $transferdomainenabled}
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="info-box" onclick="window.location='clientarea.php?action=domains'">
                    <div class="icon green">
                        <i class="fad fa-globe-europe"></i>
                    </div>
                    <div class="content-card">
                        <div class="text">{$LANG.navdomains}</div>
                        <div class="number">{$clientsstats.numactivedomains}</div>
                    </div>
                </div>
            </div>
            {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="info-box" onclick="window.location='affiliates.php'">
                    <div class="icon red">
                        <i class="fad fa-server"></i>
                    </div>
                    <div class="content-card">
                        <div class="text">{$LANG.affiliatessignups}</div>
                        <div class="number">{$clientsstats.numaffiliatesignups}</div>
                    </div>
                </div>
            </div>
            {else}
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="info-box" onclick="window.location='clientarea.php?action=quotes'">
                    <div class="icon green">
                        <i class="fad fa-print"></i>
                    </div>
                    <div class="content-card">
                        <div class="text">{$LANG.quotes}</div>
                        <div class="number">{$clientsstats.numquotes}</div>
                    </div>
                </div>
            </div>
            {/if}
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="info-box" onclick="window.location='supporttickets.php'">
                    <div class="icon red">
                        <i class="fad fa-user-headset"></i>
                    </div>
                    <div class="content-card">
                        <div class="text">{$LANG.navtickets}</div>
                        <div class="number">{$clientsstats.numactivetickets}</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="info-box" onclick="window.location='clientarea.php?action=invoices'">
                    <div class="icon orange">
                        <i class="fad fa-file-invoice-dollar"></i>
                    </div>
                    <div class="content-card">
                        <div class="text">{$LANG.navinvoices}</div>
                        <div class="number">{$clientsstats.numunpaidinvoices}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form role="form" method="post" action="clientarea.php?action=kbsearch">
    <div class="row">
        <div class="col-md-12 home-kb-search">
            <input type="text" name="search" class="form-control input-lg" placeholder="{$LANG.clientHomeSearchKb}" />
            <i class="fas fa-search"></i>
        </div>
    </div>
</form>

{foreach from=$addons_html item=addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

<div class="client-home-panels">
    <div class="row">
        <div class="col-sm-6">

            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="panel panel-default panel-accent-{$item->getExtra('color')}{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="pull-right">
                                    <a href="{$item->getExtra('btn-link')}" class="btn btn-default bg-color-{$item->getExtra('color')} btn-xs">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                        {$item->getExtra('btn-text')}
                                    </a>
                                </div>
                            {/if}
                            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="panel-body">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                    <div class="panel-footer">
                        {if $item->hasFooterHtml()}
                            {$item->getFooterHtml()}
                        {/if}
                    </div>
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-sm-6">

            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>
