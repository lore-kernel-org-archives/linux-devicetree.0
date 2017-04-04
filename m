From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2 v2] ARM: i.MX25: globally disable supervisor protect
Date: Tue, 4 Apr 2017 21:14:52 +0800
Message-ID: <20170404131450.GD3394@dragon>
References: <1485890402-22974-1-git-send-email-martin@kaiser.cx>
 <1491248825-23041-1-git-send-email-martin@kaiser.cx>
 <1491248825-23041-2-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1491248825-23041-2-git-send-email-martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 03, 2017 at 09:47:05PM +0200, Martin Kaiser wrote:
> The problem described in 6befda9a272b98bfb1dc772efc3564644cbfb270

This causes the following checkpatch error.

ERROR: Please use git commit description style 'commit <12+ chars of
sha1> ("<title line>")' - ie: 'commit 6befda9a272b ("ARM: i.MX53:
globally disable supervisor protect")'

I fixed it and applied the patch.

Shawn

> for the i.MX53 platform applies to i.MX25 as well.
> 
> E.g. CSPI1+SDMA and SSI1+SDMA are not working with the default AIPS
> configuration. Modifiy the AIPS configuration to allow access to the bus
> by SDMA and peripherals.
> 
> Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
> ---
> v2:
>    rebased against latest linux-next
>    re-sending both patches, it seems they got lost along the way
> 
>  arch/arm/mach-imx/mach-imx25.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/mach-imx/mach-imx25.c b/arch/arm/mach-imx/mach-imx25.c
> index 32dcb5e..353b86e 100644
> --- a/arch/arm/mach-imx/mach-imx25.c
> +++ b/arch/arm/mach-imx/mach-imx25.c
> @@ -23,6 +23,11 @@ static void __init imx25_init_early(void)
>  	mxc_set_cpu_type(MXC_CPU_MX25);
>  }
>  
> +static void __init imx25_dt_init(void)
> +{
> +	imx_aips_allow_unprivileged_access("fsl,imx25-aips");
> +}
> +
>  static void __init mx25_init_irq(void)
>  {
>  	struct device_node *np;
> @@ -41,6 +46,7 @@ static const char * const imx25_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(IMX25_DT, "Freescale i.MX25 (Device Tree Support)")
>  	.init_early	= imx25_init_early,
> +	.init_machine	= imx25_dt_init,
>  	.init_late      = imx25_pm_init,
>  	.init_irq	= mx25_init_irq,
>  	.dt_compat	= imx25_dt_board_compat,
> -- 
> 2.1.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
