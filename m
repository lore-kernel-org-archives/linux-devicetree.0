From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 2/4] clk: sunxi-ng: Add sun7i-a20 CCU driver
Date: Thu, 02 Mar 2017 13:54:27 +0800
Message-ID: <20170302085439.sTju7Mpu@smtp2o.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBKXH33CQKGQEOWICK2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=882=E6=97=A5 =E4=B8=8A=E5=8D=885:38=E4=BA=8E Priit Lae=
s <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 2017-02-28 at 09:21 +0100, Maxime Ripard wrote:=20
> > Hi,=20
> >=20
> > On Mon, Feb 27, 2017 at 11:09:12PM +0200, Priit Laes wrote:=20
> > > Introduce a clock controller driver for sun7i A20 SoC.=20
> > >=20
> > > > > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>=20
> > > ---=20
> > > =C2=A0drivers/clk/sunxi-ng/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A011 +=20
> > > =C2=A0drivers/clk/sunxi-ng/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A0=C2=A01 +=20
> > > =C2=A0drivers/clk/sunxi-ng/ccu-sun7i-a20.c | 1068 +++++++++++++++++++=
+++++++++++++++=20
> > > =C2=A0drivers/clk/sunxi-ng/ccu-sun7i-a20.h |=C2=A0=C2=A0121 ++++=20
> > > =C2=A04 files changed, 1201 insertions(+)=20
> > > =C2=A0create mode 100644 drivers/clk/sunxi-ng/ccu-sun7i-a20.c=20
> > > =C2=A0create mode 100644 drivers/clk/sunxi-ng/ccu-sun7i-a20.h=20
> > >=20
> > > diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kcon=
fig=20
> > > index 695bbf9..4f436ab 100644=20
> > > --- a/drivers/clk/sunxi-ng/Kconfig=20
> > > +++ b/drivers/clk/sunxi-ng/Kconfig=20
> > > @@ -85,6 +85,17 @@ config SUN6I_A31_CCU=20
> > > > > =C2=A0 select SUNXI_CCU_PHASE=20
> > > > > =C2=A0 default MACH_SUN6I=20
> > > =C2=A0=20
> > > +config SUN7I_A20_CCU=20
> > > > > + bool "Support for the Allwinner A20 CCU"=20
> > > > > + select SUNXI_CCU_DIV=20
> > > > > + select SUNXI_CCU_MULT=20
> > > > > + select SUNXI_CCU_NK=20
> > > > > + select SUNXI_CCU_NKM=20
> > > > > + select SUNXI_CCU_NM=20
> > > > > + select SUNXI_CCU_MP=20
> > > > > + select SUNXI_CCU_PHASE=20
> > > > > + default MACH_SUN7I=20
> > > +=20
> > > =C2=A0config SUN8I_A23_CCU=20
> > > > > =C2=A0 bool "Support for the Allwinner A23 CCU"=20
> > > > > =C2=A0 select SUNXI_CCU_DIV=20
> > > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Mak=
efile=20
> > > index 6feaac0..bedda5b 100644=20
> > > --- a/drivers/clk/sunxi-ng/Makefile=20
> > > +++ b/drivers/clk/sunxi-ng/Makefile=20
> > > > > @@ -21,6 +21,7 @@ obj-$(CONFIG_SUNXI_CCU_MP) +=3D ccu_mp.o=20
> > > > > =C2=A0obj-$(CONFIG_SUN50I_A64_CCU) +=3D ccu-sun50i-a64.o=20
> > > > > =C2=A0obj-$(CONFIG_SUN5I_CCU) +=3D ccu-sun5i.o=20
> > > > > =C2=A0obj-$(CONFIG_SUN6I_A31_CCU) +=3D ccu-sun6i-a31.o=20
> > > > > +obj-$(CONFIG_SUN7I_A20_CCU) +=3D ccu-sun7i-a20.o=20
> > > > > =C2=A0obj-$(CONFIG_SUN8I_A23_CCU) +=3D ccu-sun8i-a23.o=20
> > > > > =C2=A0obj-$(CONFIG_SUN8I_A33_CCU) +=3D ccu-sun8i-a33.o=20
> > > > > =C2=A0obj-$(CONFIG_SUN8I_H3_CCU) +=3D ccu-sun8i-h3.o=20
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun7i-a20.c b/drivers/clk/sunxi=
-ng/ccu-sun7i-a20.c=20
> > > new file mode 100644=20
> > > index 0000000..90d2f13=20
> > > --- /dev/null=20
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun7i-a20.c=20
> > > @@ -0,0 +1,1068 @@=20
> > > +/*=20
> > > + * Copyright (c) 2017 Priit Laes. All rights reserved.=20
> > > + *=20
> > > + * This software is licensed under the terms of the GNU General Publ=
ic=20
> > > + * License version 2, as published by the Free Software Foundation, =
and=20
> > > + * may be copied, distributed, and modified under those terms.=20
> > > + *=20
> > > + * This program is distributed in the hope that it will be useful,=
=20
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of=20
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0S=
ee the=20
> > > + * GNU General Public License for more details.=20
> > > + */=20
> > > +=20
> > > +#include <linux/clk-provider.h>=20
> > > +#include <linux/of_address.h>=20
> > > +=20
> > > +#include "ccu_common.h"=20
> > > +#include "ccu_reset.h"=20
> > > +=20
> > > +#include "ccu_div.h"=20
> > > +#include "ccu_gate.h"=20
> > > +#include "ccu_mp.h"=20
> > > +#include "ccu_mult.h"=20
> > > +#include "ccu_nk.h"=20
> > > +#include "ccu_nkm.h"=20
> > > +#include "ccu_nkmp.h"=20
> > > +#include "ccu_nm.h"=20
> > > +#include "ccu_phase.h"=20
> > > +=20
> > > +#include "ccu-sun7i-a20.h"=20
> > > +=20
> > > +/*=20
> > > + * PLL1 - Core clock=20
> > > + *=20
> > > + * TODO: sigma-delta pattern bits 2 & 3=20
> > > + * TODO: PLL1 tuning register=20
> >=20
> > I don't think we need those TODO's at all, and these comments too. If=
=20
> > the clock name is good enough (and it is), it's redundant.=20
>
> Ok, will clean them up.=20
>
> >=20
> > > + */=20
> > >=20
> [...]=20
> > > +};=20
> > > +=20
> > > +/* PLL2 - Audio clock */=20
> > > +static struct ccu_nm pll_audio_base_clk =3D {=20
> > > > > > > + .enable =3D BIT(31),=20
> > > > > > > + .n =3D _SUNXI_CCU_MULT_OFFSET(8, 7, 0),=20
> > > > > > > + .m =3D _SUNXI_CCU_DIV_OFFSET(0, 5, 0),=20
> > > > > > > + .common =3D {=20
> > > > > > > + .reg =3D 0x008,=20
> > > > > > > + .hw.init =3D CLK_HW_INIT("pll-audio-base",=20
> > > > > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"hosc",=20
> > > > > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&ccu_nm_ops,=20
> > > > > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00),=20
> > > > > + },=20
> > > +=20
> > > +};=20
> >=20
> > You're forgetting the post-divider here=20
>
> It's hardcoded to 4 during ccu initialization, similar to what is done=20
> on the other SoCs (A13, A31..).=20
>
> >=20
> > > +/* TODO: pll8 gpu 0x040 */=20
> >=20
> > Please add all the clocks.=20
>
> I'm not really comfortable adding clocks for blocks that currently lack=
=20
> drivers.=20
>

1. CCU driver should implement all clocks in a CCU, as it may be needed som=
e day.
2. We really have driver for mali, at least kernel part :-)

> > > +/* BIT(21 .. 31) - reserved */=20
> >=20
> > I'm not sure we need those comments either.=20
> >=20
> > > +/*=20
> > > + * TODO: SATA clock also supports external clock as parent.=20
> > > + * Currently we default to using PLL6 SATA gate.=20
> > > + */=20
> >=20
> > Which external clock? It should be modelled anyway. If we have a=20
> > dependency on some other clock, it should be in our DT binding, and=20
> > listed in the mux there.=20
> >=20
> > Otherwise, the clock framework will not be able to deal with that mux=
=20
> > being already set by the bootloader, and if we need to support that=20
> > clock in the future, our binding will be ready for it.=20
>
> I wish I knew which clock they're talking about..=20
>
> User manuals (A10/A20) only specify following in the clock register=20
> description:=20
>
> BIT(24) - CLK_SRC_GATING, default 0x0=20
> Clock Source Select:=20
> 0: PLL6 for SATA(100MHz)=20
> 1: External Clock=20
>
> There's no section for SATA=C2=A0(called NC) in A10 manual, and in A20=20
> manual only contains list of SATA/AHCI features.=20
>
>
> >=20
> > > +static CLK_FIXED_FACTOR(pll_periph_2x_clk, "pll-periph-2x",=20
> > > > > + "pll-periph", 1, 2, CLK_SET_RATE_PARENT);=20
> > > +/* We hardcode the divider to 4 for now */=20
> > > +static CLK_FIXED_FACTOR(pll_audio_clk, "pll-audio",=20
> > > > > + "pll-audio-base", 4, 1, CLK_SET_RATE_PARENT);=20
> > > +static CLK_FIXED_FACTOR(pll_audio_2x_clk, "pll-audio-2x",=20
> > > > > + "pll-audio-base", 2, 1, CLK_SET_RATE_PARENT);=20
> > > +static CLK_FIXED_FACTOR(pll_audio_4x_clk, "pll-audio-4x",=20
> > > > > + "pll-audio-base", 1, 1, CLK_SET_RATE_PARENT);=20
> > > +static CLK_FIXED_FACTOR(pll_audio_8x_clk, "pll-audio-8x",=20
> > > > > + "pll-audio-base", 1, 2, CLK_SET_RATE_PARENT);=20
> > > +static CLK_FIXED_FACTOR(pll_video0_2x_clk, "pll-video0-2x",=20
> > > > > + "pll-video0", 1, 2, CLK_SET_RATE_PARENT);=20
> > > +static CLK_FIXED_FACTOR(pll_video1_2x_clk, "pll-video1-2x",=20
> > > + "pll-video1", 1, 2, CLK_SET_RATE_PARENT);=20
> >=20
> > It feels more natural to just have the clocks defined in the same=20
> > order than their parents. So periph shouldn't be first=20
>
> Ok, will move the periph clock after the video.=20
>
> > > +static struct ccu_reset_map sun7i_a20_ccu_resets[] =3D {=20
> > > +=20
> > > > > > > + [RST_USB_PHY0] =3D { 0x0cc, BIT(0) },=20
> > > > > > > + [RST_USB_PHY1] =3D { 0x0cc, BIT(1) },=20
> > > > > > > + [RST_USB_PHY2] =3D { 0x0cc, BIT(2) },=20
> > > > > > > + [RST_DE_BE0] =3D { 0x104, BIT(30) },=20
> > > > > > > + [RST_DE_BE1] =3D { 0x108, BIT(30) },=20
> > > > > > > + [RST_DE_FE0] =3D { 0x10c, BIT(30) },=20
> > > > > > > + [RST_DE_FE1] =3D { 0x110, BIT(30) },=20
> > > > > > > + [RST_DE_MP] =3D { 0x114, BIT(30) },=20
> > > > > > > + [RST_TCON0] =3D { 0x118, BIT(30) },=20
> > > > > > > + [RST_TCON1] =3D { 0x11c, BIT(30) },=20
> > > > > > > + [RST_CSI0] =3D { 0x134, BIT(30) },=20
> > > > > > > + [RST_CSI1] =3D { 0x138, BIT(30) },=20
> > > > > > > + [RST_VE] =3D { 0x13c, BIT(0) },=20
> > > > > > > + [RST_ACE] =3D { 0x148, BIT(16) },=20
> > > > > > > + [RST_LVDS] =3D { 0x14c, BIT(0) },=20
> > > > > > > + [RST_GPU] =3D { 0x154, BIT(30) },=20
> > > > > > > + [RST_HDMI_H] =3D { 0x170, BIT(0) },=20
> > > > > > > + [RST_HDMI_SYS] =3D { 0x170, BIT(1) },=20
> > > > > > > + [RST_HDMI_AUDIO_DMA] =3D { 0x170, BIT(2) },=20
> > > +};=20
> > > +=20
> > > +static const struct sunxi_ccu_desc sun7i_a20_ccu_desc =3D {=20
> > > > > > > + .ccu_clks =3D sun7i_a20_ccu_clks,=20
> > > > > > > + .num_ccu_clks =3D ARRAY_SIZE(sun7i_a20_ccu_clks),=20
> > > +=20
> > > > > > > + .hw_clks =3D &sun7i_a20_hw_clks,=20
> > > +=20
> > > > > > > + .resets =3D sun7i_a20_ccu_resets,=20
> > > > > > > + .num_resets =3D ARRAY_SIZE(sun7i_a20_ccu_resets),=20
> > > +};=20
> > > +=20
> > > +static void __init sun7i_a20_ccu_setup(struct device_node *node)=20
> > > +{=20
> > > > > + void __iomem *reg;=20
> > > > > + u32 val;=20
> > > +=20
> > > > > + reg =3D of_io_request_and_map(node, 0, of_node_full_name(node))=
;=20
> > > > > + if (IS_ERR(reg)) {=20
> > > > > + pr_err("%s: Could not map the clock registers\n",=20
> > > > > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_node_full_name(nod=
e));=20
> > > > > + return;=20
> > > > > + }=20
> > > +=20
> > > + #define SUN7I_PLL_AUDIO_REG 0x008=20
> >=20
> > This should be defined above=20
>
> Will do..=20
> >=20
> > > +=20
> > > > > + /* Force the PLL-Audio-1x divider to 4 */=20
> > > > > + val =3D readl(reg + SUN7I_PLL_AUDIO_REG);=20
> > > > > + val &=3D ~GENMASK(19, 16);=20
> > > > > + writel(val | (3 << 16), reg + SUN7I_PLL_AUDIO_REG);=20
> > > +=20
> > > > > + /*=20
> > > > > + =C2=A0* Use PLL6 as parent for AHB=20
> > > + =C2=A0* CPU/AXI clock changes rate when cpufreq is enabled=20
> >=20
> > I'm not sure why that last sentence is needed too. A lot of clock=20
> > listed there change rate when <some-feature> is enabled.=20
>
> Will remove.=20
>
> >=20
> > > +/* Some AHB gates are exported */=20
> > > > > +#define CLK_AHB_BIST 31=20
> > > > > +#define CLK_AHB_MS 36=20
> > > > > +#define CLK_AHB_SDRAM 38=20
> > > > > +#define CLK_AHB_ACE 39=20
> > > > > +#define CLK_AHB_TS 41=20
> > > > > +#define CLK_AHB_VE 48=20
> > > > > +#define CLK_AHB_TVD 49=20
> > > > > +#define CLK_AHB_TVE1 51=20
> > > > > +#define CLK_AHB_LCD1 53=20
> > > > > +#define CLK_AHB_CSI0 54=20
> > > > > +#define CLK_AHB_CSI1 55=20
> > > > > +#define CLK_AHB_HDMI0 56=20
> > > > > +#define CLK_AHB_DE_BE1 59=20
> > > > > +#define CLK_AHB_DE_FE0 60=20
> > > > > +#define CLK_AHB_DE_FE1 61=20
> > > > > +#define CLK_AHB_MP 63=20
> > > > > +#define CLK_AHB_GPU 64=20
> > > +=20
> > > +/* Some APB0 gates are exported */=20
> > > > > +#define CLK_APB0_AC97 67=20
> > > > > +#define CLK_APB0_KEYPAD 74=20
> > > +=20
> > > +/* Some APB1 gates are exported */=20
> > > > > +#define CLK_APB1_CAN 79=20
> > > > > +#define CLK_APB1_SCR 80=20
> > > +=20
> > > +/* Some IP module clocks are exported */=20
> > > > > +#define CLK_MS 93=20
> > > > > +#define CLK_TS 106=20
> > > > > +#define CLK_PATA 111=20
> > > > > +#define CLK_AC97 115=20
> > > > > +#define CLK_KEYPAD 117=20
> > > > > +#define CLK_SATA 118=20
> > > +=20
> > > +/* Some DRAM gates are exported */=20
> > > > > +#define CLK_DRAM_VE 125=20
> > > > > +#define CLK_DRAM_CSI0 126=20
> > > > > +#define CLK_DRAM_CSI1 127=20
> > > > > +#define CLK_DRAM_TS 128=20
> > > > > +#define CLK_DRAM_TVD 129=20
> > > > > +#define CLK_DRAM_TVE1 131=20
> > > > > +#define CLK_DRAM_OUT 132=20
> > > > > +#define CLK_DRAM_DE_FE1 133=20
> > > > > +#define CLK_DRAM_DE_FE0 134=20
> > > > > +#define CLK_DRAM_DE_BE1 136=20
> > > > > +#define CLK_DRAM_MP 137=20
> > > > > +#define CLK_DRAM_ACE 138=20
> > > +=20
> > > > > +#define CLK_DE_BE1 140=20
> > > > > +#define CLK_DE_FE0 141=20
> > > > > +#define CLK_DE_FE1 142=20
> > > > > +#define CLK_DE_MP 143=20
> > > > > +#define CLK_TCON1_CH0 145=20
> > > > > +#define CLK_CSI_SPECIAL 146=20
> > > > > +#define CLK_TVD 147=20
> > > > > +#define CLK_TCON0_CH1_SCLK2 148=20
> > > > > +#define CLK_TCON1_CH1_SCLK2 150=20
> > > > > +#define CLK_TCON1_CH1 151=20
> > > > > +#define CLK_CSI0 152=20
> > > > > +#define CLK_CSI1 153=20
> > > > > +#define CLK_VE 154=20
> > > > > +#define CLK_AVS 156=20
> > > > > +#define CLK_ACE 157=20
> > > > > +#define CLK_HDMI 158=20
> > > > > +#define CLK_GPU 159=20
> > > > > +#define CLK_MBUS 160=20
> > > > > +#define CLK_HDMI1_SLOW 161=20
> > > > > +#define CLK_HDMI1_REPEAT 162=20
> > > > > +#define CLK_OUT_A 163=20
> > > +#define CLK_OUT_B 164=20
> >=20
> > Is there a reason not to expose these clocks?=20
>
> I exposed them on need to have basis. And basically did one-to-one=20
> conversion from devicetree.=20
>
> P=C3=A4ikest,=20
> Priit=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
