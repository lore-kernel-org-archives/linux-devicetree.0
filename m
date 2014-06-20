From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] clocksource: add rockchip-specific armv7-timer setup
Date: Fri, 20 Jun 2014 13:14:50 +0100
Message-ID: <20140620121450.GJ30188@leverpostej>
References: <70167479.zcs3JF0luJ@diego>
 <3807304.rhf3VZXZNa@diego>
 <20140620105123.GH30188@leverpostej>
 <1653387.oFu7qPFqm3@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1653387.oFu7qPFqm3@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 12:27:26PM +0100, Heiko St=C3=BCbner wrote:
> Am Freitag, 20. Juni 2014, 11:51:23 schrieb Mark Rutland:
> > On Fri, Jun 20, 2014 at 11:44:49AM +0100, Heiko St=C3=BCbner wrote:
> > > The armv7-timer on Rockchip RK3288 SoCs needs an underlying timer=
 to run.
> > > Therefore the special rockchip,rk3288-armv7-timer does this setup=
 and
> > > then initializes the architected timer using the new locally expo=
sed
> > > arch_timer_init.
> > >=20
> > > Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > ---
> > >=20
> > >  .../bindings/arm/rockchip/armv7-timer.txt          | 22 ++++++++=
+
> > >  drivers/clocksource/Makefile                       |  1 +
> > >  drivers/clocksource/rockchip_timer.c               | 57
> > >  ++++++++++++++++++++++ 3 files changed, 80 insertions(+)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/arm/rockchip/armv7-timer.txt c=
reate
> > >  mode 100644 drivers/clocksource/rockchip_timer.c
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/rockchip/armv7-timer.txt
> > > b/Documentation/devicetree/bindings/arm/rockchip/armv7-timer.txt =
new file
> > > mode 100644
> > > index 0000000..4c1950a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/arm/rockchip/armv7-timer.=
txt
> > > @@ -0,0 +1,22 @@
> > > +Rockchip armv7-timer:
> > > +---------------------
> > > +
> > > +The architected timer on rk3288 SoCs has special setup requireme=
nts, as
> > > +the cpu-timer block needs to supply the architected timer.
> > > +
> > > +Required node properties:
> > > +- compatible value : =3D "rockchip,rk3288-armv7-timer";
> > > +- reg : physical base address and the size of the registers wind=
ow
> > > +        of the supplying timer block
> > > +- CP15 Timer node properties as described in bindings/arm/arch_t=
imer.txt
> > > +
> > > +Example:
> > > +
> > > +architected-timer {
> > > +	compatible =3D "rockchip,rk3288-armv7-timer";
> > > +	reg =3D <0xff810020 0x20>;
> > > +	interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> > > IRQ_TYPE_LEVEL_HIGH)>,
> > > +		     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |=20
> IRQ_TYPE_LEVEL_HIGH)>,
> > > +		     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |=20
> IRQ_TYPE_LEVEL_HIGH)>;
> > > +	clock-frequency =3D <24000000>;
> > > +};
> > > diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/M=
akefile
> > > index 800b130..cbad225 100644
> > > --- a/drivers/clocksource/Makefile
> > > +++ b/drivers/clocksource/Makefile
> > > @@ -20,6 +20,7 @@ obj-$(CONFIG_ARCH_MARCO)	+=3D timer-marco.o
> > >=20
> > >  obj-$(CONFIG_ARCH_MOXART)	+=3D moxart_timer.o
> > >  obj-$(CONFIG_ARCH_MXS)		+=3D mxs_timer.o
> > >  obj-$(CONFIG_ARCH_PRIMA2)	+=3D timer-prima2.o
> > >=20
> > > +obj-$(CONFIG_ARCH_ROCKCHIP)	+=3D rockchip_timer.o
> > >=20
> > >  obj-$(CONFIG_ARCH_U300)		+=3D timer-u300.o
> > >  obj-$(CONFIG_SUN4I_TIMER)	+=3D sun4i_timer.o
> > >  obj-$(CONFIG_SUN5I_HSTIMER)	+=3D timer-sun5i.o
> > >=20
> > > diff --git a/drivers/clocksource/rockchip_timer.c
> > > b/drivers/clocksource/rockchip_timer.c new file mode 100644
> > > index 0000000..46c2146
> > > --- /dev/null
> > > +++ b/drivers/clocksource/rockchip_timer.c
> > > @@ -0,0 +1,57 @@
> > > +/*
> > > + * Copyright (c) 2014 MundoReader S.L.
> > > + * Author: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > + *
> > > + * This program is free software; you can redistribute it and/or=
 modify
> > > + * it under the terms of the GNU General Public License as publi=
shed by
> > > + * the Free Software Foundation; either version 2 of the License=
, or
> > > + * (at your option) any later version.
> > > + *
> > > + * This program is distributed in the hope that it will be usefu=
l,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + */
> > > +
> > > +#include <linux/init.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/clockchips.h>
> > > +#include "arm_arch_timer.h"
> > > +
> > > +#define TIMER_LOAD_COUNT0		0x00
> > > +#define TIMER_LOAD_COUNT1		0x04
> > > +#define TIMER_CURRENT_VALUE0		0x08
> > > +#define TIMER_CURRENT_VALUE1		0x0c
> > > +#define TIMER_CONTROL_REG		0x10
> > > +#define TIMER_INT_STATUS		0x18
> > > +
> > > +#define TIMER_DISABLE			(0 << 0)
> > > +#define TIMER_ENABLE			(1 << 0)
> > > +#define TIMER_MODE_FREE_RUNNING		(0 << 1)
> > > +#define TIMER_MODE_USER_DEFINED_COUNT	(1 << 1)
> > > +#define TIMER_INT_MASK			(0 << 2)
> > > +#define TIMER_INT_UNMASK		(1 << 2)
> > > +
> > > +static __init void rk3288_arch_timer_init(struct device_node *np=
)
> > > +{
> > > +	void __iomem *reg_base;
> > > +
> > > +	reg_base =3D of_io_request_and_map(np, 0, "rk3288-armv7-timer")=
;
> > > +	if (!reg_base) {
> > > +		pr_warn("%s: Can't get resource\n", __func__);
> > > +		return;
> > > +	}
> > > +
> > > +	writel(TIMER_DISABLE, reg_base + TIMER_CONTROL_REG);
> > > +
> > > +	writel(0xffffffff, reg_base + TIMER_LOAD_COUNT0);
> > > +	writel(0xffffffff, reg_base + TIMER_LOAD_COUNT1);
> > > +
> > > +	writel(TIMER_ENABLE | TIMER_MODE_FREE_RUNNING,
> > > +	       reg_base + TIMER_CONTROL_REG);
> >=20
> > Given that this is unconditionally set up in this way, could this n=
ot be
> > done in the fimrware/bootloader?
> >=20
> > That way you could also setup CNTFREQ correctly, and virtualisation=
 can
> > just work out of the box.
>=20
> It always comes back to this :-) . And as always the counter-argument=
 would be=20
> that I cannot influence the current bootloader, there are already dev=
ices=20
> shipping in this constellation. And of course quite some more SoCs us=
ing this=20
> pattern.

Sure, but we aren't yet supporting the architected timer on those
systems. :)

This isn't so much a pattern as an unholy tapestry of braindead.

> > This looks like a clock driver in disguise...
>=20
> Yeah, that was my other idea - doing this as a clock. So would you be=
 ok, with=20
> the arch-timer getting the possibility to handle an optional clock?

I would very much not like to do this, but it is better than a driver
whose sole purpose is to not be a clock driver.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
