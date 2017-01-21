From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv4 1/5] clk: mvebu: support for 98DX3236 SoC
Date: Fri, 20 Jan 2017 16:48:19 -0800
Message-ID: <20170121004819.GA8801@codeaurora.org>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170113091222.7132-2-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/13, Chris Packham wrote:
> @@ -158,6 +170,14 @@ static const struct coreclk_soc_desc axp_coreclks = {
>  	.num_ratios = ARRAY_SIZE(axp_coreclk_ratios),
>  };
>  
> +static const struct coreclk_soc_desc mv98dx3236_coreclks = {
> +	.get_tclk_freq = mv98dx3236_get_tclk_freq,
> +	.get_cpu_freq = mv98dx3236_get_cpu_freq,
> +	.get_clk_ratio = NULL,
> +	.ratios = NULL,
> +	.num_ratios = 0,

Are these intentionally initialized to 0 explicitly? Otherwise we
could leave them out and it's all the same.

> +};
> +
>  /*
>   * Clock Gating Control
>   */
[..]
> @@ -243,5 +245,30 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>  	iounmap(clock_complex_base);
>  }
>  
> +/* Use this function to call the generic setup with the correct
> + * clock operation
> + */
> +static void __init of_cpu_clk_setup(struct device_node *node)
> +{
> +	_of_cpu_clk_setup(node, &cpu_ops);
> +}
> +
>  CLK_OF_DECLARE(armada_xp_cpu_clock, "marvell,armada-xp-cpu-clock",
>  					 of_cpu_clk_setup);
> +
> +/* Define the clock and operations for the mv98dx3236 - it cannot perform
> + * any operations.
> + */
> +static const struct clk_ops mv98dx3236_cpu_ops = {
> +	.recalc_rate = NULL,
> +	.round_rate = NULL,
> +	.set_rate = NULL,

But clk_set_rate() works silently? Why not just register a clk
provider that returns a NULL pointer? Then there isn't any
structure to maintain?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
