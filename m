From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH 2/8] clk: sunxi-ng: add support for DE2 CCU
Date: Wed, 22 Feb 2017 23:11:49 +0100
Message-ID: <2861790.WmLcjTgm5a@jernej-laptop>
References: <20170222231754.Hm6O1qAk@smtp3j.mail.yandex.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBKUZXDCQKGQE2I7AECY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170222231754.Hm6O1qAk-fU7thrOZ3Cs0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-ymACFijhrKM@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Dne sreda, 22. februar 2017 ob 21:17:29 CET je Icenowy Zheng napisal(a):
> 2017=E5=B9=B42=E6=9C=8823=E6=97=A5 03:09=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>=20
> > Hi,
> >=20
> > On Wed, Feb 22, 2017 at 11:18:48PM +0800, Icenowy Zheng wrote:
> > > +config SUNXI_DE2_CCU
> > > + bool "Support for the Allwinner SoCs DE2 CCU"
> > > + select SUNXI_CCU_DIV
> > > + select SUNXI_CCU_GATE
> > > + default n
> >=20
> > This is already the default.
>=20
> P.S. I in fact want it default DRM_SUN4I_DE2.
>=20
> > > +
> > >
> > >  endif
> > >
> > > diff --git a/drivers/clk/sunxi-ng/Makefile
> > > b/drivers/clk/sunxi-ng/Makefile
> > > index 6feaac0c5600..1d36c40384a6 100644
> > > --- a/drivers/clk/sunxi-ng/Makefile
> > > +++ b/drivers/clk/sunxi-ng/Makefile
> > > @@ -28,3 +28,4 @@ obj-$(CONFIG_SUN8I_V3S_CCU) +=3D ccu-sun8i-v3s.o
> > >
> > >  obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80.o
> > >  obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80-de.o
> > >  obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80-usb.o
> > >
> > > +obj-$(CONFIG_SUNXI_DE2_CCU) +=3D ccu-sunxi-de2.o
> >=20
> > sun8i-de2 please
>=20
> It also exists in sun50is.

Usual approach is to name it after the family where the IP block first=20
appeared.

Regards,
Jernej

>=20
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sunxi-de2.c
> > > b/drivers/clk/sunxi-ng/ccu-sunxi-de2.c new file mode 100644
> > > index 000000000000..4259c145d5da
> > > --- /dev/null
> > > +++ b/drivers/clk/sunxi-ng/ccu-sunxi-de2.c
> > > @@ -0,0 +1,204 @@
> > > +/*
> > > + * Copyright (c) 2016 Chen-Yu Tsai. All rights reserved.
> >=20
> > Wrong author?
>=20
> Oh I copied ccu-sun9i-a80-de.c...
>=20
> > > + *
> > > + * This software is licensed under the terms of the GNU General Publ=
ic
> > > + * License version 2, as published by the Free Software Foundation, =
and
> > > + * may be copied, distributed, and modified under those terms.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/reset.h>
> > > +
> > > +#include "ccu_common.h"
> > > +#include "ccu_div.h"
> > > +#include "ccu_gate.h"
> > > +#include "ccu_reset.h"
> > > +
> > > +#include "ccu-sunxi-de2.h"
> > > +
> > > +static SUNXI_CCU_GATE(bus_mixer0_clk, "bus-mixer0", "bus-de",
> > > +       0x04, BIT(0), 0);
> > > +static SUNXI_CCU_GATE(bus_mixer1_clk, "bus-mixer1", "bus-de",
> > > +       0x04, BIT(1), 0);
> > > +static SUNXI_CCU_GATE(bus_wb_clk, "bus-wb", "bus-de",
> > > +       0x04, BIT(2), 0);
> > > +
> > > +static SUNXI_CCU_GATE(mixer0_clk, "mixer0", "mixer0-div",
> > > +       0x00, BIT(0), CLK_SET_RATE_PARENT);
> > > +static SUNXI_CCU_GATE(mixer1_clk, "mixer1", "mixer1-div",
> > > +       0x00, BIT(1), CLK_SET_RATE_PARENT);
> > > +static SUNXI_CCU_GATE(wb_clk, "wb", "wb-div",
> > > +       0x00, BIT(2), CLK_SET_RATE_PARENT);
> > > +
> > > +static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
> > > +    CLK_SET_RATE_PARENT);
> > > +static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
> > > +    CLK_SET_RATE_PARENT);
> > > +static SUNXI_CCU_M(wb_div_clk, "wb-div", "de", 0x0c, 8, 4,
> > > +    CLK_SET_RATE_PARENT);
> > > +
> > > +static struct ccu_common *sunxi_de2_clks[] =3D {
> > > + &mixer0_clk.common,
> > > + &mixer1_clk.common,
> > > + &wb_clk.common,
> > > +
> > > + &bus_mixer0_clk.common,
> > > + &bus_mixer1_clk.common,
> > > + &bus_wb_clk.common,
> > > +
> > > + &mixer0_div_clk.common,
> > > + &mixer1_div_clk.common,
> > > + &wb_div_clk.common,
> > > +};
> > > +
> > > +static struct clk_hw_onecell_data sunxi_de2_hw_clks =3D {
> > > + .hws =3D {
> > > + [CLK_MIXER0] =3D &mixer0_clk.common.hw,
> > > + [CLK_MIXER1] =3D &mixer1_clk.common.hw,
> > > + [CLK_WB] =3D &wb_clk.common.hw,
> > > +
> > > + [CLK_BUS_MIXER0] =3D &bus_mixer0_clk.common.hw,
> > > + [CLK_BUS_MIXER1] =3D &bus_mixer1_clk.common.hw,
> > > + [CLK_BUS_WB] =3D &bus_wb_clk.common.hw,
> > > +
> > > + [CLK_MIXER0_DIV] =3D &mixer1_div_clk.common.hw,
> > > + [CLK_MIXER1_DIV] =3D &mixer0_div_clk.common.hw,
> > > + [CLK_WB_DIV] =3D &wb_div_clk.common.hw,
> > > + },
> > > + .num =3D CLK_NUMBER,
> > > +};
> > > +
> > > +static struct ccu_reset_map sun8i_a83t_de2_resets[] =3D {
> > > + [RST_MIXER0] =3D { 0x08, BIT(0) },
> > > + /*
> > > + * For A83T, H3 and R40, mixer1 reset line is shared with wb, so
> > > + * only RST_WB is exported here.
> > > + */
> > > + [RST_WB] =3D { 0x08, BIT(2) },
> > > +};
> > > +
> > > +static struct ccu_reset_map sun50i_a64_de2_resets[] =3D {
> > > + [RST_MIXER0] =3D { 0x08, BIT(0) },
> > > + [RST_MIXER1] =3D { 0x08, BIT(1) },
> > > + [RST_WB] =3D { 0x08, BIT(2) },
> > > +};
> > > +
> > > +static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc =3D {
> > > + .ccu_clks =3D sunxi_de2_clks,
> > > + .num_ccu_clks =3D ARRAY_SIZE(sunxi_de2_clks),
> > > +
> > > + .hw_clks =3D &sunxi_de2_hw_clks,
> > > +
> > > + .resets =3D sun8i_a83t_de2_resets,
> > > + .num_resets =3D ARRAY_SIZE(sun8i_a83t_de2_resets),
> > > +};
> > > +
> > > +static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc =3D {
> > > + .ccu_clks =3D sunxi_de2_clks,
> > > + .num_ccu_clks =3D ARRAY_SIZE(sunxi_de2_clks),
> > > +
> > > + .hw_clks =3D &sunxi_de2_hw_clks,
> > > +
> > > + .resets =3D sun50i_a64_de2_resets,
> > > + .num_resets =3D ARRAY_SIZE(sun50i_a64_de2_resets),
> > > +};
> > > +
> > > +static int sunxi_de2_clk_probe(struct platform_device *pdev)
> > > +{
> > > + struct resource *res;
> > > + struct clk *bus_clk;
> > > + struct reset_control *rstc;
> > > + void __iomem *reg;
> > > + const struct sunxi_ccu_desc *ccu_desc;
> > > + int ret;
> > > +
> > > + ccu_desc =3D of_device_get_match_data(&pdev->dev);
> > > + if (!ccu_desc)
> > > + return -EINVAL;
> > > +
> > > + res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > + reg =3D devm_ioremap_resource(&pdev->dev, res);
> > > + if (IS_ERR(reg))
> > > + return PTR_ERR(reg);
> > > +
> > > + bus_clk =3D devm_clk_get(&pdev->dev, "bus");
> > > + if (IS_ERR(bus_clk)) {
> > > + ret =3D PTR_ERR(bus_clk);
> > > + if (ret !=3D -EPROBE_DEFER)
> > > + dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);
> > > + return ret;
> > > + }
> > > +
> > > + rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > > + if (IS_ERR(rstc)) {
> > > + ret =3D PTR_ERR(bus_clk);
> > > + if (ret !=3D -EPROBE_DEFER)
> > > + dev_err(&pdev->dev,
> > > + "Couldn't get reset control: %d\n", ret);
> > > + return ret;
> > > + }
> > > +
> > > + /* The bus clock needs to be enabled for us to access the registers=
 */
> > > + ret =3D clk_prepare_enable(bus_clk);
> > > + if (ret) {
> > > + dev_err(&pdev->dev, "Couldn't enable bus clk: %d\n", ret);
> > > + return ret;
> > > + }
> >=20
> > That looks inefficient if none of the clocks are enabled. Maybe you
> > can use CLK_OPS_PARENT_ENABLE?
>=20
> Don't know about it... it's a simplified version of this func of A80 de c=
cu.
> > Thanks,
> > Maxime
> >=20
> > --
> > Maxime Ripard, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
> >=20
> > --
> > You received this message because you are subscribed to the Google Grou=
ps
> > "linux-sunxi" group. To unsubscribe from this group and stop receiving
> > emails from it, send an email to
> > linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org For more options, visit
> > https://groups.google.com/d/optout.
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group. To unsubscribe from this group and stop receiving
> emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org=
.
> For more options, visit https://groups.google.com/d/optout.


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
