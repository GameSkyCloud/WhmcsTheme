{if $inactive}

    {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.affiliatesdisabled textcenter=true}

{else}

    <div class="row">

        <div class="col-sm-4">
            <div class="affiliate-stat affiliate-stat-green alert-warning">
                <i class="fas fa-users"></i>
                <span>{$visitors}</span>
                {$LANG.affiliatesclicks}
            </div>
        </div>

        <div class="col-sm-4">
            <div class="affiliate-stat affiliate-stat-green alert-info">
                <i class="fas fa-shopping-cart"></i>
                <span>{$signups}</span>
                {$LANG.affiliatessignups}
            </div>
        </div>

        <div class="col-sm-4">
            <div class="affiliate-stat affiliate-stat-green alert-success">
                <i class="far fa-chart-bar"></i>
                <span>{$conversionrate}%</span>
                {$LANG.affiliatesconversionrate}
            </div>
        </div>

    </div>

    <div class="affiliate-referral-link text-center">

        <h3>{$LANG.affiliatesreferallink}</h3>
        <span>{$referrallink}</span>

    </div>

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h4>{$LANG.affiliatescommissionsavailable}:</h4>
                    <h2><strong>{$balance}</strong></h2><br />
                    <div class="rade-affiliate">
                    	<div class="pull-left">
         					<h4>{$LANG.affiliatescommissionspending}:</h4>
    					</div>
    					<div class="pull-right">
         					<h3 class="text-right" style="margin-top:10px;"><strong>{$pendingcommissions}</strong></h3>
    					</div>
    					<div class="clearfix"></div>
                    </div>
                    <hr />
                    <div class="rade-affiliate">
                    	<div class="pull-left">
         					<h4>{$LANG.affiliateswithdrawn}:</h4>
    					</div>
    					<div class="pull-right">
         					<h3 class="text-right" style="margin-top:10px;"><strong>{$withdrawn}</strong></h3>
    					</div>
    					<div class="clearfix"></div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    {if $withdrawrequestsent}
        <div class="alert alert-success">
            <p>{$LANG.affiliateswithdrawalrequestsuccessful}</p>
        </div>
    {else}
        <p class="text-center">
            <a href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-lg btn-danger"{if !$withdrawlevel} disabled="true"{/if}>
                <i class="fas fa-university"></i> {$LANG.affiliatesrequestwithdrawal}
            </a>
        </p>
        {if !$withdrawlevel}
            <p class="text-muted text-center">{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</p>
        {/if}
    {/if}

    {include file="$template/includes/subheader.tpl" title=$LANG.affiliatesreferals}

    {include file="$template/includes/tablelist.tpl" tableName="AffiliatesList"}
    <script type="text/javascript">
        jQuery(document).ready( function ()
        {
            var table = jQuery('#tableAffiliatesList').removeClass('hidden').DataTable();
            {if $orderby == 'regdate'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'product'}
                table.order(1, '{$sort}');
            {elseif $orderby == 'amount'}
                table.order(2, '{$sort}');
            {elseif $orderby == 'status'}
                table.order(4, '{$sort}');
            {/if}
            table.draw();
            jQuery('#tableLoading').addClass('hidden');
        });
    </script>
    <div class="table-container clearfix">
        <table id="tableAffiliatesList" class="table table-list hidden">
            <thead>
                <tr>
                    <th>{$LANG.affiliatessignupdate}</th>
                    <th>{$LANG.orderproduct}</th>
                    <th>{$LANG.affiliatesamount}</th>
                    <th>{$LANG.affiliatescommission}</th>
                    <th>{$LANG.affiliatesstatus}</th>
                </tr>
            </thead>
            <tbody>
            {foreach from=$referrals item=referral}
                <tr class="text-center">
                    <td><span class="hidden">{$referral.datets}</span>{$referral.date}</td>
                    <td>{$referral.service}</td>
                    <td data-order="{$referral.amountnum}">{$referral.amountdesc}</td>
                    <td data-order="{$referral.commissionnum}">{$referral.commission}</td>
                    <td><span class='label status status-{$referral.rawstatus|strtolower}'>{$referral.status}</span></td>
                </tr>
            {/foreach}
            </tbody>
        </table>
        <div class="text-center" id="tableLoading">
            <p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
        </div>
    </div>

    {if $affiliatelinkscode}
        {include file="$template/includes/subheader.tpl" title=$LANG.affiliateslinktous}
        <div class="margin-bottom text-center">
            {$affiliatelinkscode}
        </div>
    {/if}

{/if}
