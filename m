From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v3 04/16] ARM: davinci: Move clock init after ioremap.
Date: Mon, 11 Apr 2016 14:44:49 +0530
Message-ID: <570B6B09.8060907@ti.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-5-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458863503-31121-5-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, David.Laight@ACULAB.COM, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday 25 March 2016 05:21 AM, David Lechner wrote:
> Some clocks (such as the USB PHY clocks in DA8xx) will need to use iomem.
> The davinci_common_init() function must be called before the ioremap, so
> the clock init is now split out as separate function.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v3 changes: This is a new patch. It takes care of the issue of unwanted ioremap
> in clock set_parent functions.
> 
> 
>  arch/arm/mach-davinci/clock.c  | 4 ++--
>  arch/arm/mach-davinci/clock.h  | 7 ++++++-
>  arch/arm/mach-davinci/common.c | 6 ------
>  arch/arm/mach-davinci/da830.c  | 2 ++
>  arch/arm/mach-davinci/da850.c  | 2 ++
>  arch/arm/mach-davinci/dm355.c  | 1 +
>  arch/arm/mach-davinci/dm365.c  | 1 +
>  arch/arm/mach-davinci/dm644x.c | 1 +
>  arch/arm/mach-davinci/dm646x.c | 1 +
>  9 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-davinci/clock.c b/arch/arm/mach-davinci/clock.c
> index 3424eac6..a5c2629 100644
> --- a/arch/arm/mach-davinci/clock.c
> +++ b/arch/arm/mach-davinci/clock.c
> @@ -560,7 +560,7 @@ EXPORT_SYMBOL(davinci_set_pllrate);
>   * than that used by default in <soc>.c file. The reference clock rate
>   * should be updated early in the boot process; ideally soon after the
>   * clock tree has been initialized once with the default reference clock
> - * rate (davinci_common_init()).
> + * rate (davinci_clk_init()).
>   *
>   * Returns 0 on success, error otherwise.
>   */
> @@ -581,7 +581,7 @@ int davinci_set_refclk_rate(unsigned long rate)
>  	return 0;
>  }
>  
> -int __init davinci_clk_init(struct clk_lookup *clocks)
> +int __init _davinci_clk_init(struct clk_lookup *clocks)
>  {
>  	struct clk_lookup *c;
>  	struct clk *clk;
> diff --git a/arch/arm/mach-davinci/clock.h b/arch/arm/mach-davinci/clock.h
> index 1e4e836..8b0fbbe 100644
> --- a/arch/arm/mach-davinci/clock.h
> +++ b/arch/arm/mach-davinci/clock.h
> @@ -124,7 +124,12 @@ struct clk {
>  		.clk = ck,	\
>  	}			\
>  
> -int davinci_clk_init(struct clk_lookup *clocks);
> +int _davinci_clk_init(struct clk_lookup *clocks);
> +static inline void davinci_clk_init(struct davinci_soc_info *soc_info)
> +{
> +	if (soc_info->cpu_clks && _davinci_clk_init(soc_info->cpu_clks))
> +		panic("davinci_clk_init: Failed to init clocks.\n");
> +}

I am not sure about the need for an additional API (_davinci_clk_init)
especially when you end up exposing both through clock.h. Just make make
calls from SoC files like:

	davinci_clk_init(davinci_soc_info_da830.cpu_clks);

I would ignore the panic() call too since davinci_clk_init() does not
really return an error (never has).

Thanks,
Sekhar
