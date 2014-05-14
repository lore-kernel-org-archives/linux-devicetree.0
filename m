From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2 4/4] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Wed, 14 May 2014 15:58:54 +0100
Message-ID: <20140514145853.GE19866@localhost>
References: <1399975839-5311-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1399975839-5311-5-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399975839-5311-5-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 13, 2014 at 11:10:39AM +0100, Thomas Petazzoni wrote:
> --- a/arch/arm/mach-mvebu/board-v7.c
> +++ b/arch/arm/mach-mvebu/board-v7.c
[...]
> +static void __init mvebu_l2x0_pl310_coherent(void)
> +{
> +	struct device_node *np;
> +
> +	if (!coherency_available())
> +		return;
> +
> +	for_each_compatible_node(np, NULL, "arm,pl310-cache") {
> +		struct property *new_compat;
> +
> +		new_compat = kzalloc(sizeof(*new_compat), GFP_KERNEL);
> +		new_compat->name = kstrdup("compatible", GFP_KERNEL);
> +		new_compat->value = kstrdup("arm,pl310-coherent-cache",
> +					    GFP_KERNEL);
> +		new_compat->length = strlen(new_compat->value) + 1;
> +		of_update_property(np, new_compat);
> +	}
> +}

I got it know, you update the DT property on the fly.

> +
>  static void __init mvebu_timer_and_clk_init(void)
>  {
>  	of_clk_init(NULL);
> @@ -78,6 +125,14 @@ static void __init mvebu_timer_and_clk_init(void)
>  	mvebu_scu_enable();
>  	coherency_init();
>  	BUG_ON(mvebu_mbus_dt_init(coherency_available()));
> +
> +	if (of_machine_is_compatible("marvell,armada375") ||
> +	    of_machine_is_compatible("marvell,armada38x")) {
> +		arch_ioremap_caller = armada_pcie_wa_ioremap_caller;
> +		pci_ioremap_set_mem_type(MT_MEMORY_RW_SO);
> +		mvebu_l2x0_pl310_coherent();
> +	}
> +
>  	l2x0_of_init(0, ~0UL);
>  
>  	if (of_machine_is_compatible("marvell,armada375"))

A more "hackish" way would be to simply set outer_cache.sync to NULL
after l2x0_of_init, less code ;) but not nice either. With the .fixup in
Russell's L2C patches you could have added an mvebu specific callback to
check for coherency before setting .sync to NULL.

Anyway, your approach is fine by me but I would prefer a specific
property rather than "compatible".

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
