From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 08/10] rtc: at91sam9: use clk API instead of relying
 on AT91_SLOW_CLOCK
Date: Tue, 23 Sep 2014 13:05:06 +0200
Message-ID: <20140923130506.3433c5a3@bbrezillon>
References: <1411465130-29011-1-git-send-email-boris.brezillon@free-electrons.com>
	<1411465130-29011-9-git-send-email-boris.brezillon@free-electrons.com>
	<20140923103326.GA404@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140923103326.GA404@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 23 Sep 2014 12:33:26 +0200
Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Tue, Sep 23, 2014 at 11:38:48AM +0200, Boris BREZILLON wrote:
> 
> > @@ -328,6 +328,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
> >  	struct sam9_rtc	*rtc;
> >  	int		ret, irq;
> >  	u32		mr;
> > +	unsigned int	sclk_rate;
> >  
> >  	irq = platform_get_irq(pdev, 0);
> >  	if (irq < 0) {
> > @@ -385,11 +386,27 @@ static int at91_rtc_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  	}
> >  
> > +	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(rtc->sclk))
> > +		return PTR_ERR(rtc->sclk);
> > +
> > +	sclk_rate = clk_get_rate(rtc->sclk);
> > +	if (!sclk_rate || sclk_rate > AT91_RTT_RTTRST) {
> 
> You probably meant AT91_RTT_RTPRES here.

Yes, that's what I meant.
Nice catch!

Thanks,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
