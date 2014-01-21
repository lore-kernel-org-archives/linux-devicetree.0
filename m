From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 11/15] watchdog: orion: Add support for Armada 370 and
 Armada XP SoC
Date: Tue, 21 Jan 2014 08:41:15 -0800
Message-ID: <20140121164115.GC3311@roeck-us.net>
References: <1390310774-20781-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390310774-20781-12-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390310774-20781-12-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 10:26:10AM -0300, Ezequiel Garcia wrote:
> Using the added infrastructure for handling SoC differences,
> this commit adds support for the watchdog controller available
> in Armada 370 and Armada XP SoCs.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/watchdog/orion_wdt.c | 93 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index c2beb9f..a5e157c 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -30,6 +30,7 @@
>   * Watchdog timer block registers.
>   */
>  #define TIMER_CTRL		0x0000
> +#define TIMER_A370_STATUS	0x04
>  
>  #define WDT_MAX_CYCLE_COUNT	0xffffffff
>  #define WDT_IN_USE		0
> @@ -41,6 +42,12 @@
>  
>  #define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
>  
> +#define WDT_A370_RATIO_MASK(v)	((v) << 16)
> +#define WDT_A370_RATIO_SHIFT	5
> +#define WDT_A370_RATIO		(1 << WDT_A370_RATIO_SHIFT)
> +

Are those introduced twice ? I seem to recall seeing those defines in patch 8.

> +#define WDT_A370_EXPIRED	BIT(31)
> +
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  static int heartbeat = -1;		/* module parameter (seconds) */
>  
> @@ -80,6 +87,48 @@ static int orion_wdt_clock_init(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int armada370_wdt_clock_init(struct platform_device *pdev,
> +				    struct orion_watchdog *dev)
> +{
> +	int ret;
> +
> +	dev->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(dev->clk))
> +		return PTR_ERR(dev->clk);
> +	ret = clk_prepare_enable(dev->clk);
> +	if (ret)
> +		return ret;
> +
> +	/* Setup watchdog input clock */
> +	atomic_io_modify(dev->reg + TIMER_CTRL,
> +			WDT_A370_RATIO_MASK(WDT_A370_RATIO_SHIFT),
> +			WDT_A370_RATIO_MASK(WDT_A370_RATIO_SHIFT));
> +
> +	dev->clk_rate = clk_get_rate(dev->clk) / WDT_A370_RATIO;
> +	return 0;
> +}
> +
> +static int armadaxp_wdt_clock_init(struct platform_device *pdev,
> +				   struct orion_watchdog *dev)
> +{
> +	int ret;
> +
> +	dev->clk = of_clk_get_by_name(pdev->dev.of_node, "fixed");
> +	if (IS_ERR(dev->clk))
> +		return PTR_ERR(dev->clk);
> +	ret = clk_prepare_enable(dev->clk);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the fixed watchdog clock input */
> +	atomic_io_modify(dev->reg + TIMER_CTRL,
> +		WDT_AXP_FIXED_ENABLE_BIT,
> +		WDT_AXP_FIXED_ENABLE_BIT);

Who am I to complain, but your continuation line indentation isn't really
consistent ;-).

> +
> +	dev->clk_rate = clk_get_rate(dev->clk);
> +	return 0;
> +}
> +
>  static int orion_wdt_ping(struct watchdog_device *wdt_dev)
>  {
>  	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> @@ -89,6 +138,26 @@ static int orion_wdt_ping(struct watchdog_device *wdt_dev)
>  	return 0;
>  }
>  
> +static int armada370_start(struct watchdog_device *wdt_dev)
> +{
> +	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> +
> +	/* Set watchdog duration */
> +	writel(dev->clk_rate * wdt_dev->timeout,
> +	       dev->reg + dev->data->wdt_counter_offset);
> +
> +	/* Clear the watchdog expiration bit */
> +	atomic_io_modify(dev->reg + TIMER_A370_STATUS, WDT_A370_EXPIRED, 0);
> +
> +	/* Enable watchdog timer */
> +	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit,
> +						dev->data->wdt_enable_bit);
> +
> +	atomic_io_modify(dev->rstout, dev->data->rstout_enable_bit,
> +				      dev->data->rstout_enable_bit);
> +	return 0;
> +}
> +
>  static int orion_start(struct watchdog_device *wdt_dev)
>  {
>  	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> @@ -170,11 +239,35 @@ static const struct orion_watchdog_data orion_data = {
>  	.start = orion_start,
>  };
>  
> +static const struct orion_watchdog_data armada370_data = {
> +	.rstout_enable_bit = BIT(8),
> +	.wdt_enable_bit = BIT(8),
> +	.wdt_counter_offset = 0x34,
> +	.clock_init = armada370_wdt_clock_init,
> +	.start = armada370_start,
> +};
> +
> +static const struct orion_watchdog_data armadaxp_data = {
> +	.rstout_enable_bit = BIT(8),
> +	.wdt_enable_bit = BIT(8),
> +	.wdt_counter_offset = 0x34,
> +	.clock_init = armadaxp_wdt_clock_init,
> +	.start = armada370_start,
> +};
> +
>  static const struct of_device_id orion_wdt_of_match_table[] = {
>  	{
>  		.compatible = "marvell,orion-wdt",
>  		.data = &orion_data,
>  	},
> +	{
> +		.compatible = "marvell,armada-370-wdt",
> +		.data = &armada370_data,
> +	},
> +	{
> +		.compatible = "marvell,armada-xp-wdt",
> +		.data = &armadaxp_data,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, orion_wdt_of_match_table);
> -- 
> 1.8.1.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
