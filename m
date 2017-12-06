From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 5/5] rtc: add mxc driver for i.MX53 SRTC
Date: Wed, 6 Dec 2017 12:05:03 +0100
Message-ID: <20171206110503.GO21780@piout.net>
References: <20171205140646.30367-1-linux-kernel-dev@beckhoff.com>
 <20171205140646.30367-6-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205140646.30367-6-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Lothar
List-Id: devicetree@vger.kernel.org

On 05/12/2017 at 15:06:46 +0100, linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org wrote:
> +/* This function is the RTC interrupt service routine. */
> +static irqreturn_t mxc_rtc_interrupt(int irq, void *dev_id)
> +{
> +	struct platform_device *pdev = dev_id;
> +	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
> +	void __iomem *ioaddr = pdata->ioaddr;
> +	unsigned long flags;
> +	u32 events = 0;
> +	u32 lp_status;
> +	u32 lp_cr;
> +
> +	spin_lock_irqsave(&pdata->lock, flags);
> +	if (clk_prepare_enable(pdata->clk)) {
> +		spin_unlock_irqrestore(&pdata->lock, flags);
> +		return IRQ_NONE;
> +	}
> +
> +	lp_status = readl(ioaddr + SRTC_LPSR);
> +	lp_cr = readl(ioaddr + SRTC_LPCR);
> +
> +	/* update irq data & counter */
> +	if (lp_status & SRTC_LPSR_ALP) {
> +		if (lp_cr & SRTC_LPCR_ALP)
> +			events = (RTC_AF | RTC_IRQF);

I would just call rtc_update_irq here...

> +
> +		/* disable further lp alarm interrupts */
> +		lp_cr &= ~(SRTC_LPCR_ALP | SRTC_LPCR_WAE);
> +	}
> +
> +	/* Update interrupt enables */
> +	writel(lp_cr, ioaddr + SRTC_LPCR);
> +
> +	/* clear interrupt status */
> +	writel(lp_status, ioaddr + SRTC_LPSR);
> +
> +	mxc_rtc_sync_lp_locked(ioaddr);
> +	rtc_update_irq(pdata->rtc, 1, events);

... because calling it here with events == 0 will result in a lot of
work for nothing (the core will walk through the timers and set the
alarm again).


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
