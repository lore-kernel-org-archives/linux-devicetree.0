From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 2/8] clk: sunxi-ng: add support for DE2 CCU
Date: Thu, 23 Feb 2017 04:17:29 +0800
Message-ID: <20170222231754.Hm6O1qAk@smtp3j.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB7HDW7CQKGQEEZPIJ5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B42=E6=9C=8823=E6=97=A5 03:09=E4=BA=8E Maxime Ripard <maxime.rip=
ard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,=20
>
> On Wed, Feb 22, 2017 at 11:18:48PM +0800, Icenowy Zheng wrote:=20
> > +config SUNXI_DE2_CCU=20
> > + bool "Support for the Allwinner SoCs DE2 CCU"=20
> > + select SUNXI_CCU_DIV=20
> > + select SUNXI_CCU_GATE=20
> > + default n=20
>
> This is already the default.=20

P.S. I in fact want it default DRM_SUN4I_DE2.

>
> > +=20
> >=C2=A0 endif=20
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile=20
> > index 6feaac0c5600..1d36c40384a6 100644=20
> > --- a/drivers/clk/sunxi-ng/Makefile=20
> > +++ b/drivers/clk/sunxi-ng/Makefile=20
> > @@ -28,3 +28,4 @@ obj-$(CONFIG_SUN8I_V3S_CCU) +=3D ccu-sun8i-v3s.o=20
> >=C2=A0 obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80.o=20
> >=C2=A0 obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80-de.o=20
> >=C2=A0 obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80-usb.o=20
> > +obj-$(CONFIG_SUNXI_DE2_CCU) +=3D ccu-sunxi-de2.o=20
>
> sun8i-de2 please

It also exists in sun50is.

>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sunxi-de2.c b/drivers/clk/sunxi-n=
g/ccu-sunxi-de2.c=20
> > new file mode 100644=20
> > index 000000000000..4259c145d5da=20
> > --- /dev/null=20
> > +++ b/drivers/clk/sunxi-ng/ccu-sunxi-de2.c=20
> > @@ -0,0 +1,204 @@=20
> > +/*=20
> > + * Copyright (c) 2016 Chen-Yu Tsai. All rights reserved.=20
>
> Wrong author?=20

Oh I copied ccu-sun9i-a80-de.c...

>
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
> > +#include <linux/clk.h>=20
> > +#include <linux/clk-provider.h>=20
> > +#include <linux/of_address.h>=20
> > +#include <linux/of_platform.h>=20
> > +#include <linux/platform_device.h>=20
> > +#include <linux/reset.h>=20
> > +=20
> > +#include "ccu_common.h"=20
> > +#include "ccu_div.h"=20
> > +#include "ccu_gate.h"=20
> > +#include "ccu_reset.h"=20
> > +=20
> > +#include "ccu-sunxi-de2.h"=20
> > +=20
> > +static SUNXI_CCU_GATE(bus_mixer0_clk, "bus-mixer0", "bus-de",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(0), 0);=20
> > +static SUNXI_CCU_GATE(bus_mixer1_clk, "bus-mixer1", "bus-de",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(1), 0);=20
> > +static SUNXI_CCU_GATE(bus_wb_clk, "bus-wb", "bus-de",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(2), 0);=20
> > +=20
> > +static SUNXI_CCU_GATE(mixer0_clk, "mixer0", "mixer0-div",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(0), CLK_SET_RATE_PARENT);=20
> > +static SUNXI_CCU_GATE(mixer1_clk, "mixer1", "mixer1-div",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(1), CLK_SET_RATE_PARENT);=20
> > +static SUNXI_CCU_GATE(wb_clk, "wb", "wb-div",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(2), CLK_SET_RATE_PARENT);=20
> > +=20
> > +static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,=20
> > + =C2=A0=C2=A0 CLK_SET_RATE_PARENT);=20
> > +static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,=20
> > + =C2=A0=C2=A0 CLK_SET_RATE_PARENT);=20
> > +static SUNXI_CCU_M(wb_div_clk, "wb-div", "de", 0x0c, 8, 4,=20
> > + =C2=A0=C2=A0 CLK_SET_RATE_PARENT);=20
> > +=20
> > +static struct ccu_common *sunxi_de2_clks[] =3D {=20
> > + &mixer0_clk.common,=20
> > + &mixer1_clk.common,=20
> > + &wb_clk.common,=20
> > +=20
> > + &bus_mixer0_clk.common,=20
> > + &bus_mixer1_clk.common,=20
> > + &bus_wb_clk.common,=20
> > +=20
> > + &mixer0_div_clk.common,=20
> > + &mixer1_div_clk.common,=20
> > + &wb_div_clk.common,=20
> > +};=20
> > +=20
> > +static struct clk_hw_onecell_data sunxi_de2_hw_clks =3D {=20
> > + .hws =3D {=20
> > + [CLK_MIXER0] =3D &mixer0_clk.common.hw,=20
> > + [CLK_MIXER1] =3D &mixer1_clk.common.hw,=20
> > + [CLK_WB] =3D &wb_clk.common.hw,=20
> > +=20
> > + [CLK_BUS_MIXER0] =3D &bus_mixer0_clk.common.hw,=20
> > + [CLK_BUS_MIXER1] =3D &bus_mixer1_clk.common.hw,=20
> > + [CLK_BUS_WB] =3D &bus_wb_clk.common.hw,=20
> > +=20
> > + [CLK_MIXER0_DIV] =3D &mixer1_div_clk.common.hw,=20
> > + [CLK_MIXER1_DIV] =3D &mixer0_div_clk.common.hw,=20
> > + [CLK_WB_DIV] =3D &wb_div_clk.common.hw,=20
> > + },=20
> > + .num =3D CLK_NUMBER,=20
> > +};=20
> > +=20
> > +static struct ccu_reset_map sun8i_a83t_de2_resets[] =3D {=20
> > + [RST_MIXER0] =3D { 0x08, BIT(0) },=20
> > + /*=20
> > + * For A83T, H3 and R40, mixer1 reset line is shared with wb, so=20
> > + * only RST_WB is exported here.=20
> > + */=20
> > + [RST_WB] =3D { 0x08, BIT(2) },=20
> > +};=20
> > +=20
> > +static struct ccu_reset_map sun50i_a64_de2_resets[] =3D {=20
> > + [RST_MIXER0] =3D { 0x08, BIT(0) },=20
> > + [RST_MIXER1] =3D { 0x08, BIT(1) },=20
> > + [RST_WB] =3D { 0x08, BIT(2) },=20
> > +};=20
> > +=20
> > +static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc =3D {=20
> > + .ccu_clks =3D sunxi_de2_clks,=20
> > + .num_ccu_clks =3D ARRAY_SIZE(sunxi_de2_clks),=20
> > +=20
> > + .hw_clks =3D &sunxi_de2_hw_clks,=20
> > +=20
> > + .resets =3D sun8i_a83t_de2_resets,=20
> > + .num_resets =3D ARRAY_SIZE(sun8i_a83t_de2_resets),=20
> > +};=20
> > +=20
> > +static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc =3D {=20
> > + .ccu_clks =3D sunxi_de2_clks,=20
> > + .num_ccu_clks =3D ARRAY_SIZE(sunxi_de2_clks),=20
> > +=20
> > + .hw_clks =3D &sunxi_de2_hw_clks,=20
> > +=20
> > + .resets =3D sun50i_a64_de2_resets,=20
> > + .num_resets =3D ARRAY_SIZE(sun50i_a64_de2_resets),=20
> > +};=20
> > +=20
> > +static int sunxi_de2_clk_probe(struct platform_device *pdev)=20
> > +{=20
> > + struct resource *res;=20
> > + struct clk *bus_clk;=20
> > + struct reset_control *rstc;=20
> > + void __iomem *reg;=20
> > + const struct sunxi_ccu_desc *ccu_desc;=20
> > + int ret;=20
> > +=20
> > + ccu_desc =3D of_device_get_match_data(&pdev->dev);=20
> > + if (!ccu_desc)=20
> > + return -EINVAL;=20
> > +=20
> > + res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=20
> > + reg =3D devm_ioremap_resource(&pdev->dev, res);=20
> > + if (IS_ERR(reg))=20
> > + return PTR_ERR(reg);=20
> > +=20
> > + bus_clk =3D devm_clk_get(&pdev->dev, "bus");=20
> > + if (IS_ERR(bus_clk)) {=20
> > + ret =3D PTR_ERR(bus_clk);=20
> > + if (ret !=3D -EPROBE_DEFER)=20
> > + dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);=20
> > + return ret;=20
> > + }=20
> > +=20
> > + rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);=20
> > + if (IS_ERR(rstc)) {=20
> > + ret =3D PTR_ERR(bus_clk);=20
> > + if (ret !=3D -EPROBE_DEFER)=20
> > + dev_err(&pdev->dev,=20
> > + "Couldn't get reset control: %d\n", ret);=20
> > + return ret;=20
> > + }=20
> > +=20
> > + /* The bus clock needs to be enabled for us to access the registers *=
/=20
> > + ret =3D clk_prepare_enable(bus_clk);=20
> > + if (ret) {=20
> > + dev_err(&pdev->dev, "Couldn't enable bus clk: %d\n", ret);=20
> > + return ret;=20
> > + }=20
>
> That looks inefficient if none of the clocks are enabled. Maybe you=20
> can use CLK_OPS_PARENT_ENABLE?=20

Don't know about it... it's a simplified version of this func of A80 de ccu=
.

>
> Thanks,=20
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
