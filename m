From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Wed, 18 Sep 2013 17:34:24 +0200
Message-ID: <20130918153424.GR24802@pengutronix.de>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <201309172245.25367.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201309172245.25367.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Tue, Sep 17, 2013 at 10:45:25PM +0200, Arnd Bergmann wrote:
> On Tuesday 17 September 2013, Uwe Kleine-K=F6nig wrote:
> >  arch/arm/Kconfig                               |  16 +++-
> >  arch/arm/Kconfig.debug                         |  16 ++++
> >  arch/arm/Makefile                              |   1 +
> >  arch/arm/configs/efm32_defconfig               | 104 +++++++++++++=
++++++++++++
> >  arch/arm/mach-efm32/Makefile                   |   1 +
> >  arch/arm/mach-efm32/Makefile.boot              |   2 +
> >  arch/arm/mach-efm32/cmu.h                      |  15 ++++
> >  arch/arm/mach-efm32/common.c                   |  19 +++++
> >  arch/arm/mach-efm32/common.h                   |   1 +
> >  arch/arm/mach-efm32/dtmachine.c                |  31 ++++++++
> >  arch/arm/mach-efm32/include/mach/debug-macro.S |  48 ++++++++++++
> >  arch/arm/mach-efm32/include/mach/entry-macro.S |   5 ++
> >  arch/arm/mach-efm32/include/mach/io.h          |   6 ++
> >  arch/arm/mach-efm32/include/mach/irqs.h        |   6 ++
> >  arch/arm/mach-efm32/include/mach/timex.h       |   7 ++
>=20
> You should be able to add NOMMU platforms in combination with
> CONFIG_MULTIPLATFORM now, which gets rid of most of these files.
in next ARCH_MULTIPLATFORM still depends on MMU. What am I missing?
=20
> > diff --git a/arch/arm/mach-efm32/Makefile b/arch/arm/mach-efm32/Mak=
efile
> > new file mode 100644
> > index 0000000..081f45a
> > --- /dev/null
> > +++ b/arch/arm/mach-efm32/Makefile
> > @@ -0,0 +1 @@
> > +obj-y +=3D common.o dtmachine.o
>=20
> Just merge the two files into one.
ok.

> > +
> > +void __init efm32_init_time(void)
> > +{
> > +	of_clk_init(NULL);
> > +	clocksource_of_init();
> > +}
>=20
> When Sebastian Hesselbarth's patches for of_clk_init() are merged,
> this function can go away.
Do you have a link?

> > +static void __init efm32_init(void)
> > +{
> > +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL=
);
> > +}
> > +
>=20
> And this one is already unnecessary.
fine.

> > +static const char *const efm32gg_compat[] __initconst =3D {
> > +	"efm32,dk3750",
> > +	NULL
> > +};
> > +
> > +DT_MACHINE_START(EFM32DT, "EFM32 (Device Tree Support)")
> > +	.init_irq =3D irqchip_init,
>=20
> Same for irqchip_init, which is the default when omitted.
ok.

>=20
> > diff --git a/arch/arm/mach-efm32/include/mach/debug-macro.S b/arch/=
arm/mach-efm32/include/mach/debug-macro.S
> > new file mode 100644
> > index 0000000..c58915c
> > --- /dev/null
> > +++ b/arch/arm/mach-efm32/include/mach/debug-macro.S
>=20
> Please move this to arch/arm/include/debug/ like the other such
> implementations.
I don't mind, but I thought this is only for devices that are expected
to be available on >1 platform.
=20
> > diff --git a/arch/arm/mach-efm32/include/mach/entry-macro.S b/arch/=
arm/mach-efm32/include/mach/entry-macro.S
> > new file mode 100644
> > index 0000000..f0c0f7d
> > --- /dev/null
> > +++ b/arch/arm/mach-efm32/include/mach/entry-macro.S
> > @@ -0,0 +1,5 @@
> > +		.macro	get_irqnr_preamble, base, tmp
> > +		.endm
> > +
> > +		.macro	arch_ret_to_user, tmp1, tmp2
> > +		.endm
>=20
> And use set_handle_irq() to register a handler from your irqchip driv=
er
> to get rid of this one.
ISTR that I tried that, but I don't remember the details. I will retry.
=20
> > --- /dev/null
> > +++ b/arch/arm/mach-efm32/include/mach/irqs.h
> > @@ -0,0 +1,6 @@
> > +#ifndef __MACH_IRQS_H__
> > +#define __MACH_IRQS_H__
> > +
> > +#define NR_IRQS			82
> > +
> > +#endif /* __MACH_IRQS_H__ */
>=20
> This should not be needed if you have the proper IRQ domain support,
> which I think you do.
OK.

Thanks for your comments
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
