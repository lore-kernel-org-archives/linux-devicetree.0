From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/8] irqchip: Supply new driver for STi based devices
Date: Thu, 27 Nov 2014 10:47:34 +0100
Message-ID: <2111250.BPZOtBCtcF@wuerfel>
References: <1416932705-16880-1-git-send-email-lee.jones@linaro.org> <35179358.tOpRGufXmc@wuerfel> <20141127092901.GE4628@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127092901.GE4628@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 27 November 2014 09:29:01 Lee Jones wrote:
> On Thu, 27 Nov 2014, Arnd Bergmann wrote:
> > On Thursday 27 November 2014 09:02:55 Lee Jones wrote:
> > > On Tue, 25 Nov 2014, Arnd Bergmann wrote:
> > > 
> > > > On Tuesday 25 November 2014 16:24:59 Lee Jones wrote:
> > > > 
> > > > > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > > > > index b21f12f..e502f15 100644
> > > > > --- a/drivers/irqchip/Kconfig
> > > > > +++ b/drivers/irqchip/Kconfig
> > > > > @@ -93,6 +93,13 @@ config RENESAS_IRQC
> > > > >     bool
> > > > >     select IRQ_DOMAIN
> > > > >  
> > > > > +config ST_IRQCHIP
> > > > > +   bool
> > > > > +   select REGMAP
> > > > > +   select MFD_SYSCON
> > > > > +   help
> > > > > +     Enables SysCfg Controlled IRQs on STi based platforms.
> > > > > +
> > > > 
> > > > I'm confused by the purpose of this code. It's apparently a driver
> > > > in drivers/irqchip, the Kconfig symbol contains the string IRQCHIP,
> > > > yet it doesn't actually register an irq_chip.
> > > > 
> > > > Also, the name is a bit too generic, ST has lots of different irqchips,
> > > > and this apparently isn't even one of them 
> > > 
> > > Hmm... now you're going to ask me to remember who I had the
> > > conversation with that alluded to this as the best location for this
> > > driver.  Unfortunately, I cannot.  Can you think of a better place to
> > > put it then?
> > 
> > I suspect it's in the right place but should actually be an irqchip
> > driver. I'm having trouble understanding what this code actually does,
> > can you you explain the functionality in more detail so we can figure
> > out what to do with it?
> 
> In the simplest terms it's an IRQ unmasker.  A9 Core IRQs are disabled
> on boot; PMU, CTI (CoreSight), PL310_L2 and EXT.  In order for you to
> make use of them they need to be unmasked in SYSCFG.

So you just apply static configuration once, or are there reasons why you
would mask the interrupts again later?

If it's all static, why doesn't the boot loader unmask all interrupts before
starting the kernel?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
