From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 3/7] irqchip: atmel-aic: add new atmel AIC driver
Date: Tue, 24 Jun 2014 08:56:53 -0400
Message-ID: <20140624125653.GN10202@titan.lakedaemon.net>
References: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com>
 <1403276487-8792-4-git-send-email-boris.brezillon@free-electrons.com>
 <53A74316.5080509@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A74316.5080509-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Boris,

On Sun, Jun 22, 2014 at 10:56:54PM +0200, Boris BREZILLON wrote:
> 
> On 20/06/2014 17:01, Boris BREZILLON wrote:
> > Add new atmel AIC (Advanced Interrupt Controller) driver based on the
> > generic chip infrastructure.
> >
> > This driver is only compatible with dt enabled board and replaces the old
> > implementation found in arch/arm/mach-at91/irq.c.
> >
> > Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/irqchip/Kconfig         |   7 +
> >  drivers/irqchip/Makefile        |   1 +
> >  drivers/irqchip/irq-atmel-aic.c | 700 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 708 insertions(+)
> >  create mode 100644 drivers/irqchip/irq-atmel-aic.c
> >
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index bbb746e..6a7ad81 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -30,6 +30,13 @@ config ARM_VIC_NR
> >  	  The maximum number of VICs available in the system, for
> >  	  power management.
> >  
> 
> [...]
> 
> > +
> > +static int at91_aic_common_irq_domain_xlate(struct irq_domain *d,
> 
> This function should be named aic_common_irq_domain_xslate to be
> consistent with other function names.
> I'll fix that for the next version.

Other than this one change, this series looks good wrt to irqchip.  When
you respin, please adjust the patch subject lines like so:

  irqchip: atmel-aic: Add new atmel AIC driver

Note the capitalization.  Also, if you could add Thomas' Ack to the
first patch, that would be appreciated.

Once you post the new series, I assume it's ok to apply patches 1-3 to
irqchip/core, or are there some dependency considerations?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
