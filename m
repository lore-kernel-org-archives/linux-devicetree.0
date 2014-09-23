From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 7/9] rtc: at91sam9: use clk API instead of relying
 on AT91_SLOW_CLOCK
Date: Tue, 23 Sep 2014 10:21:27 +0200
Message-ID: <54212D87.4060908@atmel.com>
References: <1411400563-570-1-git-send-email-boris.brezillon@free-electrons.com> <1411400563-570-8-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411400563-570-8-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/09/2014 17:42, Boris BREZILLON :
> The RTT block is using the slow clock which is accessible through the clk
> API.
> Use the clk API to retrieve, enable and get the slow clk rate instead of
> the AT91_SLOW_CLOCK macro (which hardcodes the slow clk rate).
> Doing this allows us to reference the clk thus preventing the CCF from
> disabling it during the "disable unused" phase.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> ---
>  drivers/rtc/rtc-at91sam9.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index 902cd01..d20e118 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -23,6 +23,7 @@
>  #include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <linux/clk.h>
>  
>  /*
>   * This driver uses two configurable hardware resources that live in the
> @@ -61,8 +62,6 @@
>  #define AT91_RTT_ALMS		(1 << 0)		/* Real-time Alarm Status */
>  #define AT91_RTT_RTTINC		(1 << 1)		/* Real-time Timer Increment */
>  
> -#define AT91_SLOW_CLOCK		32768
> -
>  /*
>   * We store ALARM_DISABLED in ALMV to record that no alarm is set.
>   * It's also the reset value for that field.
> @@ -77,6 +76,7 @@ struct sam9_rtc {
>  	struct regmap		*gpbr;
>  	unsigned int		gpbr_offset;
>  	int 			irq;
> +	struct clk		*sclk;
>  };
>  
>  #define rtt_readl(rtc, field) \
> @@ -328,6 +328,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  	struct sam9_rtc	*rtc;
>  	int		ret, irq;
>  	u32		mr;
> +	unsigned int	sclk_rate;
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> @@ -385,11 +386,27 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(rtc->sclk))
> +		return PTR_ERR(rtc->sclk);
> +
> +	sclk_rate = clk_get_rate(rtc->sclk);
> +	if (!sclk_rate || sclk_rate > AT91_RTT_RTTRST) {
> +		dev_err(&pdev->dev, "Invalid slow clock rate");
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_prepare_enable(rtc->sclk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not enable slow clock");
> +		return ret;
> +	}
> +
>  	mr = rtt_readl(rtc, MR);
>  
>  	/* unless RTT is counting at 1 Hz, re-initialize it */
> -	if ((mr & AT91_RTT_RTPRES) != AT91_SLOW_CLOCK) {
> -		mr = AT91_RTT_RTTRST | (AT91_SLOW_CLOCK & AT91_RTT_RTPRES);
> +	if ((mr & AT91_RTT_RTPRES) != sclk_rate) {
> +		mr = AT91_RTT_RTTRST | (sclk_rate & AT91_RTT_RTPRES);
>  		gpbr_writel(rtc, 0);
>  	}
>  
> @@ -434,6 +451,9 @@ static int at91_rtc_remove(struct platform_device *pdev)
>  	/* disable all interrupts */
>  	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
>  
> +	if (!IS_ERR(rtc->sclk))
> +		clk_disable_unprepare(rtc->sclk);
> +
>  	return 0;
>  }
>  
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
