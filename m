From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] clocksource: st_lpc: Add LPC timer as a clocksource.
Date: Sat, 2 May 2015 17:36:59 +0100
Message-ID: <20150502163659.GA23998@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1429267823-8879-1-git-send-email-peter.griffin@linaro.org>
 <1429267823-8879-2-git-send-email-peter.griffin@linaro.org>
 <alpine.DEB.2.11.1504211153580.13914@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1504211153580.13914@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ajit Pal Singh <ajitpal.singh-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Tue, 21 Apr 2015, Thomas Gleixner wrote:

> On Fri, 17 Apr 2015, Peter Griffin wrote:
> > +/* Low Power Timer */
> > +#define LPC_LPT_LSB_OFF		0x400
> > +#define LPC_LPT_MSB_OFF		0x404
> > +#define LPC_LPT_START_OFF	0x408
> > +
> > +struct st_lpc {
> > +	struct clk *clk;
> > +	void __iomem *iomem_cs;
> > +};
> > +
> > +static struct st_lpc *st_lpc;
> > +
> > +static u64 notrace st_lpc_counter_read(void)
> > +{
> > +	u64 counter;
> > +	u32 lower;
> > +	u32 upper, old_upper;
> > +
> > +	upper = readl_relaxed(st_lpc->iomem_cs + LPC_LPT_MSB_OFF);
> > +	do {
> > +		old_upper = upper;
> > +		lower = readl_relaxed(st_lpc->iomem_cs + LPC_LPT_LSB_OFF);
> > +		upper = readl_relaxed(st_lpc->iomem_cs + LPC_LPT_MSB_OFF);
> > +	} while (upper != old_upper);
> > +
> > +	counter = upper;
> > +	counter <<= 32;
> > +	counter |= lower;
> > +	return counter;
> 
> 
> What's the point of this exercise? The kernel can handle 32bit
> clocksources nicely. So why do you want to artificially expand them to
> 64bit by adding useless loops and hoops to a hotpath?

Thanks for reviewing, yes your correct, we don't really need to be
doing this. We will fix this in the v2 version.

Lee Jones has also pointed out something which I was not aware of when
submitting this, and that is this IP has shared registers with the RTC
driver.

He has been working on some patches here https://lkml.org/lkml/2015/4/9/609
which deal with configuring between watchdog and rtc and ensuring only one
can be configured at a time, and this driver should also be making use of
that mechanism.

As he is already working on this, we decided it would be best if he takes
over for the V2 submission, and aligns it with the work he has already done
for this IP.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
