From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 3/5] irqchip: Add DT binding doc for the virtual irq
 demuxer chip
Date: Fri, 20 Feb 2015 14:22:08 +0000
Message-ID: <20150220142208.GJ13659@leverpostej>
References: <1422527620-8308-1-git-send-email-boris.brezillon@free-electrons.com>
 <2437801.56xPyk3atd@vostro.rjw.lan>
 <20150211151237.GN9154@leverpostej>
 <1487331.cgC9j5u0aF@vostro.rjw.lan>
 <20150211155720.GQ9154@leverpostej>
 <20150211171515.55d5066f@bbrezillon>
 <20150211163231.GR9154@leverpostej>
 <20150211173823.30c42c6a@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150211173823.30c42c6a@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Wed, Feb 11, 2015 at 04:38:23PM +0000, Boris Brezillon wrote:

[...]

> For the list of impacted drivers, you can have a look at this series [1]
> (patches 2 to 5), and I'll take care of the testing part once every one
> has agreed on the solution ;-).
> 
> [1]https://lkml.org/lkml/2014/12/15/552

Looking at those:

* The pmc looks like it could be a valid use of the new flag. It also
  seems to function as an irqchip.
  
  Do any of its child IRQs need to be handled during the suspend-resume
  cycle? If so using IRQF_NO_SUSPEND would seem to be valid.

* atmel_serial seems to be intended to be used as a wakeup device (given
  it calls device_set_wakeup_enable). Therefore it needs to call
  enable_irq_wake, and when it does so it can share an IRQ with other
  interrupts, just not IRQF_NO_SUSPEND interrupts.
  
  None of the approaches thus far can fix the fundamental mismatch
  between wakeup interrupts and IRQF_NO_SUSPEND interrupts.

* Similarly, rtc-at91rm9200 and rtc-at91sam9 are intended to be used as 
  wakeup devices. They call enable_irq_wake (though don't bother
  checking the return value). They can share an IRQ with other
  interrupts, just not IRQF_NO_SUSPEND interrupts.

* at91sam9_wdt seems to be fundamentally incompatible with suspend. If
  the watchdog cannot be disabled, and you need to handle it during
  suspend, then it needs to be a wakeup interrupt, not an
  IRQF_NO_SUSPEND interrupt.

As far as I can see, the flag or virtual irqchip approaches only help
the PMC case, and even then might not be necessary. All the others seem
to be relying on guarantees the genirq layer don't provide, and fixing
that would mean moving them further from IRQF_NO_SUSPEND.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
