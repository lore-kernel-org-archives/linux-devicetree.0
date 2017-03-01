From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: Re: [PATCH 2/4] clk: sunxi-ng: Add sun7i-a20 CCU driver
Date: Wed, 01 Mar 2017 23:38:14 +0200
Message-ID: <1488404294.29650.3.camel@plaes.org>
References: <20170227210914.18954-1-plaes@plaes.org>
	 <20170227210914.18954-3-plaes@plaes.org>
	 <20170228082108.cthaanfuffbwbkaf@lukather>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBB2763TCQKGQEAEPCJVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170228082108.cthaanfuffbwbkaf@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-02-28 at 09:21 +0100, Maxime Ripard wrote:
> Hi,
>=20
> On Mon, Feb 27, 2017 at 11:09:12PM +0200, Priit Laes wrote:
> > Introduce a clock controller driver for sun7i A20 SoC.
> >=20
> > > > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> > ---
> > =C2=A0drivers/clk/sunxi-ng/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A011 +
> > =C2=A0drivers/clk/sunxi-ng/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A0=C2=A01 +
> > =C2=A0drivers/clk/sunxi-ng/ccu-sun7i-a20.c | 1068 +++++++++++++++++++++=
+++++++++++++
> > =C2=A0drivers/clk/sunxi-ng/ccu-sun7i-a20.h |=C2=A0=C2=A0121 ++++
> > =C2=A04 files changed, 1201 insertions(+)
> > =C2=A0create mode 100644 drivers/clk/sunxi-ng/ccu-sun7i-a20.c
> > =C2=A0create mode 100644 drivers/clk/sunxi-ng/ccu-sun7i-a20.h
> >=20
> > diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfi=
g
> > index 695bbf9..4f436ab 100644
> > --- a/drivers/clk/sunxi-ng/Kconfig
> > +++ b/drivers/clk/sunxi-ng/Kconfig
> > @@ -85,6 +85,17 @@ config SUN6I_A31_CCU
> > > > =C2=A0	select SUNXI_CCU_PHASE
> > > > =C2=A0	default MACH_SUN6I
> > =C2=A0
> > +config SUN7I_A20_CCU
> > > > +	bool "Support for the Allwinner A20 CCU"
> > > > +	select SUNXI_CCU_DIV
> > > > +	select SUNXI_CCU_MULT
> > > > +	select SUNXI_CCU_NK
> > > > +	select SUNXI_CCU_NKM
> > > > +	select SUNXI_CCU_NM
> > > > +	select SUNXI_CCU_MP
> > > > +	select SUNXI_CCU_PHASE
> > > > +	default MACH_SUN7I
> > +
> > =C2=A0config SUN8I_A23_CCU
> > > > =C2=A0	bool "Support for the Allwinner A23 CCU"
> > > > =C2=A0	select SUNXI_CCU_DIV
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index 6feaac0..bedda5b 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > > > @@ -21,6 +21,7 @@ obj-$(CONFIG_SUNXI_CCU_MP)	+=3D ccu_mp.o
> > > > =C2=A0obj-$(CONFIG_SUN50I_A64_CCU)	+=3D ccu-sun50i-a64.o
> > > > =C2=A0obj-$(CONFIG_SUN5I_CCU)		+=3D ccu-sun5i.o
> > > > =C2=A0obj-$(CONFIG_SUN6I_A31_CCU)	+=3D ccu-sun6i-a31.o
> > > > +obj-$(CONFIG_SUN7I_A20_CCU)	+=3D ccu-sun7i-a20.o
> > > > =C2=A0obj-$(CONFIG_SUN8I_A23_CCU)	+=3D ccu-sun8i-a23.o
> > > > =C2=A0obj-$(CONFIG_SUN8I_A33_CCU)	+=3D ccu-sun8i-a33.o
> > > > =C2=A0obj-$(CONFIG_SUN8I_H3_CCU)	+=3D ccu-sun8i-h3.o
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun7i-a20.c b/drivers/clk/sunxi-n=
g/ccu-sun7i-a20.c
> > new file mode 100644
> > index 0000000..90d2f13
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun7i-a20.c
> > @@ -0,0 +1,1068 @@
> > +/*
> > + * Copyright (c) 2017 Priit Laes. All rights reserved.
> > + *
> > + * This software is licensed under the terms of the GNU General Public
> > + * License version 2, as published by the Free Software Foundation, an=
d
> > + * may be copied, distributed, and modified under those terms.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See=
 the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of_address.h>
> > +
> > +#include "ccu_common.h"
> > +#include "ccu_reset.h"
> > +
> > +#include "ccu_div.h"
> > +#include "ccu_gate.h"
> > +#include "ccu_mp.h"
> > +#include "ccu_mult.h"
> > +#include "ccu_nk.h"
> > +#include "ccu_nkm.h"
> > +#include "ccu_nkmp.h"
> > +#include "ccu_nm.h"
> > +#include "ccu_phase.h"
> > +
> > +#include "ccu-sun7i-a20.h"
> > +
> > +/*
> > + * PLL1 - Core clock
> > + *
> > + * TODO: sigma-delta pattern bits 2 & 3
> > + * TODO: PLL1 tuning register
>=20
> I don't think we need those TODO's at all, and these comments too. If
> the clock name is good enough (and it is), it's redundant.

Ok, will clean them up.

>=20
> > + */
> >=20
[...]
> > +};
> > +
> > +/* PLL2 - Audio clock */
> > +static struct ccu_nm pll_audio_base_clk =3D {
> > > > > > +	.enable		=3D BIT(31),
> > > > > > +	.n		=3D _SUNXI_CCU_MULT_OFFSET(8, 7, 0),
> > > > > > +	.m		=3D _SUNXI_CCU_DIV_OFFSET(0, 5, 0),
> > > > > > +	.common		=3D {
> > > > > > +		.reg		=3D 0x008,
> > > > > > +		.hw.init	=3D CLK_HW_INIT("pll-audio-base",
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"hosc",
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&ccu_nm_ops,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00),
> > > > +	},
> > +
> > +};
>=20
> You're forgetting the post-divider here

It's hardcoded to 4 during ccu initialization, similar to what is done
on the other SoCs (A13, A31..).

>=20
> > +/* TODO: pll8 gpu 0x040 */
>=20
> Please add all the clocks.

I'm not really comfortable adding clocks for blocks that currently lack
drivers.

> > +/* BIT(21 .. 31) - reserved */
>=20
> I'm not sure we need those comments either.
>=20
> > +/*
> > + * TODO: SATA clock also supports external clock as parent.
> > + * Currently we default to using PLL6 SATA gate.
> > + */
>=20
> Which external clock? It should be modelled anyway. If we have a
> dependency on some other clock, it should be in our DT binding, and
> listed in the mux there.
>=20
> Otherwise, the clock framework will not be able to deal with that mux
> being already set by the bootloader, and if we need to support that
> clock in the future, our binding will be ready for it.

I wish I knew which clock they're talking about..

User manuals (A10/A20) only specify following in the clock register
description:

BIT(24) - CLK_SRC_GATING, default 0x0
Clock Source Select:
0: PLL6 for SATA(100MHz)
1: External Clock

There's no section for SATA=C2=A0(called NC) in A10 manual, and in A20
manual only contains list of SATA/AHCI features.


>=20
> > +static CLK_FIXED_FACTOR(pll_periph_2x_clk, "pll-periph-2x",
> > > > +			"pll-periph", 1, 2, CLK_SET_RATE_PARENT);
> > +/* We hardcode the divider to 4 for now */
> > +static CLK_FIXED_FACTOR(pll_audio_clk, "pll-audio",
> > > > +			"pll-audio-base", 4, 1, CLK_SET_RATE_PARENT);
> > +static CLK_FIXED_FACTOR(pll_audio_2x_clk, "pll-audio-2x",
> > > > +			"pll-audio-base", 2, 1, CLK_SET_RATE_PARENT);
> > +static CLK_FIXED_FACTOR(pll_audio_4x_clk, "pll-audio-4x",
> > > > +			"pll-audio-base", 1, 1, CLK_SET_RATE_PARENT);
> > +static CLK_FIXED_FACTOR(pll_audio_8x_clk, "pll-audio-8x",
> > > > +			"pll-audio-base", 1, 2, CLK_SET_RATE_PARENT);
> > +static CLK_FIXED_FACTOR(pll_video0_2x_clk, "pll-video0-2x",
> > > > +			"pll-video0", 1, 2, CLK_SET_RATE_PARENT);
> > +static CLK_FIXED_FACTOR(pll_video1_2x_clk, "pll-video1-2x",
> > +			"pll-video1", 1, 2, CLK_SET_RATE_PARENT);
>=20
> It feels more natural to just have the clocks defined in the same
> order than their parents. So periph shouldn't be first

Ok, will move the periph clock after the video.

> > +static struct ccu_reset_map sun7i_a20_ccu_resets[] =3D {
> > +
> > > > > > +	[RST_USB_PHY0]		=3D { 0x0cc, BIT(0) },
> > > > > > +	[RST_USB_PHY1]		=3D { 0x0cc, BIT(1) },
> > > > > > +	[RST_USB_PHY2]		=3D { 0x0cc, BIT(2) },
> > > > > > +	[RST_DE_BE0]		=3D { 0x104, BIT(30) },
> > > > > > +	[RST_DE_BE1]		=3D { 0x108, BIT(30) },
> > > > > > +	[RST_DE_FE0]		=3D { 0x10c, BIT(30) },
> > > > > > +	[RST_DE_FE1]		=3D { 0x110, BIT(30) },
> > > > > > +	[RST_DE_MP]		=3D { 0x114, BIT(30) },
> > > > > > +	[RST_TCON0]		=3D { 0x118, BIT(30) },
> > > > > > +	[RST_TCON1]		=3D { 0x11c, BIT(30) },
> > > > > > +	[RST_CSI0]		=3D { 0x134, BIT(30) },
> > > > > > +	[RST_CSI1]		=3D { 0x138, BIT(30) },
> > > > > > +	[RST_VE]		=3D { 0x13c, BIT(0) },
> > > > > > +	[RST_ACE]		=3D { 0x148, BIT(16) },
> > > > > > +	[RST_LVDS]		=3D { 0x14c, BIT(0) },
> > > > > > +	[RST_GPU]		=3D { 0x154, BIT(30) },
> > > > > > +	[RST_HDMI_H]		=3D { 0x170, BIT(0) },
> > > > > > +	[RST_HDMI_SYS]		=3D { 0x170, BIT(1) },
> > > > > > +	[RST_HDMI_AUDIO_DMA]	=3D { 0x170, BIT(2) },
> > +};
> > +
> > +static const struct sunxi_ccu_desc sun7i_a20_ccu_desc =3D {
> > > > > > +	.ccu_clks	=3D sun7i_a20_ccu_clks,
> > > > > > +	.num_ccu_clks	=3D ARRAY_SIZE(sun7i_a20_ccu_clks),
> > +
> > > > > > +	.hw_clks	=3D &sun7i_a20_hw_clks,
> > +
> > > > > > +	.resets		=3D sun7i_a20_ccu_resets,
> > > > > > +	.num_resets	=3D ARRAY_SIZE(sun7i_a20_ccu_resets),
> > +};
> > +
> > +static void __init sun7i_a20_ccu_setup(struct device_node *node)
> > +{
> > > > +	void __iomem *reg;
> > > > +	u32 val;
> > +
> > > > +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > > > +	if (IS_ERR(reg)) {
> > > > +		pr_err("%s: Could not map the clock registers\n",
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_node_full_name(node=
));
> > > > +		return;
> > > > +	}
> > +
> > +	#define SUN7I_PLL_AUDIO_REG	0x008
>=20
> This should be defined above

Will do..
>=20
> > +
> > > > +	/* Force the PLL-Audio-1x divider to 4 */
> > > > +	val =3D readl(reg + SUN7I_PLL_AUDIO_REG);
> > > > +	val &=3D ~GENMASK(19, 16);
> > > > +	writel(val | (3 << 16), reg + SUN7I_PLL_AUDIO_REG);
> > +
> > > > +	/*
> > > > +	=C2=A0* Use PLL6 as parent for AHB
> > +	=C2=A0* CPU/AXI clock changes rate when cpufreq is enabled
>=20
> I'm not sure why that last sentence is needed too. A lot of clock
> listed there change rate when <some-feature> is enabled.

Will remove.

>=20
> > +/* Some AHB gates are exported */
> > > > +#define CLK_AHB_BIST		31
> > > > +#define CLK_AHB_MS		36
> > > > +#define CLK_AHB_SDRAM		38
> > > > +#define CLK_AHB_ACE		39
> > > > +#define CLK_AHB_TS		41
> > > > +#define CLK_AHB_VE		48
> > > > +#define CLK_AHB_TVD		49
> > > > +#define CLK_AHB_TVE1		51
> > > > +#define CLK_AHB_LCD1		53
> > > > +#define CLK_AHB_CSI0		54
> > > > +#define CLK_AHB_CSI1		55
> > > > +#define CLK_AHB_HDMI0		56
> > > > +#define CLK_AHB_DE_BE1		59
> > > > +#define CLK_AHB_DE_FE0		60
> > > > +#define CLK_AHB_DE_FE1		61
> > > > +#define CLK_AHB_MP		63
> > > > +#define CLK_AHB_GPU		64
> > +
> > +/* Some APB0 gates are exported */
> > > > +#define CLK_APB0_AC97		67
> > > > +#define CLK_APB0_KEYPAD		74
> > +
> > +/* Some APB1 gates are exported */
> > > > +#define CLK_APB1_CAN		79
> > > > +#define CLK_APB1_SCR		80
> > +
> > +/* Some IP module clocks are exported */
> > > > +#define CLK_MS			93
> > > > +#define CLK_TS			106
> > > > +#define CLK_PATA		111
> > > > +#define CLK_AC97		115
> > > > +#define CLK_KEYPAD		117
> > > > +#define CLK_SATA		118
> > +
> > +/* Some DRAM gates are exported */
> > > > +#define CLK_DRAM_VE		125
> > > > +#define CLK_DRAM_CSI0		126
> > > > +#define CLK_DRAM_CSI1		127
> > > > +#define CLK_DRAM_TS		128
> > > > +#define CLK_DRAM_TVD		129
> > > > +#define CLK_DRAM_TVE1		131
> > > > +#define CLK_DRAM_OUT		132
> > > > +#define CLK_DRAM_DE_FE1		133
> > > > +#define CLK_DRAM_DE_FE0		134
> > > > +#define CLK_DRAM_DE_BE1		136
> > > > +#define CLK_DRAM_MP		137
> > > > +#define CLK_DRAM_ACE		138
> > +
> > > > +#define CLK_DE_BE1		140
> > > > +#define CLK_DE_FE0		141
> > > > +#define CLK_DE_FE1		142
> > > > +#define CLK_DE_MP		143
> > > > +#define CLK_TCON1_CH0		145
> > > > +#define CLK_CSI_SPECIAL		146
> > > > +#define CLK_TVD			147
> > > > +#define CLK_TCON0_CH1_SCLK2	148
> > > > +#define CLK_TCON1_CH1_SCLK2	150
> > > > +#define CLK_TCON1_CH1		151
> > > > +#define CLK_CSI0		152
> > > > +#define CLK_CSI1		153
> > > > +#define CLK_VE			154
> > > > +#define CLK_AVS			156
> > > > +#define CLK_ACE			157
> > > > +#define CLK_HDMI		158
> > > > +#define CLK_GPU			159
> > > > +#define CLK_MBUS		160
> > > > +#define CLK_HDMI1_SLOW		161
> > > > +#define CLK_HDMI1_REPEAT	162
> > > > +#define CLK_OUT_A		163
> > +#define CLK_OUT_B		164
>=20
> Is there a reason not to expose these clocks?

I exposed them on need to have basis. And basically did one-to-one
conversion from devicetree.

P=C3=A4ikest,
Priit

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
