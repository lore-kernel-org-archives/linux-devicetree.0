From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 06/10] rtc: at91sam9: rework the Kconfig description
Date: Tue, 23 Sep 2014 12:39:23 +0200
Message-ID: <20140923103923.GB404@localhost>
References: <1411465130-29011-1-git-send-email-boris.brezillon@free-electrons.com>
 <1411465130-29011-7-git-send-email-boris.brezillon@free-electrons.com>
 <542146AF.3060807@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <542146AF.3060807-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 23, 2014 at 12:08:47PM +0200, Nicolas Ferre wrote:
> On 23/09/2014 11:38, Boris BREZILLON :
> > Remove all references to AT91CAP9 SoC which has been removed.
> > Rework the help message to remove any specific references to AT91SAM9 SoCs.
> > 
> > Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/rtc/Kconfig | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 7d76da8..455f2c3 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -1079,17 +1079,18 @@ config RTC_DRV_AT91RM9200
> >  	  this is powered by the backup power supply.
> >  
> >  config RTC_DRV_AT91SAM9
> > -	tristate "AT91SAM9x/AT91CAP9 RTT as RTC"
> > +	tristate "AT91SAM9 RTT as RTC"
> >  	depends on ARCH_AT91 && !(ARCH_AT91RM9200 || ARCH_AT91X40)
> >  	select MFD_SYSCON
> >  	help
> > -	  RTC driver for the Atmel AT91SAM9x and AT91CAP9 internal RTT
> > -	  (Real Time Timer). These timers are powered by the backup power
> > -	  supply (such as a small coin cell battery), but do not need to
> > -	  be used as RTCs.
> > -
> > -	  (On AT91SAM9rl and AT91SAM9G45 chips you probably want to use the
> > -	  dedicated RTC module and leave the RTT available for other uses.)
> > +	  Some AT91SAM9 SoCs provide an RTT (Real Time Timer) block which
> > +	  can be used as an RTC thanks to the backup power supply (e.g. a
> > +	  small coin cell battery) which keeps this block and the GPBR
> > +	  (General Purpose Backup Registers) block powered when the device
> > +	  is shutdown.
> > +	  Some AT91SAM9 SoCs provide a real RTC block, on those ones you'd
> > +	  probably want to use the real RTC block instead of the RTT as an
> > +	  RTT driver.
> 
> You mean:
> "instead of the RTT as an RTC"

Boris, perhaps you should also update the Kconfig entries for
RTC_DRV_AT91SAM9_RTT and RTC_DRV_AT91SAM9_GPBR to clarify that they are
only used for legacy booting (and otherwise have no effect)?

> With that, good description: thanks!
> 
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> 
> So, now we can think of what to do with the series:
> 
> - Johan, do you want to "Ack" it?

I had one comment to the slow-clock patch, but feel free to add my

Acked-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

to the whole series.

Thanks,
Johan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
