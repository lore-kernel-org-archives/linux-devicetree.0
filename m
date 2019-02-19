From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2 4/4] phy: ti: Add a new SERDES driver for TI's AM654x
 SoC
Date: Tue, 19 Feb 2019 15:25:47 +0200
Message-ID: <bf43846c-3a62-990f-65b8-7ac5ac6319e6@ti.com>
References: <20190206110753.28738-1-kishon@ti.com>
 <20190206110753.28738-5-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206110753.28738-5-kishon@ti.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Kishon,

On 06/02/2019 13:07, Kishon Vijay Abraham I wrote:
> Add a new SERDES driver for TI's AM654x SoC which configures
> the SERDES only for PCIe. Support fo USB3 will be added later.
> 
> SERDES in am654x has three input clocks (left input, externel reference
> clock and right input) and two output clocks (left output and right
> output) in addition to a PLL mux clock which the SERDES uses for Clock
> Multiplier Unit (CMU refclock).
> 
> The PLL mux clock can select from one of the three input clocks.
> The right output can select between left input and external reference
> clock while the left output can select between the right input and
> external reference clock.
> 
> The driver has support to select PLL mux and left/right output mux as
> specified in device tree.
> 
> [rogerq@ti.com: Fix boot lockup caused by accessing a structure member
> (hw->init) allocated in stack of probe() and accessed in get_parent]
> [rogerq@ti.com: Fix "Failed to find the parent" warnings]
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/phy/ti/Kconfig            |  11 +
>  drivers/phy/ti/Makefile           |   1 +
>  drivers/phy/ti/phy-am654-serdes.c | 539 ++++++++++++++++++++++++++++++
>  3 files changed, 551 insertions(+)
>  create mode 100644 drivers/phy/ti/phy-am654-serdes.c
> 
> diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
> index f137e0107764..6357c32de115 100644
> --- a/drivers/phy/ti/Kconfig
> +++ b/drivers/phy/ti/Kconfig
> @@ -20,6 +20,17 @@ config PHY_DM816X_USB
>  	help
>  	  Enable this for dm816x USB to work.
>  
> +config PHY_AM654_SERDES
> +	tristate "TI AM654 SERDES support"
> +	depends on OF && ARCH_K3 || COMPILE_TEST
> +	select GENERIC_PHY
> +	select MULTIPLEXER
> +	select REGMAP_MMIO
> +	select MUX_MMIO
> +	help
> +	  This option enables support for TI AM654 SerDes PHY used for
> +	  PCIe.
> +
>  config OMAP_CONTROL_PHY
>  	tristate "OMAP CONTROL PHY Driver"
>  	depends on ARCH_OMAP2PLUS || COMPILE_TEST
> diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
> index bea8f25a137a..bff901eb0ecc 100644
> --- a/drivers/phy/ti/Makefile
> +++ b/drivers/phy/ti/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
>  obj-$(CONFIG_TI_PIPE3)			+= phy-ti-pipe3.o
>  obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
>  obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
> +obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
>  obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
> diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
> new file mode 100644
> index 000000000000..dfbd2d48503d
> --- /dev/null
> +++ b/drivers/phy/ti/phy-am654-serdes.c
> @@ -0,0 +1,539 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * PCIe SERDES driver for AM654x SoC
> + *
> + * Copyright (C) 2018 Texas Instruments
> + * Author: Kishon Vijay Abraham I <kishon@ti.com>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define CMU_R07C		0x7c
> +#define CMU_MASTER_CDN_O	BIT(24)
> +
> +#define COMLANE_R138		0xb38
> +#define CONFIG_VERSION_REG_MASK	GENMASK(23, 16)
> +#define CONFIG_VERSION_REG_SHIFT 16
> +#define VERSION			0x70
> +
> +#define COMLANE_R190		0xb90
> +#define L1_MASTER_CDN_O		BIT(9)
> +
> +#define COMLANE_R194		0xb94
> +#define CMU_OK_I_0		BIT(19)
> +
> +#define SERDES_CTRL		0x1fd0
> +#define POR_EN			BIT(29)
> +
> +#define WIZ_LANEXCTL_STS	0x1fe0
> +#define TX0_ENABLE_OVL		BIT(31)
> +#define TX0_ENABLE_MASK		GENMASK(30, 29)
> +#define TX0_ENABLE_SHIFT	29
> +#define TX0_DISABLE_STATE	0x0
> +#define TX0_SLEEP_STATE		0x1
> +#define TX0_SNOOZE_STATE	0x2
> +#define TX0_ENABLE_STATE	0x3
> +#define RX0_ENABLE_OVL		BIT(15)
> +#define RX0_ENABLE_MASK		GENMASK(14, 13)
> +#define RX0_ENABLE_SHIFT	13
> +#define RX0_DISABLE_STATE	0x0
> +#define RX0_SLEEP_STATE		0x1
> +#define RX0_SNOOZE_STATE	0x2
> +#define RX0_ENABLE_STATE	0x3
> +
> +#define WIZ_PLL_CTRL		0x1ff4
> +#define PLL_ENABLE_OVL		BIT(31)
> +#define PLL_ENABLE_MASK		GENMASK(30, 29)
> +#define PLL_ENABLE_SHIFT	29
> +#define PLL_DISABLE_STATE	0x0
> +#define PLL_SLEEP_STATE		0x1
> +#define PLL_SNOOZE_STATE	0x2
> +#define PLL_ENABLE_STATE	0x3
> +#define PLL_OK			BIT(28)
> +
> +#define PLL_LOCK_TIME		100000	/* in microseconds */
> +#define SLEEP_TIME		100	/* in microseconds */
> +
> +#define LANE_USB3		0x0
> +#define LANE_PCIE0_LANE0	0x1
> +
> +#define LANE_PCIE1_LANE0	0x0
> +#define LANE_PCIE0_LANE1	0x1
> +
> +#define SERDES_NUM_CLOCKS	3
> +
> +struct serdes_am654_clk_mux {
> +	struct clk_hw	hw;
> +	struct regmap	*regmap;
> +	unsigned int	reg;
> +	int		*table;
> +	u32		mask;
> +	u8		shift;
> +	struct clk_init_data clk_data;
> +};
> +
> +#define to_serdes_am654_clk_mux(_hw)	\
> +		container_of(_hw, struct serdes_am654_clk_mux, hw)
> +
> +static struct regmap_config serdes_am654_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.fast_io = true,
> +};
> +
> +struct serdes_am654 {
> +	struct regmap		*regmap;
> +	struct device		*dev;
> +	struct mux_control	*control;
> +	bool			busy;
> +	u32			type;
> +	struct device_node	*of_node;
> +	struct clk_onecell_data	clk_data;
> +	struct clk		*clks[SERDES_NUM_CLOCKS];
> +};
> +
> +static int serdes_am654_enable_pll(struct serdes_am654 *phy)
> +{
> +	u32 mask = PLL_ENABLE_OVL | PLL_ENABLE_MASK;
> +	u32 val = PLL_ENABLE_OVL | (PLL_ENABLE_STATE << PLL_ENABLE_SHIFT);
> +
> +	regmap_update_bits(phy->regmap, WIZ_PLL_CTRL, mask, val);
> +
> +	return regmap_read_poll_timeout(phy->regmap, WIZ_PLL_CTRL, val,
> +					val & PLL_OK, 1000, PLL_LOCK_TIME);
> +}
> +
> +static void serdes_am654_disable_pll(struct serdes_am654 *phy)
> +{
> +	u32 mask = PLL_ENABLE_OVL | PLL_ENABLE_MASK;
> +
> +	regmap_update_bits(phy->regmap, WIZ_PLL_CTRL, mask, PLL_ENABLE_OVL);
> +}
> +
> +static int serdes_am654_enable_txrx(struct serdes_am654 *phy)
> +{
> +	u32 mask;
> +	u32 val;
> +
> +	/* Enable TX */
> +	mask = TX0_ENABLE_OVL | TX0_ENABLE_MASK;
> +	val = TX0_ENABLE_OVL | (TX0_ENABLE_STATE << TX0_ENABLE_SHIFT);
> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, val);
> +
> +	/* Enable RX */
> +	mask = RX0_ENABLE_OVL | RX0_ENABLE_MASK;
> +	val = RX0_ENABLE_OVL | (RX0_ENABLE_STATE << RX0_ENABLE_SHIFT);
> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, val);
> +
> +	return 0;
> +}
> +
> +static int serdes_am654_disable_txrx(struct serdes_am654 *phy)
> +{
> +	u32 mask;
> +
> +	/* Disable TX */
> +	mask = TX0_ENABLE_OVL | TX0_ENABLE_MASK;
> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, TX0_ENABLE_OVL);
> +
> +	/* Disable RX */
> +	mask = RX0_ENABLE_OVL | RX0_ENABLE_MASK;
> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, RX0_ENABLE_OVL);
> +
> +	return 0;
> +}
> +
> +static int serdes_am654_power_on(struct phy *x)
> +{
> +	struct serdes_am654 *phy = phy_get_drvdata(x);
> +	struct device *dev = phy->dev;
> +	int ret;
> +	u32 val;
> +
> +	ret = serdes_am654_enable_pll(phy);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable PLL\n");
> +		return ret;
> +	}
> +
> +	ret = serdes_am654_enable_txrx(phy);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable TX RX\n");
> +		return ret;
> +	}
> +
> +	return regmap_read_poll_timeout(phy->regmap, COMLANE_R194, val,
> +					val & CMU_OK_I_0, SLEEP_TIME,
> +					PLL_LOCK_TIME);
> +}
> +
> +static int serdes_am654_power_off(struct phy *x)
> +{
> +	struct serdes_am654 *phy = phy_get_drvdata(x);
> +
> +	serdes_am654_disable_txrx(phy);
> +	serdes_am654_disable_pll(phy);
> +
> +	return 0;
> +}
> +
> +static int serdes_am654_init(struct phy *x)
> +{
> +	struct serdes_am654 *phy = phy_get_drvdata(x);
> +	u32 mask;
> +	u32 val;
> +
> +	mask = CONFIG_VERSION_REG_MASK;
> +	val = VERSION << CONFIG_VERSION_REG_SHIFT;
> +	regmap_update_bits(phy->regmap, COMLANE_R138, mask, val);
> +
> +	val = CMU_MASTER_CDN_O;
> +	regmap_update_bits(phy->regmap, CMU_R07C, val, val);
> +
> +	val = L1_MASTER_CDN_O;
> +	regmap_update_bits(phy->regmap, COMLANE_R190, val, val);
> +
> +	return 0;
> +}
> +
> +static int serdes_am654_reset(struct phy *x)
> +{
> +	struct serdes_am654 *phy = phy_get_drvdata(x);
> +	u32 val;
> +
> +	val = POR_EN;
> +	regmap_update_bits(phy->regmap, SERDES_CTRL, val, val);
> +	mdelay(1);
> +	regmap_update_bits(phy->regmap, SERDES_CTRL, val, 0);
> +
> +	return 0;
> +}
> +
> +static void serdes_am654_release(struct phy *x)
> +{
> +	struct serdes_am654 *phy = phy_get_drvdata(x);
> +
> +	phy->type = PHY_NONE;
> +	phy->busy = false;
> +	mux_control_deselect(phy->control);
> +}
> +
> +struct phy *serdes_am654_xlate(struct device *dev, struct of_phandle_args
> +				 *args)
> +{
> +	struct serdes_am654 *am654_phy;
> +	struct phy *phy;
> +	int ret;
> +
> +	phy = of_phy_simple_xlate(dev, args);
> +	if (IS_ERR(phy))
> +		return phy;
> +
> +	am654_phy = phy_get_drvdata(phy);
> +	if (am654_phy->busy)
> +		return ERR_PTR(-EBUSY);
> +
> +	ret = mux_control_select(am654_phy->control, args->args[1]);
> +	if (ret) {
> +		dev_err(dev, "Failed to select SERDES Lane Function\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	am654_phy->busy = true;
> +	am654_phy->type = args->args[0];
> +
> +	return phy;
> +}
> +
> +static const struct phy_ops ops = {
> +	.reset		= serdes_am654_reset,
> +	.init		= serdes_am654_init,
> +	.power_on	= serdes_am654_power_on,
> +	.power_off	= serdes_am654_power_off,
> +	.release	= serdes_am654_release,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static u8 serdes_am654_clk_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct serdes_am654_clk_mux *mux = to_serdes_am654_clk_mux(hw);
> +	unsigned int num_parents = clk_hw_get_num_parents(hw);
> +	struct regmap *regmap = mux->regmap;
> +	unsigned int reg = mux->reg;
> +	unsigned int val;
> +	int i;
> +
> +	regmap_read(regmap, reg, &val);
> +	val >>= mux->shift;
> +	val &= mux->mask;
> +
> +	for (i = 0; i < num_parents; i++)
> +		if (mux->table[i] == val)
> +			return i;
> +
> +	/*
> +	 * No parent? This should never happen!
> +	 * Verify if we set a valid parent in serdes_am654_clk_register()
> +	 */
> +	WARN(1, "Failed to find the parent of %s clock\n", hw->init->name);
> +
> +	/* Make the parent lookup to fail */
> +	return num_parents;
> +}
> +
> +static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct serdes_am654_clk_mux *mux = to_serdes_am654_clk_mux(hw);
> +	struct regmap *regmap = mux->regmap;
> +	unsigned int reg = mux->reg;
> +	int val;
> +	int ret;
> +
> +	val = mux->table[index];
> +
> +	if (val == -1)
> +		return -EINVAL;
> +
> +	val <<= mux->shift;
> +	ret = regmap_update_bits(regmap, reg, mux->mask << mux->shift, val);
> +
> +	return ret;
> +}
> +
> +static const struct clk_ops serdes_am654_clk_mux_ops = {
> +	.set_parent = serdes_am654_clk_mux_set_parent,
> +	.get_parent = serdes_am654_clk_mux_get_parent,
> +};
> +
> +static int mux_table[SERDES_NUM_CLOCKS][3] = {
> +	/*
> +	 * The entries represent values for selecting between
> +	 * {left input, external reference clock, right input}
> +	 * Only one of Left Output or Right Output should be used since
> +	 * both left and right output clock uses the same bits and modifying
> +	 * one clock will impact the other.
> +	 */
> +	{ BIT(2),               0, BIT(0) }, /* Mux of CMU refclk */
> +	{     -1,          BIT(3), BIT(1) }, /* Mux of Left Output */
> +	{ BIT(1), BIT(3) | BIT(1),     -1 }, /* Mux of Right Output */
> +};

This implementation is not good enough. We can't support all 16 CLKSEL combinations
that are shown in "Figure 12-1986. SerDes Reference Clock Distribution"
in AM65 TRM.

I was mostly interested in setting CLKSEL to 0x4 as that is being used by RTOS
team to verify USB Superspeed.

I think the below patch is a cleaner implementation that supports all CLKSEL values.


>From 76604f85dc847f4f5831f12d429d529f758680be Mon Sep 17 00:00:00 2001
From: Roger Quadros <rogerq@ti.com>
Date: Tue, 19 Feb 2019 15:19:11 +0200
Subject: [PATCH] phy-ti-am654: Support all clksel values

now we can get clksel value of 0x4 that is set by RTOS

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/phy/ti/phy-ti-am654.c | 131 +++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 49 deletions(-)

diff --git a/drivers/phy/ti/phy-ti-am654.c b/drivers/phy/ti/phy-ti-am654.c
index cb678ac8b9a5..270becdf8099 100644
--- a/drivers/phy/ti/phy-ti-am654.c
+++ b/drivers/phy/ti/phy-ti-am654.c
@@ -76,13 +76,14 @@
 
 #define SERDES_NUM_CLOCKS	3
 
+#define AM654_SERDES_CTRL_CLKSEL_MASK	GENMASK(7, 4)
+#define AM654_SERDES_CTRL_CLKSEL_SHIFT	4
+
 struct serdes_am654_clk_mux {
 	struct clk_hw	hw;
 	struct regmap	*regmap;
 	unsigned int	reg;
-	int		*table;
-	u32		mask;
-	u8		shift;
+	int		clk_id;
 	struct clk_init_data clk_data;
 };
 
@@ -444,31 +445,52 @@ static const struct phy_ops ops = {
 	.owner		= THIS_MODULE,
 };
 
+#define SERDES_NUM_MUX_COMBINATIONS 16
+
+#define AM654_SERDES_LICLK 0
+#define AM654_SERDES_EXT_REFCLK 1
+#define AM654_SERDES_RICLK 2
+
+static const int serdes_am654_mux_table[SERDES_NUM_MUX_COMBINATIONS][SERDES_NUM_CLOCKS] =
+{
+	/*
+	 * Each combination maps to one of
+	 * "Figure 12-1986. SerDes Reference Clock Distribution"
+	 * in TRM.
+	 */
+	 /* Parent of CMU refclk, Left output, Right output
+	  * either of AM654_SERDES_CMU_REFCLK, AM654_SERDES_LICLK, AM654_SERDES_RICLK
+	  */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK },	/* 0000 */
+	{ AM654_SERDES_RICLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK }, 	/* 0001 */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_RICLK, AM654_SERDES_LICLK },		/* 0010 */
+	{ AM654_SERDES_RICLK, AM654_SERDES_RICLK, AM654_SERDES_EXT_REFCLK },		/* 0011 */
+	{ AM654_SERDES_LICLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK },	/* 0100 */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK },	/* 0101 */
+	{ AM654_SERDES_LICLK, AM654_SERDES_RICLK, AM654_SERDES_LICLK },			/* 0110 */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_RICLK, AM654_SERDES_LICLK },		/* 0111 */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_LICLK },	/* 1000 */
+	{ AM654_SERDES_RICLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_LICLK },		/* 1001 */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_RICLK, AM654_SERDES_EXT_REFCLK },	/* 1010 */
+	{ AM654_SERDES_RICLK, AM654_SERDES_RICLK, AM654_SERDES_EXT_REFCLK },		/* 1011 */
+	{ AM654_SERDES_LICLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_LICLK },		/* 1100 */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_EXT_REFCLK, AM654_SERDES_LICLK },	/* 1101 */
+	{ AM654_SERDES_LICLK, AM654_SERDES_RICLK, AM654_SERDES_EXT_REFCLK },		/* 1110 */
+	{ AM654_SERDES_EXT_REFCLK, AM654_SERDES_RICLK, AM654_SERDES_EXT_REFCLK },	/* 1111 */
+};
+
 static u8 serdes_am654_clk_mux_get_parent(struct clk_hw *hw)
 {
 	struct serdes_am654_clk_mux *mux = to_serdes_am654_clk_mux(hw);
-	unsigned int num_parents = clk_hw_get_num_parents(hw);
 	struct regmap *regmap = mux->regmap;
 	unsigned int reg = mux->reg;
 	unsigned int val;
-	int i;
 
 	regmap_read(regmap, reg, &val);
-	val >>= mux->shift;
-	val &= mux->mask;
-
-	for (i = 0; i < num_parents; i++)
-		if (mux->table[i] == val)
-			return i;
+	val &= AM654_SERDES_CTRL_CLKSEL_MASK;
+	val >>= AM654_SERDES_CTRL_CLKSEL_SHIFT;
 
-	/*
-	 * No parent? This should never happen!
-	 * Verify if we set a valid parent in serdes_am654_clk_register()
-	 */
-	WARN(1, "Failed to find the parent of %s clock\n", hw->init->name);
-
-	/* Make the parent lookup to fail */
-	return num_parents;
+	return serdes_am654_mux_table[val][mux->clk_id];
 }
 
 static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
@@ -476,16 +498,51 @@ static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	struct serdes_am654_clk_mux *mux = to_serdes_am654_clk_mux(hw);
 	struct regmap *regmap = mux->regmap;
 	unsigned int reg = mux->reg;
-	int val;
+	int clk_id = mux->clk_id;
+	int parents[SERDES_NUM_CLOCKS];
+	const int *p;
+	u32 val;
+	int found, i;
 	int ret;
 
-	val = mux->table[index];
+	/* get existing setting */
+	regmap_read(regmap, reg, &val);
+	val &= AM654_SERDES_CTRL_CLKSEL_MASK;
+	val >>= AM654_SERDES_CTRL_CLKSEL_SHIFT;
+
+	for (i = 0; i < SERDES_NUM_CLOCKS; i++) {
+		parents[i] = serdes_am654_mux_table[val][i];
+	}
+
+	/* change parent of this clock. others left intact */
+	parents[clk_id] = index;
+
+	/* Find the match */
+	for (val = 0; val < SERDES_NUM_MUX_COMBINATIONS; val++) {
+		p = serdes_am654_mux_table[val];
+		found = 1;
+		for (i = 0; i < SERDES_NUM_CLOCKS; i++) {
+			if (parents[i] != p[i]) {
+				found = 0;
+				break;
+			}
+		}
+
+		if (found)
+			break;
+	}
 
-	if (val == -1)
+	if (!found) {
+		/*
+		 * This can never happen, unless we missed
+		 * a valid combination in serdes_am654_mux_table.
+		 */
+		WARN(1, "Failed to find the parent of %s clock\n", hw->init->name);
 		return -EINVAL;
+	}
 
-	val <<= mux->shift;
-	ret = regmap_update_bits(regmap, reg, mux->mask << mux->shift, val);
+	val <<= AM654_SERDES_CTRL_CLKSEL_SHIFT;
+	ret = regmap_update_bits(regmap, reg, AM654_SERDES_CTRL_CLKSEL_MASK, val);
 
 	return ret;
 }
@@ -495,21 +552,6 @@ static const struct clk_ops serdes_am654_clk_mux_ops = {
 	.get_parent = serdes_am654_clk_mux_get_parent,
 };
 
-static int mux_table[SERDES_NUM_CLOCKS][3] = {
-	/*
-	 * The entries represent values for selecting between
-	 * {left input, external reference clock, right input}
-	 * Only one of Left Output or Right Output should be used since
-	 * both left and right output clock uses the same bits and modifying
-	 * one clock will impact the other.
-	 */
-	{ BIT(2),               0, BIT(0) }, /* Mux of CMU refclk */
-	{     -1,          BIT(3), BIT(1) }, /* Mux of Left Output */
-	{ BIT(1), BIT(3) | BIT(1),     -1 }, /* Mux of Right Output */
-};
-
-static int mux_mask[SERDES_NUM_CLOCKS] = { 0x5, 0xa, 0xa };
-
 static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 				     const char *clock_name, int clock_num)
 {
@@ -569,20 +611,11 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	init->num_parents = num_parents;
 	init->name = clock_name;
 
-	mux->table = mux_table[clock_num];
 	mux->regmap = regmap;
 	mux->reg = reg;
-	mux->shift = 4;
-	mux->mask = mux_mask[clock_num];
+	mux->clk_id = clock_num;
 	mux->hw.init = init;
 
-	/*
-	 * setup a sane default so get_parent() call evaluates
-	 * to a valid parent. Index 1 is the safest choice as
-	 * the default as it is valid value for all of serdes's
-	 * output clocks.
-	 */
-	serdes_am654_clk_mux_set_parent(&mux->hw, 1);
 	clk = devm_clk_register(dev, &mux->hw);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
