From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] rtc: rtc-jz4740: Add support for the RTC in the
 jz4780 SoC
Date: Thu, 17 Mar 2016 13:04:19 +0100
Message-ID: <20160317120419.GB3362@piout.net>
References: <1457217531-26064-1-git-send-email-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457217531-26064-1-git-send-email-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please, always include a commit message, even if it is short.

On 05/03/2016 at 23:38:47 +0100, Paul Cercueil wrote :
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  drivers/rtc/Kconfig      |  6 +++---
>  drivers/rtc/rtc-jz4740.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 51 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e593c55..b322f08 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1494,10 +1494,10 @@ config RTC_DRV_MPC5121
>  
>  config RTC_DRV_JZ4740
>  	tristate "Ingenic JZ4740 SoC"
> -	depends on MACH_JZ4740 || COMPILE_TEST
> +	depends on MACH_INGENIC || COMPILE_TEST
>  	help
> -	  If you say yes here you get support for the Ingenic JZ4740 SoC RTC
> -	  controller.
> +	  If you say yes here you get support for the Ingenic JZ47xx SoCs RTC
> +	  controllers.
>  
>  	  This driver can also be buillt as a module. If so, the module
>  	  will be called rtc-jz4740.
> diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> index b2bcfc0..47617bd 100644
> --- a/drivers/rtc/rtc-jz4740.c
> +++ b/drivers/rtc/rtc-jz4740.c
> @@ -29,6 +29,10 @@
>  #define JZ_REG_RTC_HIBERNATE	0x20
>  #define JZ_REG_RTC_SCRATCHPAD	0x34
>  
> +/* The following are present on the jz4780 */
> +#define JZ_REG_RTC_WENR	0x3C
> +#define JZ_RTC_WENR_WEN	BIT(31)
> +
>  #define JZ_RTC_CTRL_WRDY	BIT(7)
>  #define JZ_RTC_CTRL_1HZ		BIT(6)
>  #define JZ_RTC_CTRL_1HZ_IRQ	BIT(5)
> @@ -37,8 +41,17 @@
>  #define JZ_RTC_CTRL_AE		BIT(2)
>  #define JZ_RTC_CTRL_ENABLE	BIT(0)
>  
> +/* Magic value to enable writes on jz4780 */
> +#define JZ_RTC_WENR_MAGIC	0xA55A
> +
> +enum jz4740_rtc_type {
> +	ID_JZ4740,
> +	ID_JZ4780,
> +};
> +
>  struct jz4740_rtc {
>  	void __iomem *base;
> +	enum jz4740_rtc_type type;
>  
>  	struct rtc_device *rtc;
>  
> @@ -64,11 +77,33 @@ static int jz4740_rtc_wait_write_ready(struct jz4740_rtc *rtc)
>  	return timeout ? 0 : -EIO;
>  }
>  
> +static inline int jz4780_rtc_enable_write(struct jz4740_rtc *rtc)
> +{
> +	uint32_t ctrl;
> +	int ret, timeout = 1000;
> +
> +	ret = jz4740_rtc_wait_write_ready(rtc);
> +	if (ret != 0)
> +		return ret;
> +
> +	writel(JZ_RTC_WENR_MAGIC, rtc->base + JZ_REG_RTC_WENR);
> +
> +	do {
> +		ctrl = readl(rtc->base + JZ_REG_RTC_WENR);
> +	} while (!(ctrl & JZ_RTC_WENR_WEN) && --timeout);
> +
> +	return timeout ? 0 : -EIO;
> +}
> +
>  static inline int jz4740_rtc_reg_write(struct jz4740_rtc *rtc, size_t reg,
>  	uint32_t val)
>  {
> -	int ret;
> -	ret = jz4740_rtc_wait_write_ready(rtc);
> +	int ret = 0;
> +
> +	if (rtc->type >= ID_JZ4780)
> +		ret = jz4780_rtc_enable_write(rtc);
> +	if (ret == 0)
> +		ret = jz4740_rtc_wait_write_ready(rtc);
>  	if (ret == 0)
>  		writel(val, rtc->base + reg);
>  
> @@ -216,11 +251,14 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
>  	struct jz4740_rtc *rtc;
>  	uint32_t scratchpad;
>  	struct resource *mem;
> +	const struct platform_device_id *id = platform_get_device_id(pdev);
>  
>  	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
>  	if (!rtc)
>  		return -ENOMEM;
>  
> +	rtc->type = id->driver_data;
> +
>  	rtc->irq = platform_get_irq(pdev, 0);
>  	if (rtc->irq < 0) {
>  		dev_err(&pdev->dev, "Failed to get platform irq\n");
> @@ -295,12 +333,20 @@ static const struct dev_pm_ops jz4740_pm_ops = {
>  #define JZ4740_RTC_PM_OPS NULL
>  #endif  /* CONFIG_PM */
>  
> +static const struct platform_device_id jz4740_rtc_ids[] = {
> +	{"jz4740-rtc", ID_JZ4740},
> +	{"jz4780-rtc", ID_JZ4780},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, jz4740_rtc_ids);
> +
>  static struct platform_driver jz4740_rtc_driver = {
>  	.probe	 = jz4740_rtc_probe,
>  	.driver	 = {
>  		.name  = "jz4740-rtc",
>  		.pm    = JZ4740_RTC_PM_OPS,
>  	},
> +	.id_table = jz4740_rtc_ids,
>  };
>  
>  module_platform_driver(jz4740_rtc_driver);
> -- 
> 2.7.0
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
