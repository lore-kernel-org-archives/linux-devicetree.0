From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 04/18] AT91: Rework ramc mapping code
Date: Mon, 7 Jul 2014 16:59:51 +0200
Message-ID: <20140707145951.GD3113@piout.net>
References: <1404743131-24569-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404743131-24569-5-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404743131-24569-5-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Boris Brezillon <boris-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/07/2014 at 16:25:17 +0200, Maxime Ripard wrote :
> Adapt the ramc mapping code to handle multiple ram controllers in the DT.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/mach-at91/setup.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 

I believe you also need to update the documentation in
Documentation/devicetree/bindings/arm/atmel-at91.txt

> diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
> index 9c4c7fb323fb..cc520596f23b 100644
> --- a/arch/arm/mach-at91/setup.c
> +++ b/arch/arm/mach-at91/setup.c
> @@ -393,24 +393,26 @@ static void at91_dt_ramc(void)
>  {
>  	struct device_node *np;
>  	const struct of_device_id *of_id;
> +	int idx = 0;
>  
> -	np = of_find_matching_node(NULL, ramc_ids);
> -	if (!np)
> -		panic(pr_fmt("unable to find compatible ram controller node in dtb\n"));
> +	for_each_matching_node(np, ramc_ids) {
> +		at91_ramc_base[idx] = of_iomap(np, 0);
> +		if (!at91_ramc_base[idx])
> +			panic(pr_fmt("unable to map ramc[%d] cpu registers\n"), idx);
>  
> -	at91_ramc_base[0] = of_iomap(np, 0);
> -	if (!at91_ramc_base[0])
> -		panic(pr_fmt("unable to map ramc[0] cpu registers\n"));
> -	/* the controller may have 2 banks */
> -	at91_ramc_base[1] = of_iomap(np, 1);
> +		idx++;
> +	}
> +
> +	if (!idx)
> +		panic(pr_fmt("unable to find compatible ram controller node in dtb\n"));
>  
>  	of_id = of_match_node(ramc_ids, np);
> -	if (!of_id)
> +	if (!of_id) {
>  		pr_warn("ramc no standby function available\n");
> -	else
> -		at91_pm_set_standby(of_id->data);
> +		return;
> +	}
>  
> -	of_node_put(np);
> +	at91_pm_set_standby(of_id->data);
>  }
>  
>  static struct of_device_id shdwc_ids[] = {
> -- 
> 2.0.1
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
