Return-Path: <SRS0=5yH4=UC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52136 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCHot (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Jun 2019 03:44:49 -0400
Subject: Re: [PATCH] clk: ti: clkctrl: Fix returning uninitialized data
References: <20190530065557.42741-1-tony@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <8f77a28b-4496-fbfe-f4e2-4cc8043f27d8@ti.com>
Date: Mon, 3 Jun 2019 10:45:07 +0300
MIME-Version: 1.0
In-Reply-To: <20190530065557.42741-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-ID: <devicetree@vger.kernel.org>



On 30/05/2019 9.55, Tony Lindgren wrote:
> If we do a clk_get() for a clock that does not exists, we have
> _ti_omap4_clkctrl_xlate() return uninitialized data if no match
> is found. This can be seen in some cases with SLAB_DEBUG enabled:
> 
> Unable to handle kernel paging request at virtual address 5a5a5a5a
> ...
> clk_hw_create_clk.part.33
> sysc_notifier_call
> notifier_call_chain
> blocking_notifier_call_chain
> device_add
> 
> Let's fix this by setting a found flag only when we find a match.

Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/clk/ti/clkctrl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -229,6 +229,7 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
>  {
>  	struct omap_clkctrl_provider *provider = data;
>  	struct omap_clkctrl_clk *entry;
> +	bool found = false;
>  
>  	if (clkspec->args_count != 2)
>  		return ERR_PTR(-EINVAL);
> @@ -238,11 +239,13 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
>  
>  	list_for_each_entry(entry, &provider->clocks, node) {
>  		if (entry->reg_offset == clkspec->args[0] &&
> -		    entry->bit_offset == clkspec->args[1])
> +		    entry->bit_offset == clkspec->args[1]) {
> +			found = true;
>  			break;
> +		}
>  	}
>  
> -	if (!entry)
> +	if (!found)
>  		return ERR_PTR(-EINVAL);
>  
>  	return entry->clk;
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
