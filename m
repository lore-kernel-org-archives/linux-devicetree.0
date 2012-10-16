From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/2] rtc-imxdi: Support for i.MX53
Date: Tue, 16 Oct 2012 22:15:28 +0200
Message-ID: <20121016201528.GW27665@pengutronix.de>
References: <1350399095-2955-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1350399095-2955-1-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: a.zummo@towertech.it, grant.likely@secretlab.ca, rob.herring@calxeda.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 16, 2012 at 04:51:34PM +0200, Roland Stigge wrote:
> This patch enables support for i.MX53 in addition to i.MX25
> 
> Signed-off-by: Roland Stigge <stigge@antcom.de>
> ---
>  drivers/rtc/Kconfig     |    2 +-
>  drivers/rtc/rtc-imxdi.c |   25 ++++++++++++++++---------
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> --- linux-2.6.orig/drivers/rtc/Kconfig
> +++ linux-2.6/drivers/rtc/Kconfig
> @@ -768,7 +768,7 @@ config RTC_DRV_DAVINCI
>  
>  config RTC_DRV_IMXDI
>  	tristate "Freescale IMX DryIce Real Time Clock"
> -	depends on SOC_IMX25
> +	depends on SOC_IMX25 || SOC_IMX53

Please do not add new SoC dependencies. Use ARCH_MXC as a dependency
instead.

> +	/* For IMX53, RTC is available always */
> +	if (cpu_is_mx25()) {
> +		imxdi->clk = clk_get(&pdev->dev, NULL);
> +		if (IS_ERR(imxdi->clk))
> +			return PTR_ERR(imxdi->clk);
> +		clk_prepare_enable(imxdi->clk);
> +	}

No new users of cpu_is_* macros please. Provide a dummy clock
for i.MX53 instead.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
