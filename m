From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 2/2] clk: Add Aspeed G5 clock driver
Date: Fri, 15 Sep 2017 13:12:00 +0930
Message-ID: <1505446920.4080.13.camel@aj.id.au>
References: <20170823060957.31167-1-joel@jms.id.au>
         <20170823060957.31167-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-oi4bOF759sUmL9CyXzeY"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170823060957.31167-2-joel@jms.id.au>
Sender: linux-clk-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>
List-Id: devicetree@vger.kernel.org


--=-oi4bOF759sUmL9CyXzeY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-23 at 15:39 +0930, Joel Stanley wrote:
> This driver supports the ast2500 and derivative BMC SoCs from Aspeed.
>=20
> All of the important clocks are supported, with most non-essential ones
> also implemented where information is available. I am working with
> Aspeed to clear up some of the missing information, including the
> missing parent-sibling relationships.
>=20
> We need to know the rate of the apb clock in order to correctly program
> the clocksource driver, so the apb and it's parents are created in the
> CLK_OF_DECLARE_DRIVER callback.
>=20
> The rest of the clocks are created at normal driver probe time. I
> followed the Gemini driver's lead with using the regmap where I could,
> but also having a pointer to the base address for use with the common
> clock callbacks.
>=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/clk/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A012 +
> =C2=A0drivers/clk/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/clk/clk-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 547 +++++++++=
++++++++++++++++++++++

The patch subject suggests the implementation is specific to the G5
series SoC, but the name of the driver is generic. How similar are the
G4 and G5 clock devices? Is the intent to expand the implementation to
also cover the G4 series, or should this be renamed to something more
specific?

> =C2=A0include/dt-bindings/clock/aspeed-clock.h |=C2=A0=C2=A043 +++
> =C2=A04 files changed, 603 insertions(+)
> =C2=A0create mode 100644 drivers/clk/clk-aspeed.c
> =C2=A0create mode 100644 include/dt-bindings/clock/aspeed-clock.h
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 8611b0de01a0..c16b8da0b4ca 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -135,6 +135,18 @@ config COMMON_CLK_GEMINI
> > =C2=A0	=C2=A0=C2=A0This driver supports the SoC clocks on the Cortina S=
ystems Gemini
> > =C2=A0	=C2=A0=C2=A0platform, also known as SL3516 or CS3516.
> =C2=A0
> +config COMMON_CLK_ASPEED

The answer to the question above should probably influence the name of
the config symbol.

Andrew

> +	bool "Clock driver for Aspeed BMC SoCs"
> > +	depends on ARCH_ASPEED || COMPILE_TEST
> > +	default ARCH_ASPEED
> > +	select MFD_SYSCON
> > +	select RESET_CONTROLLER
> > +	---help---
> > +	=C2=A0=C2=A0This driver supports the SoC clocks on the Aspeed BMC pla=
tforms.
> +
> > +	=C2=A0=C2=A0Currently on the G5 series, such as the ast2500, is suppo=
rted by
> > +	=C2=A0=C2=A0this driver.
> +
> =C2=A0config COMMON_CLK_S2MPS11
> > =C2=A0	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
> > =C2=A0	depends on MFD_SEC_CORE || COMPILE_TEST
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index a625c002a810..58b440c31647 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> > @@ -26,6 +26,7 @@ obj-$(CONFIG_ARCH_CLPS711X)		+=3D clk-clps711x.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+=3D clk-cs2000-cp.o
> > =C2=A0obj-$(CONFIG_ARCH_EFM32)		+=3D clk-efm32gg.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_GEMINI)		+=3D clk-gemini.o
> > +obj-$(CONFIG_COMMON_CLK_ASPEED)		+=3D clk-aspeed.o
> > =C2=A0obj-$(CONFIG_ARCH_HIGHBANK)		+=3D clk-highbank.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_MAX77686)	+=3D clk-max77686.o
> > =C2=A0obj-$(CONFIG_ARCH_MB86S7X)		+=3D clk-mb86s7x.o
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> new file mode 100644
> index 000000000000..2c4483bdc3ca
> --- /dev/null
> +++ b/drivers/clk/clk-aspeed.c
> @@ -0,0 +1,547 @@
> +/*
> + * Copyright 2017 IBM Corporation
> + *
> > + * Joel Stanley <joel@jms.id.au>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#define pr_fmt(fmt) "clk-aspeed: " fmt
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/clock/aspeed-clock.h>
> +
> > +#define ASPEED_RESET_CTRL	0x04
> > +#define ASPEED_CLK_SELECTION	0x0c
> > +#define ASPEED_CLK_STOP_CTRL	0x0c
> > +#define ASPEED_MPLL_PARAM	0x20
> > +#define ASPEED_HPLL_PARAM	0x24
> > +#define ASPEED_MISC_CTRL	0x2c
> > +#define ASPEED_STRAP		0x70
> +
> +/* Globally visible clocks */
> +static DEFINE_SPINLOCK(aspeed_clk_lock);
> +
> +/* Keeps track of all clocks */
> +static struct clk_hw_onecell_data *aspeed_clk_data;
> +
> +/**
> + * struct aspeed_gate_data - Aspeed gated clocks
> + * @clock_idx: bit used to gate this clock in the clock register
> + * @reset_idx: bit used to reset this IP in the reset register. -1 if no
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0reset is required when enabling the clock
> + * @name: the clock name
> + * @parent_name: the name of the parent clock
> + * @flags: standard clock framework flags
> + */
> +struct aspeed_gate_data {
> > > +	u8		clock_idx;
> > > +	s8		reset_idx;
> > > +	const char	*name;
> > > +	const char	*parent_name;
> > > +	unsigned long	flags;
> +};
> +
> +/**
> + * struct aspeed_clk_gate - Aspeed specific clk_gate structure
> > + * @hw:		handle between common and hardware-specific interfaces
> > + * @reg:	register controlling gate
> > + * @clock_idx:	bit used to gate this clock in the clock register
> > + * @reset_idx:	bit used to reset this IP in the reset register. -1 if =
no
> > + *		reset is required when enabling the clock
> > + * @flags:	hardware-specific flags
> > + * @lock:	register lock
> + *
> + * Some of the clocks in the Aspeed SoC must be put in reset before enab=
ling.
> + * This modified version of clk_gate allows an optional reset bit to be
> + * specified.
> + */
> +struct aspeed_clk_gate {
> > > +	struct clk_hw	hw;
> > > +	struct regmap	*map;
> > > +	u8		clock_idx;
> > > +	s8		reset_idx;
> > > +	u8		flags;
> > > +	spinlock_t	*lock;
> +};
> +
> +#define to_aspeed_clk_gate(_hw) container_of(_hw, struct aspeed_clk_gate=
, hw)
> +
> +/* TODO: ask Aspeed about the actual parent data */
> +static const struct aspeed_gate_data aspeed_gates[] __initconst =3D {
> > > > > +/*	=C2=A0clk rst=C2=A0=C2=A0=C2=A0name			parent		flags	*/
> > > > +	{=C2=A0=C2=A00, -1, "eclk-gate",		"eclk",		0 }, /* Video Engine *=
/
> > > > +	{=C2=A0=C2=A01,=C2=A0=C2=A07, "gclk-gate",		NULL,		0 }, /* 2D eng=
ine */
> > > > +	{=C2=A0=C2=A02, -1, "mclk-gate",		"mpll",		CLK_IS_CRITICAL }, /* =
SDRAM */
> > > > +	{=C2=A0=C2=A03,=C2=A0=C2=A06, "vclk-gate",		NULL,		0 }, /* Video =
Capture */
> > > > +	{=C2=A0=C2=A04, 10, "bclk-gate",		"bclk",		0 }, /* PCIe/PCI */
> > > > +	{=C2=A0=C2=A05, -1, "dclk-gate",		NULL,		0 }, /* DAC */
> > > > +	{=C2=A0=C2=A06, -1, "refclk-gate",	"clkin",	CLK_IS_CRITICAL },
> > > > +	{=C2=A0=C2=A07,=C2=A0=C2=A03, "usb-port2-gate",	NULL,		0 }, /* US=
B2.0 Host port 2 */
> > > > +	{=C2=A0=C2=A08,=C2=A0=C2=A05, "lclk-gate",		NULL,		0 }, /* LPC */
> > > > +	{=C2=A0=C2=A09, 15, "usb-uhci-gate",	NULL,		0 }, /* USB1.1 (requi=
res port 2 enabled) */
> > > > +	{ 10, 13, "d1clk-gate",		NULL,		0 }, /* GFX CRT */
> > +	/* 11: reserved */
> > +	/* 12: reserved */
> > > > +	{ 13, 4,=C2=A0=C2=A0"yclk-gate",		NULL,		0 }, /* HAC */
> > > > +	{ 14, 14, "usb-port1-gate",	NULL,		0 }, /* USB2 hub/USB2 host por=
t 1/USB1.1 dev */
> > > > +	{ 15, -1, "uart1clk-gate",	"uart",		0 }, /* UART1 */
> > > > +	{ 16, -1, "uart2clk-gate",	"uart",		0 }, /* UART2 */
> > > > +	{ 17, -1, "uart5clk-gate",	"uart",		0 }, /* UART5 */
> > +	/* 18: reserved */
> > > > +	{ 19, -1, "espiclk-gate",	NULL,		0 }, /* eSPI */
> > > > +	{ 20, 11, "mac1clk-gate",	"clkin",	0 }, /* MAC1 */
> > > > +	{ 21, 12, "mac2clk-gate",	"clkin",	0 }, /* MAC2 */
> > +	/* 22: reserved */
> > +	/* 23: reserved */
> > > > +	{ 24, -1, "rsaclk-gate",	NULL,		0 }, /* RSA */
> > > > +	{ 25, -1, "uart3clk-gate",	"uart",		0 }, /* UART3 */
> > > > +	{ 26, -1, "uart4clk-gate",	"uart",		0 }, /* UART4 */
> > > > +	{ 27, 16, "sdclk-gate",		NULL,		0 }, /* SDIO/SD */
> > > > +	{ 28, -1, "lhclk-gate",		"lhclk",	0 }, /* LPC master/LPC+ */
> > +	/* 29: reserved */
> > +	/* 30: reserved */
> > +	/* 31: reserved */
> +};
> +
> +static const char * const eclk_parents[] =3D {"d1pll", "hpll", "mpll"};
> +
> +static const struct clk_div_table aspeed_mac_div_table[] =3D {
> > +	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
> > +	{ 0x1, 4 },
> > +	{ 0x2, 6 },
> > +	{ 0x3, 8 },
> > +	{ 0x4, 10 },
> > +	{ 0x5, 12 },
> > +	{ 0x6, 14 },
> > +	{ 0x7, 16 },
> > +	{ 0 }
> +};
> +
> +static const struct clk_div_table aspeed_div_table[] =3D {
> > +	{ 0x0, 4 },
> > +	{ 0x1, 8 },
> > +	{ 0x2, 12 },
> > +	{ 0x3, 16 },
> > +	{ 0x4, 20 },
> > +	{ 0x5, 24 },
> > +	{ 0x6, 28 },
> > +	{ 0x7, 32 },
> > +	{ 0 }
> +};
> +
> +static int aspeed_clk_enable(struct clk_hw *hw)
> +{
> > +	struct aspeed_clk_gate *gate =3D to_aspeed_clk_gate(hw);
> > +	unsigned long flags;
> > +	u32 clk =3D BIT(gate->clock_idx);
> > +	u32 rst =3D BIT(gate->reset_idx);
> +
> > +	spin_lock_irqsave(gate->lock, flags);
> +
> > +	if (gate->reset_idx >=3D 0) {
> > +		/* Put IP in reset */
> > +		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, rst);
> +
> > +		/* Delay 100us */
> > +		udelay(100);
> > +	}
> +
> > +	/* Enable clock */
> > +	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, 0);
> +
> > +	if (gate->reset_idx >=3D 0) {
> > +		/* Delay 10ms */
> > +		/* TODO: can we sleep here? */
> > +		msleep(10);
> +
> > +		/* Take IP out of reset */
> > +		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
> > +	}
> +
> > +	spin_unlock_irqrestore(gate->lock, flags);
> +
> > +	return 0;
> +}
> +
> +static void aspeed_clk_disable(struct clk_hw *hw)
> +{
> > +	struct aspeed_clk_gate *gate =3D to_aspeed_clk_gate(hw);
> > +	unsigned long flags;
> > +	u32 clk =3D BIT(gate->clock_idx);
> +
> > +	spin_lock_irqsave(gate->lock, flags);
> +
> > +	/* Disable clock */
> > +	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, clk);
> +
> > +	spin_unlock_irqrestore(gate->lock, flags);
> +}
> +
> +static int aspeed_clk_is_enabled(struct clk_hw *hw)
> +{
> > +	struct aspeed_clk_gate *gate =3D to_aspeed_clk_gate(hw);
> > +	u32 clk =3D BIT(gate->clock_idx);
> > +	u32 reg;
> +
> > +	regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
> +
> > +	return (reg & clk) ? 0 : 1;
> +}
> +
> +static const struct clk_ops aspeed_clk_gate_ops =3D {
> > +	.enable =3D aspeed_clk_enable,
> > +	.disable =3D aspeed_clk_disable,
> > +	.is_enabled =3D aspeed_clk_is_enabled,
> +};
> +
> +/**
> + * struct aspeed_reset - Aspeed reset controller
> + * @map: regmap to access the containing system controller
> + * @rcdev: reset controller device
> + */
> +struct aspeed_reset {
> > > +	struct regmap			*map;
> > > +	struct reset_controller_dev	rcdev;
> +};
> +
> +#define to_aspeed_reset(p) container_of((p), struct aspeed_reset, rcdev)
> +
> +static const u8 aspeed_resets[] =3D {
> > +	25, /* x-dma */
> > +	24, /* mctp */
> > +	23, /* adc */
> > +	22, /* jtag-master */
> > +	18, /* mic */
> > +	=C2=A09, /* pwm */
> > +	=C2=A08, /* pci-vga */
> > +	=C2=A02, /* i2c */
> > +	=C2=A01, /* ahb */
> +};
> +
> +static int aspeed_reset_deassert(struct reset_controller_dev *rcdev,
> > +				=C2=A0unsigned long id)
> +{
> > +	struct aspeed_reset *ar =3D to_aspeed_reset(rcdev);
> > +	u32 rst =3D BIT(aspeed_resets[id]);
> +
> > +	return regmap_update_bits(ar->map, ASPEED_RESET_CTRL, rst, 0);
> +}
> +
> +static int aspeed_reset_assert(struct reset_controller_dev *rcdev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long id)
> +{
> > +	struct aspeed_reset *ar =3D to_aspeed_reset(rcdev);
> > +	u32 rst =3D BIT(aspeed_resets[id]);
> +
> > +	return regmap_update_bits(ar->map, ASPEED_RESET_CTRL, rst, rst);
> +}
> +
> +static int aspeed_reset_status(struct reset_controller_dev *rcdev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long id)
> +{
> > +	struct aspeed_reset *ar =3D to_aspeed_reset(rcdev);
> > +	u32 val, rst =3D BIT(aspeed_resets[id]);
> > +	int ret;
> +
> > +	ret =3D regmap_read(ar->map, ASPEED_RESET_CTRL, &val);
> > +	if (ret)
> > +		return ret;
> +
> > +	return !!(val & rst);
> +}
> +
> +static const struct reset_control_ops aspeed_reset_ops =3D {
> > +	.assert =3D aspeed_reset_assert,
> > +	.deassert =3D aspeed_reset_deassert,
> > +	.status =3D aspeed_reset_status,
> +};
> +
> +static struct clk_hw *aspeed_clk_hw_register_gate(struct device *dev,
> > +		const char *name, const char *parent_name, unsigned long flags,
> > +		struct regmap *map, u8 clock_idx, u8 reset_idx,
> > +		u8 clk_gate_flags, spinlock_t *lock)
> +{
> > +	struct aspeed_clk_gate *gate;
> > +	struct clk_init_data init;
> > +	struct clk_hw *hw;
> > +	int ret;
> +
> > +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> > +	if (!gate)
> > +		return ERR_PTR(-ENOMEM);
> +
> > +	init.name =3D name;
> > +	init.ops =3D &aspeed_clk_gate_ops;
> > +	init.flags =3D flags | CLK_IS_BASIC;
> > +	init.parent_names =3D parent_name ? &parent_name : NULL;
> > +	init.num_parents =3D parent_name ? 1 : 0;
> +
> > +	gate->map =3D map;
> > +	gate->clock_idx =3D clock_idx;
> > +	gate->reset_idx =3D reset_idx;
> > +	gate->flags =3D clk_gate_flags;
> > +	gate->lock =3D lock;
> > +	gate->hw.init =3D &init;
> +
> > +	hw =3D &gate->hw;
> > +	ret =3D clk_hw_register(dev, hw);
> > +	if (ret) {
> > +		kfree(gate);
> > +		hw =3D ERR_PTR(ret);
> > +	}
> +
> > +	return hw;
> +}
> +
> +static struct clk_hw *aspeed_calc_pll(const char *name, u32 val)
> +{
> > +	unsigned int mult, div;
> +
> > +	if (val & BIT(20)) {
> > +		/* Pass through mode */
> > +		mult =3D div =3D 1;
> > +	} else {
> > +		/* F =3D clkin * [(M+1) / (N+1)] / (P + 1) */
> > +		u32 p =3D (val >> 13) & 0x3f;
> > +		u32 m =3D (val >> 5) & 0xff;
> > +		u32 n =3D val & 0x1f;
> +
> > +		mult =3D (m + 1) / (n + 1);
> > +		div =3D p + 1;
> > +	}
> +
> > +	return clk_hw_register_fixed_factor(NULL, name, "clkin", 0,
> > +			mult, div);
> +}
> +
> +static int __init aspeed_clk_probe(struct platform_device *pdev)
> +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct aspeed_reset *ar;
> > +	void __iomem *scu_base;
> > +	struct resource *res;
> > +	struct regmap *map;
> > +	struct clk_hw *hw;
> > +	u32 val, rate;
> > +	int i, ret;
> +
> > +	ar =3D devm_kzalloc(dev, sizeof(*ar), GFP_KERNEL);
> > +	if (!ar)
> > +		return -ENOMEM;
> +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	scu_base =3D devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(scu_base))
> > +		return PTR_ERR(scu_base);
> +
> > +	map =3D syscon_node_to_regmap(dev->of_node);
> > +	if (IS_ERR(map)) {
> > +		dev_err(dev, "no syscon regmap\n");
> > +		return PTR_ERR(map);
> > +	}
> +
> > +	ar->map =3D map;
> > +	ar->rcdev.owner =3D THIS_MODULE;
> > +	ar->rcdev.nr_resets =3D ARRAY_SIZE(aspeed_resets);
> > +	ar->rcdev.ops =3D &aspeed_reset_ops;
> > +	ar->rcdev.of_node =3D dev->of_node;
> +
> > +	ret =3D devm_reset_controller_register(dev, &ar->rcdev);
> > +	if (ret) {
> > +		dev_err(dev, "could not register reset controller\n");
> > +		return ret;
> > +	}
> +
> > +	/* UART clock div13 setting */
> > +	regmap_read(map, ASPEED_MISC_CTRL, &val);
> > +	if (val & BIT(12))
> > +		rate =3D 24000000 / 13;
> > +	else
> > +		rate =3D 24000000;
> > +	/* TODO: Find the parent data for the uart clock */
> > +	hw =3D clk_hw_register_fixed_rate(NULL, "uart", NULL, 0, rate);
> > +	aspeed_clk_data->hws[ASPEED_CLK_UART] =3D hw;
> +
> > +	/*
> > +	=C2=A0* Memory controller (M-PLL) PLL. This clock is configured by th=
e
> > +	=C2=A0* bootloader, and is exposed to Linux as a read-only clock rate=
.
> > +	=C2=A0*/
> > +	regmap_read(map, ASPEED_MPLL_PARAM, &val);
> > > +	aspeed_clk_data->hws[ASPEED_CLK_MPLL] =3D	aspeed_calc_pll("mpll", v=
al);
> +
> > +	/* SD/SDIO clock divider (TODO: There's a gate too) */
> > +	hw =3D clk_hw_register_divider_table(NULL, "sdio", "hpll", 0,
> > +			scu_base + ASPEED_CLK_SELECTION, 12, 3, 0,
> > +			aspeed_div_table,
> > +			&aspeed_clk_lock);
> > +	aspeed_clk_data->hws[ASPEED_CLK_SDIO] =3D hw;
> +
> > +	/* MAC AHB bus clock divider */
> > +	hw =3D clk_hw_register_divider_table(NULL, "mac", "hpll", 0,
> > +			scu_base + ASPEED_CLK_SELECTION, 16, 3, 0,
> > +			aspeed_mac_div_table,
> > +			&aspeed_clk_lock);
> > +	aspeed_clk_data->hws[ASPEED_CLK_MAC] =3D hw;
> +
> > +	/* LPC Host (LHCLK) clock divider */
> > +	hw =3D clk_hw_register_divider_table(NULL, "lhclk", "hpll", 0,
> > +			scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,
> > +			aspeed_div_table,
> > +			&aspeed_clk_lock);
> > +	aspeed_clk_data->hws[ASPEED_CLK_LHCLK] =3D hw;
> +
> > +	/* Video Engine (ECLK) mux and clock divider */
> > +	hw =3D clk_hw_register_mux(NULL, "eclk_mux",
> > +			eclk_parents, ARRAY_SIZE(eclk_parents), 0,
> > +			scu_base + ASPEED_CLK_SELECTION, 2, 2,
> > +			0, &aspeed_clk_lock);
> > +	aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] =3D hw;
> > +	hw =3D clk_hw_register_divider_table(NULL, "eclk", "eclk_mux", 0,
> > +			scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,
> > +			aspeed_div_table,
> > +			&aspeed_clk_lock);
> > +	aspeed_clk_data->hws[ASPEED_CLK_ECLK] =3D hw;
> +
> > +	/* P-Bus (BCLK) clock divider */
> > +	hw =3D clk_hw_register_divider_table(NULL, "bclk", "hpll", 0,
> > +			scu_base + ASPEED_CLK_SELECTION, 0, 2, 0,
> > +			aspeed_div_table,
> > +			&aspeed_clk_lock);
> > +	aspeed_clk_data->hws[ASPEED_CLK_BCLK] =3D hw;
> +
> > +	/* There are a number of clocks that not included in this driver as
> > +	=C2=A0* more information is required:
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0D2-PLL
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0D-PLL
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0YCLK
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0RGMII
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0RMII
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0UART[1..5] clock source mux
> > +	=C2=A0*/
> +
> > +	for (i =3D 0; i < ARRAY_SIZE(aspeed_gates); i++) {
> > +		const struct aspeed_gate_data *gd;
> +
> > +		gd =3D &aspeed_gates[i];
> > +		aspeed_clk_data->hws[ASPEED_CLK_GATES + i] =3D
> > +			aspeed_clk_hw_register_gate(NULL, gd->name,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gd->parent_name,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gd->flags,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0map,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gd->clock_idx,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gd->reset_idx,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CLK_GATE_SET_TO_DISABLE,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&aspeed_clk_lock);
> > +	}
> +
> > +	return 0;
> +};
> +
> +static const struct of_device_id aspeed_clk_dt_ids[] =3D {
> > +	{ .compatible =3D "aspeed,ast2500-scu", },
> > +	{ },
> +};
> +
> +static struct platform_driver aspeed_clk_driver =3D {
> > +	.probe=C2=A0=C2=A0=3D aspeed_clk_probe,
> > +	.driver =3D {
> > +		.name =3D "aspeed-clk",
> > +		.of_match_table =3D aspeed_clk_dt_ids,
> > +		.suppress_bind_attrs =3D true,
> > +	},
> +};
> +builtin_platform_driver(aspeed_clk_driver);
> +
> +static void __init aspeed_cc_init(struct device_node *np)
> +{
> > +	struct regmap *map;
> > +	unsigned long freq;
> > +	struct clk_hw *hw;
> > +	unsigned int div;
> > +	u32 val;
> > +	int ret;
> > +	int i;
> +
> > +	aspeed_clk_data =3D kzalloc(sizeof(*aspeed_clk_data) +
> > +			sizeof(*aspeed_clk_data->hws) * ASPEED_NUM_CLKS,
> > +			GFP_KERNEL);
> > +	if (!aspeed_clk_data)
> > +		return;
> +
> > +	/*
> > +	=C2=A0* This way all clock fetched before the platform device probes,
> > +	=C2=A0* except those we assign here for early use, will be deferred.
> > +	=C2=A0*/
> > +	for (i =3D 0; i < ASPEED_NUM_CLKS; i++)
> > +		aspeed_clk_data->hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> +
> > +	map =3D syscon_node_to_regmap(np);
> > +	if (IS_ERR(map)) {
> > +		pr_err("no syscon regmap\n");
> > +		return;
> > +	}
> > +	/*
> > +	=C2=A0* We check that the regmap works on this very first access,
> > +	=C2=A0* but as this is an MMIO-backed regmap, subsequent regmap
> > +	=C2=A0* access is not going to fail and we skip error checks from
> > +	=C2=A0* this point.
> > +	=C2=A0*/
> > +	ret =3D regmap_read(map, ASPEED_STRAP, &val);
> > +	if (ret) {
> > +		pr_err("failed to read strapping register\n");
> > +		return;
> > +	}
> +
> > +	/* CLKIN is the crystal oscillator, 24 or 25MHz selected by strapping=
 */
> > +	if (val & BIT(23))
> > +		freq =3D 25000000;
> > +	else
> > +		freq =3D 24000000;
> > +	hw =3D clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
> > +	pr_debug("clkin @%lu MHz\n", freq / 1000000);
> +
> > +	/*
> > +	=C2=A0* High-speed PLL clock derived from the crystal. This the CPU c=
lock,
> > +	=C2=A0* and we assume that it is enabled
> > +	=C2=A0*/
> > +	regmap_read(map, ASPEED_HPLL_PARAM, &val);
> > +	aspeed_clk_data->hws[ASPEED_CLK_HPLL] =3D aspeed_calc_pll("hpll", val=
);
> +
> > +	/* Strap bits 11:9 define the AXI/AHB clock frequency ratio (aka HCLK=
)*/
> > +	regmap_read(map, ASPEED_STRAP, &val);
> > +	val =3D (val >> 9) & 0x7;
> > +	WARN_ON(val =3D=3D 0);
> > +	div =3D 2 * (val + 1);
> > +	hw =3D clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1, div);
> > +	aspeed_clk_data->hws[ASPEED_CLK_AHB] =3D hw;
> +
> > +	/* APB clock clock selection register SCU08 (aka PCLK) */
> > +	regmap_read(map, ASPEED_CLK_SELECTION, &val);
> > +	val =3D (val >> 23) & 0x7;
> > +	div =3D 4 * (val + 1);
> > +	hw =3D clk_hw_register_fixed_factor(NULL, "apb", "hpll", 0, 1, div);
> > +	aspeed_clk_data->hws[ASPEED_CLK_APB] =3D hw;
> +
> > +	aspeed_clk_data->num =3D ASPEED_NUM_CLKS;
> > +	ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_clk_=
data);
> > +	if (ret)
> > +		pr_err("failed to add DT provider: %d\n", ret);
> +};
> +CLK_OF_DECLARE_DRIVER(aspeed_cc, "aspeed,ast2500-scu", aspeed_cc_init);
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindin=
gs/clock/aspeed-clock.h
> new file mode 100644
> index 000000000000..afe06b77562d
> --- /dev/null
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -0,0 +1,43 @@
> +#ifndef DT_BINDINGS_ASPEED_CLOCK_H
> +#define DT_BINDINGS_ASPEED_CLOCK_H
> +
> > +#define ASPEED_NUM_CLKS	34
> +
> > +#define ASPEED_CLK_HPLL			0
> > +#define ASPEED_CLK_AHB			1
> > +#define ASPEED_CLK_APB			2
> > +#define ASPEED_CLK_UART			3
> > +#define ASPEED_CLK_SDIO			4
> > +#define ASPEED_CLK_ECLK			5
> > +#define ASPEED_CLK_ECLK_MUX		6
> > +#define ASPEED_CLK_LHCLK		7
> > +#define ASPEED_CLK_MAC			8
> > +#define ASPEED_CLK_BCLK			9
> > +#define ASPEED_CLK_MPLL			10
> > +#define ASPEED_CLK_GATES		11
> > +#define ASPEED_CLK_GATE_ECLK		(0 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_GCLK		(1 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_MCLK		(2 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_VCLK		(3 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_BCLK		(4 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_DCLK		(5 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_REFCLK		(6 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_USBPORT2CLK	(7 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_LCLK		(8 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_USBUHCICLK	(9 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_D1CLK		(10 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_YCLK		(11 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_USBPORT1CLK	(12 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_UART1CLK	(13 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_UART2CLK	(14 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_UART5CLK	(15 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_ESPICLK		(16 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_MAC1CLK		(17 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_MAC2CLK		(18 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_RSACLK		(19 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_UART3CLK	(20 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_UART4CLK	(21 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_SDCLKCLK	(22 + ASPEED_CLK_GATES)
> > +#define ASPEED_CLK_GATE_LHCCLK		(23 + ASPEED_CLK_GATES)
> +
> +#endif
--=-oi4bOF759sUmL9CyXzeY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZu0wIAAoJEJ0dnzgO5LT5Sr8P/08mGv/Fn7roslx2sQ0BQjy+
LkOZzxfoF0REiladyGAEcsO3hGdwVkoWd7A8HLQYjIp9OZmehVIY/1yMywIbzyYR
Jh47DTivYK8r9aGPMCZdy5AgX9kfqhIjvZnXg/qOA7zKB0UxWqOa4O4mutN4ARa4
X7NOqlJ9SFLL8fFAPujnYPl9LfDe0xjO8+62CAvnpwwwVBbNnSz5/1AsxvzZUz1/
ywZvw9Uo/nTteJwY4i8NuQlSHvhF2/sNMe9MxZVAebn1t18xRUDykuIwuf6EOh5z
4d+Wil/RrvBO1Il2OfytCvOV3ZCRoDmrBxcmAxT4zV7c/sgu9NUHICMiBt9FhgcA
9ojkYuVQjIUooO/4pJZhVfNNzK1Vgb5zEH6C2Z8dKE4HkadK3nO19cdJxSThLJXd
R54L5HvEmJlmTdiVwdMIX2OcfyQF5c//3p7FVwuim1yqFIrbLG2sRCmK03l2NLN6
Xasd0JucomuX/8cYtIs/Q5UfBEflw8xDihvSfXz2tKY+blGd5Wb2RjUq0DCLyidX
WKM5e2FhPU0szkQJTc/91+4mwmW6y+ogsrD7ifHHnGz6Bl1dwUyli2v0iaU06tR9
Mug6gWrLSyWMI1n1kuMK1+Nsyjiah9yiuZ939Adr8vwWOd92T9ZYXZ8vHSqwqvx2
OfqZusgq2BOzyt6cr+82
=Ppxt
-----END PGP SIGNATURE-----

--=-oi4bOF759sUmL9CyXzeY--

