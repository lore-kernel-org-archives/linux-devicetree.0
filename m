From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/8] irqchip: Supply new driver for STi based devices
Date: Thu, 27 Nov 2014 09:29:01 +0000
Message-ID: <20141127092901.GE4628@x1>
References: <1416932705-16880-1-git-send-email-lee.jones@linaro.org>
 <2433040.4NqTrOMmEE@wuerfel>
 <20141127090255.GD4628@x1>
 <35179358.tOpRGufXmc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <35179358.tOpRGufXmc@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 27 Nov 2014, Arnd Bergmann wrote:

> On Thursday 27 November 2014 09:02:55 Lee Jones wrote:
> > On Tue, 25 Nov 2014, Arnd Bergmann wrote:
> >=20
> > > On Tuesday 25 November 2014 16:24:59 Lee Jones wrote:
> > >=20
> > > > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > > > index b21f12f..e502f15 100644
> > > > --- a/drivers/irqchip/Kconfig
> > > > +++ b/drivers/irqchip/Kconfig
> > > > @@ -93,6 +93,13 @@ config RENESAS_IRQC
> > > >     bool
> > > >     select IRQ_DOMAIN
> > > > =20
> > > > +config ST_IRQCHIP
> > > > +   bool
> > > > +   select REGMAP
> > > > +   select MFD_SYSCON
> > > > +   help
> > > > +     Enables SysCfg Controlled IRQs on STi based platforms.
> > > > +
> > >=20
> > > I'm confused by the purpose of this code. It's apparently a drive=
r
> > > in drivers/irqchip, the Kconfig symbol contains the string IRQCHI=
P,
> > > yet it doesn't actually register an irq_chip.
> > >=20
> > > Also, the name is a bit too generic, ST has lots of different irq=
chips,
> > > and this apparently isn't even one of them=20
> >=20
> > Hmm... now you're going to ask me to remember who I had the
> > conversation with that alluded to this as the best location for thi=
s
> > driver.  Unfortunately, I cannot.  Can you think of a better place =
to
> > put it then?
>=20
> I suspect it's in the right place but should actually be an irqchip
> driver. I'm having trouble understanding what this code actually does=
,
> can you you explain the functionality in more detail so we can figure
> out what to do with it?

In the simplest terms it's an IRQ unmasker.  A9 Core IRQs are disabled
on boot; PMU, CTI (CoreSight), PL310_L2 and EXT.  In order for you to
make use of them they need to be unmasked in SYSCFG.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
