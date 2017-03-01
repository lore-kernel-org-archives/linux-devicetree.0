From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] clk: sunxi-ng: add support for PRCM CCUs
Date: Wed, 01 Mar 2017 20:17:39 +0800
Message-ID: <20170301152220.MEgmqtKw@smtp2p.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBBH23LCQKGQER3G3ZQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=881=E6=97=A5 18:47=E4=BA=8E Maxime Ripard <maxime.ripa=
rd-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Mar 01, 2017 at 12:15:40PM +0800, Icenowy Zheng wrote:=20
> > SoCs after A31 has a clock controller module in the PRCM part.=20
> >=20
> > Support the clock controller module on H5 and A64 now.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> >=C2=A0 drivers/clk/sunxi-ng/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +=20
> >=C2=A0 drivers/clk/sunxi-ng/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +=20
> >=C2=A0 drivers/clk/sunxi-ng/ccu-sun6i-r.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 209 ++++++++++++++++++++++++++++++++=20
> >=C2=A0 drivers/clk/sunxi-ng/ccu-sun6i-r.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 27 +++++=20
> >=C2=A0 include/dt-bindings/clock/sun6i-r-ccu.h |=C2=A0 58 +++++++++=20
> >=C2=A0 include/dt-bindings/reset/sun6i-r-ccu.h |=C2=A0 54 +++++++++=20
> >=C2=A0 6 files changed, 355 insertions(+)=20
> >=C2=A0 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-r.c=20
> >=C2=A0 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-r.h=20
> >=C2=A0 create mode 100644 include/dt-bindings/clock/sun6i-r-ccu.h=20
> >=C2=A0 create mode 100644 include/dt-bindings/reset/sun6i-r-ccu.h=20
> >=20
> > diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfi=
g=20
> > index 695bbf9ef428..44984c050052 100644=20
> > --- a/drivers/clk/sunxi-ng/Kconfig=20
> > +++ b/drivers/clk/sunxi-ng/Kconfig=20
> > @@ -141,4 +141,10 @@ config SUN9I_A80_CCU=20
> >=C2=A0 select SUNXI_CCU_PHASE=20
> >=C2=A0 default MACH_SUN9I=20
> >=C2=A0=20
> > +config SUN6I_R_CCU=20
>
> This is not ordered.=20
>
> > + bool "Support for Allwinner SoCs' PRCM CCUs"=20
> > + select SUNXI_CCU_DIV=20
> > + select SUNXI_CCU_GATE=20
> > + default MACH_SUN8I || (ARCH_SUNXI && ARM64)=20
>
> And you can't build it for A31?=20
>
> > +=20
> >=C2=A0 endif=20
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile=20
> > index 6feaac0c5600..77ebcfd7d2ca 100644=20
> > --- a/drivers/clk/sunxi-ng/Makefile=20
> > +++ b/drivers/clk/sunxi-ng/Makefile=20
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_SUNXI_CCU_MP) +=3D ccu_mp.o=20
> >=C2=A0 obj-$(CONFIG_SUN50I_A64_CCU) +=3D ccu-sun50i-a64.o=20
> >=C2=A0 obj-$(CONFIG_SUN5I_CCU) +=3D ccu-sun5i.o=20
> >=C2=A0 obj-$(CONFIG_SUN6I_A31_CCU) +=3D ccu-sun6i-a31.o=20
> > +obj-$(CONFIG_SUN6I_R_CCU) +=3D ccu-sun6i-r.o=20
> >=C2=A0 obj-$(CONFIG_SUN8I_A23_CCU) +=3D ccu-sun8i-a23.o=20
> >=C2=A0 obj-$(CONFIG_SUN8I_A33_CCU) +=3D ccu-sun8i-a33.o=20
> >=C2=A0 obj-$(CONFIG_SUN8I_H3_CCU) +=3D ccu-sun8i-h3.o=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-r.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-r.c=20
> > new file mode 100644=20
> > index 000000000000..988d6b299e91=20
> > --- /dev/null=20
> > +++ b/drivers/clk/sunxi-ng/ccu-sun6i-r.c=20
> > @@ -0,0 +1,209 @@=20
> > +/*=20
> > + * Copyright (c) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > + *=20
> > + * This software is licensed under the terms of the GNU General Public=
=20
> > + * License version 2, as published by the Free Software Foundation, an=
d=20
> > + * may be copied, distributed, and modified under those terms.=20
> > + *=20
> > + * This program is distributed in the hope that it will be useful,=20
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of=20
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
=20
> > + * GNU General Public License for more details.=20
> > + */=20
> > +=20
> > +#include <linux/clk-provider.h>=20
> > +#include <linux/of_address.h>=20
> > +#include <linux/platform_device.h>=20
> > +=20
> > +#include "ccu_common.h"=20
> > +#include "ccu_reset.h"=20
> > +=20
> > +#include "ccu_div.h"=20
> > +#include "ccu_gate.h"=20
> > +#include "ccu_mp.h"=20
> > +#include "ccu_nm.h"=20
> > +=20
> > +#include "ccu-sun6i-r.h"=20
> > +=20
> > +static const char * const cpus_parents[] =3D { "osc32k", "osc24M",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0 "pll-periph0" };=20
>
> You need another pll-periph0 here, the value 3 is valid.=20

On SoCs that have materials, the value 3 is never pll-periph0.

Sometimes it's a clock callwd "cpuosc" in BSP driver.

>
> And that pll should be in your binding.=20
>
> > +=20
> > +static struct ccu_div cpus_clk =3D {=20
> > + .div =3D _SUNXI_CCU_DIV_FLAGS(4, 2, CLK_DIVIDER_POWER_OF_TWO),=20
> > +=20
> > + .mux =3D {=20
> > + .shift =3D 16,=20
> > + .width =3D 2,=20
> > +=20
> > + .variable_prediv =3D {=20
> > + .index =3D 2,=20
> > + .shift =3D 8,=20
> > + .width =3D 5,=20
> > + },=20
> > + },=20
> > +=20
> > + .common =3D {=20
> > + .reg =3D 0x00,=20
> > + .features =3D CCU_FEATURE_VARIABLE_PREDIV,=20
> > + .hw.init =3D CLK_HW_INIT_PARENTS("cpus",=20
>
> We've been calling it ar100 so far.=20
>
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpus_parents,=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ccu_div_ops,=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0),=20
> > + },=20
> > +};=20
> > +=20
> > +static CLK_FIXED_FACTOR(r_ahb0_clk, "r-ahb0", "cpus", 1, 1, 0);=20
>
> ahb0 is by definition in the PRCM, there's no need to prefix it by=20
> "r-".=20
>
> > +=20
> > +static struct ccu_div r_apb0_clk =3D {=20
> > + .div =3D _SUNXI_CCU_DIV_FLAGS(0, 2, CLK_DIVIDER_POWER_OF_TWO),=20
> > +=20
> > + .common =3D {=20
> > + .reg =3D 0x0c,=20
> > + .hw.init =3D CLK_HW_INIT("r-apb0",=20
>
> Ditto.=20
>
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "r-ahb0",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ccu_div_ops,=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0),=20
> > + },=20
> > +};=20
> > +=20
> > +static SUNXI_CCU_GATE(r_bus_pio_clk, "r-bus-pio", "r-apb0",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28, BIT(0), 0);=20
>
> apb0-pio=20
>
> > +static SUNXI_CCU_GATE(r_bus_ir_clk, "r-bus-ir", "r-apb0",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28, BIT(1), 0);=20
>
> apb0-ir=20
>
> > +static SUNXI_CCU_GATE(r_bus_timer_clk, "r-bus-timer", "r-apb0",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28, BIT(2), 0);=20
>
> apb0-timer=20
>
> > +static SUNXI_CCU_GATE(r_bus_rsb_clk, "r-bus-rsb", "r-apb0",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28, BIT(3), 0);=20
>
> This is not RSB on the A31=20
>
> > +static SUNXI_CCU_GATE(r_bus_uart_clk, "r-bus-uart", "r-apb0",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28, BIT(4), 0);=20
>
> And the A31 also has a 1-wire clock here.=20
>
> > +static SUNXI_CCU_GATE(r_bus_i2c_clk, "r-bus-i2c", "r-apb0",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28, BIT(6), 0);=20
> > +=20
> > +static const char * const r_mod0_default_parents[] =3D { "osc32K", "os=
c24M" };=20
> > +static SUNXI_CCU_MP_WITH_MUX_GATE(r_ir_clk, "r-ir",=20
>
> ir is enough.=20
>
> I'm a bit worried by that to be honest. You claim to support the A31,=20
> yet jugdging by the current state of that code you never actually=20
> tested it on that SoC.=20

I only claim to reserve possibility to extend the driver to support A31, bu=
t I didn't claim it currently support A31.

>
> What makes you say that the PRCM clocks are the same for the H3 and=20
> A64? We have to be sure, otherwise we might not be able to get the DT=20
> binding right from the very beginning, and we might not be able to fix=20
> it later.=20

Of course, not so same -- H3 lacks RSB.

>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.=20
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> For more options, visit https://groups.google.com/d/optout.=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
