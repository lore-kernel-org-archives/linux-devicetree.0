From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 4/4] arm: add basic support for Rockchip RK3066a boards
Date: Tue, 18 Jun 2013 00:26:25 +0200
Message-ID: <201306180026.25973.heiko@sntech.de>
References: <201306131658.36584.heiko@sntech.de>
 <201306131702.13400.heiko@sntech.de> <20130617213515.GK28497@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130617213515.GK28497-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 17. Juni 2013, 23:35:15 schrieb Olof Johansson:
> Hi,
> =

> Just some small comments below. Once fixed:
> =

> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> =

> On Thu, Jun 13, 2013 at 05:02:13PM +0200, Heiko St=FCbner wrote:
> > +		dwmmc@10214000 {
> > +			compatible =3D "rockchip,rk2928-dw-mshc";
> =

> does it make sense to fall back and also specify "snps,dw-mshc"?

nope, the rockchip-variant is necessary, with the regular dw-mshc it doesn'=
t =

work at all.


> > diff --git a/arch/arm/mach-rockchip/rockchip.c
> > b/arch/arm/mach-rockchip/rockchip.c new file mode 100644
> > index 0000000..0933e17
> > --- /dev/null
> > +++ b/arch/arm/mach-rockchip/rockchip.c
> > @@ -0,0 +1,54 @@
> > +/*
> > + * Device Tree support for Rockchip SoCs
> > + *
> > + * Copyright (c) 2013 MundoReader S.L.
> > + * Author: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/init.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/irqchip.h>
> > +#include <linux/dw_apb_timer.h>
> > +#include <linux/clk-provider.h>
> > +#include <asm/mach/arch.h>
> > +#include <asm/mach/map.h>
> > +#include <asm/hardware/cache-l2x0.h>
> > +
> > +static void __init rockchip_timer_init(void)
> > +{
> > +	of_clk_init(NULL);
> > +	clocksource_of_init();
> > +}
> > +
> > +static void __init rockchip_dt_init(void)
> > +{
> > +#ifdef CONFIG_CACHE_L2X0
> > +	l2x0_of_init(0, ~0UL);
> > +#endif
> =

> No need to ifdef, there's a stub if CONFIG_CACHE_L2X0 isn't defined.

ok


> Side comment: I think it would be nice if the generic code did this
> init if a l2x0 device node was in the device tree, since the only
> reason to override init_machine is to do this call in addition to
> of_platform_populate().

Arnd said similar things in the initial version :-).

Currently I'm wondering if it wouldn't be enough to call always l2x0_of_ini=
t =

somewhere, because it does the checking for the dt nodes itself already.

The only obstacle would be platforms having the need to use special aux-val=
ues =

or which are currently calling the function from some other parts of the bo=
ot =

process (tegra inits the cache in its tegra_init_early function for example=
).


> > +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> > +}
> > +
> > +static const char * const rockchip_board_dt_compat[] =3D {
> > +	"rockchip,rk2928",
> > +	"rockchip,rk3066a",
> > +	"rockchip,rk3066b",
> > +	"rockchip,rk3188",
> > +	NULL,
> > +};
> > +
> > +DT_MACHINE_START(ROCKCHIP_DT, "Rockchip Cortex-A9 (Device Tree)")
> > +	.init_machine	=3D rockchip_dt_init,
> > +	.init_time	=3D rockchip_timer_init,
> > +	.dt_compat	=3D rockchip_board_dt_compat,
> > +MACHINE_END
