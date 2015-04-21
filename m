From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 1/5] clocksource: st_lpc: Add LPC timer as a
 clocksource.
Date: Tue, 21 Apr 2015 11:56:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1504211153580.13914@nanos>
References: <1429267823-8879-1-git-send-email-peter.griffin@linaro.org> <1429267823-8879-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429267823-8879-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ajit Pal Singh <ajitpal.singh-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 17 Apr 2015, Peter Griffin wrote:
> +/* Low Power Timer */
> +#define LPC_LPT_LSB_OFF		0x400
> +#define LPC_LPT_MSB_OFF		0x404
> +#define LPC_LPT_START_OFF	0x408
> +
> +struct st_lpc {
> +	struct clk *clk;
> +	void __iomem *iomem_cs;
> +};
> +
> +static struct st_lpc *st_lpc;
> +
> +static u64 notrace st_lpc_counter_read(void)
> +{
> +	u64 counter;
> +	u32 lower;
> +	u32 upper, old_upper;
> +
> +	upper = readl_relaxed(st_lpc->iomem_cs + LPC_LPT_MSB_OFF);
> +	do {
> +		old_upper = upper;
> +		lower = readl_relaxed(st_lpc->iomem_cs + LPC_LPT_LSB_OFF);
> +		upper = readl_relaxed(st_lpc->iomem_cs + LPC_LPT_MSB_OFF);
> +	} while (upper != old_upper);
> +
> +	counter = upper;
> +	counter <<= 32;
> +	counter |= lower;
> +	return counter;


What's the point of this exercise? The kernel can handle 32bit
clocksources nicely. So why do you want to artificially expand them to
64bit by adding useless loops and hoops to a hotpath?

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
