From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] ARM: mach-imx: Support for DryIce RTC in i.MX53
Date: Mon, 29 Oct 2012 22:03:16 +0100
Message-ID: <20121029210316.GW1641@pengutronix.de>
References: <1350576370-29098-1-git-send-email-stigge@antcom.de>
 <1350576370-29098-3-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1350576370-29098-3-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: a.zummo@towertech.it, grant.likely@secretlab.ca, rob.herring@calxeda.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2012 at 06:06:10PM +0200, Roland Stigge wrote:
> This patch enables support for i.MX53 in addition to i.MX25 by providing a
> dummy clock on i.MX53 since this one doesn't have a separate clock for internal
> RTC but the driver requests one.
> 
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Applied, thanks

Sascha

> ---
>  arch/arm/mach-imx/clk-imx51-imx53.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-2.6.orig/arch/arm/mach-imx/clk-imx51-imx53.c
> +++ linux-2.6/arch/arm/mach-imx/clk-imx51-imx53.c
> @@ -467,6 +467,7 @@ int __init mx53_clocks_init(unsigned lon
>  	clk_register_clkdev(clk[can1_serial_gate], "per", "53fc8000.can");
>  	clk_register_clkdev(clk[can2_ipg_gate], "ipg", "53fcc000.can");
>  	clk_register_clkdev(clk[can2_serial_gate], "per", "53fcc000.can");
> +	clk_register_clkdev(clk[dummy], NULL, "53fa4000.rtc");
>  
>  	/* set SDHC root clock to 200MHZ*/
>  	clk_set_rate(clk[esdhc_a_podf], 200000000);
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
