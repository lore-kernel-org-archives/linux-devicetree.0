From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/6] clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
Date: Sat, 21 Sep 2019 17:18:31 +0200
Message-ID: <20190921151835.770263-3-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The Meson8/Meson8b/Meson8m2 SoCs embed a DDR clock controller in the
MMCBUS registers. There is no public documentation, but the u-boot GPL
sources from the Amlogic BSP show that the DDR clock controller is
identical on all three SoCs:
  #define CFG_DDR_CLK 792
  #define CFG_PLL_M (((CFG_DDR_CLK/12)*12)/24)
  #define CFG_PLL_N 1
  #define CFG_PLL_OD 1

  // from set_ddr_clock:
  t_ddr_pll_cntl= (CFG_PLL_OD << 16)|(CFG_PLL_N<<9)|(CFG_PLL_M<<0)
  writel(timing_reg->t_ddr_pll_cntl|(1<<29),AM_DDR_PLL_CNTL);
  writel(readl(AM_DDR_PLL_CNTL) & (~(1<<29)),AM_DDR_PLL_CNTL);

  // from hx_ddr_power_down_enter: shut down DDR PLL
  writel(readl(AM_DDR_PLL_CNTL)|(1<<30),AM_DDR_PLL_CNTL);

  do { ... } while((readl(AM_DDR_PLL_CNTL)&(1<<31))==0)

This translates to:
- AM_DDR_PLL_CNTL[29] is the reset bit
- AM_DDR_PLL_CNTL[30] is the enable bit
- AM_DDR_PLL_CNTL[31] is the lock bit
- AM_DDR_PLL_CNTL[8:0] is the m value (assuming the width is 9 bits
  based on the start of the n value)
- AM_DDR_PLL_CNTL[13:9] is the n value (assuming the width is 5 bits
  based on the start of the od)
- AM_DDR_PLL_CNTL[17:16] is the od (assuming the width is 2 bits based
  on other PLLs on this SoC)

Add a driver for this PLL setup because it's used as one of the inputs
of the audio clocks. There may be more clocks inside that clock
controller - those can be added in subsequent patches.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/Makefile     |   2 +-
 drivers/clk/meson/meson8-ddr.c | 153 +++++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/meson8-ddr.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 3939f218587a..6eca2a406ee3 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -18,4 +18,4 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
 obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
 obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
 obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
-obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
+obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
new file mode 100644
index 000000000000..64ab4c27cce0
--- /dev/null
+++ b/drivers/clk/meson/meson8-ddr.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Amlogic Meson8 DDR clock controller
+ *
+ * Copyright (C) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#include <dt-bindings/clock/meson8-ddr-clkc.h>
+
+#include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+#include "clk-regmap.h"
+#include "clk-pll.h"
+
+#define AM_DDR_PLL_CNTL			0x00
+#define AM_DDR_PLL_CNTL1		0x04
+#define AM_DDR_PLL_CNTL2		0x08
+#define AM_DDR_PLL_CNTL3		0x0c
+#define AM_DDR_PLL_CNTL4		0x10
+#define AM_DDR_PLL_STS			0x14
+#define DDR_CLK_CNTL			0x18
+#define DDR_CLK_STS			0x1c
+
+static struct clk_regmap meson8_ddr_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.n = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 9,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ddr_pll_dco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap meson8_ddr_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = AM_DDR_PLL_CNTL,
+		.shift = 16,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ddr_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8_ddr_pll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_hw_onecell_data meson8_ddr_clk_hw_onecell_data = {
+	.hws = {
+		[DDR_CLKID_DDR_PLL_DCO]		= &meson8_ddr_pll_dco.hw,
+		[DDR_CLKID_DDR_PLL]		= &meson8_ddr_pll.hw,
+	},
+	.num = 2,
+};
+
+static struct clk_regmap *const meson8_ddr_clk_regmaps[] = {
+	&meson8_ddr_pll_dco,
+	&meson8_ddr_pll,
+};
+
+static const struct regmap_config meson8_ddr_clkc_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+};
+
+static int meson8_ddr_clkc_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct resource *res;
+	void __iomem *base;
+	struct clk_hw *hw;
+	int ret, i;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+				       &meson8_ddr_clkc_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Populate regmap */
+	for (i = 0; i < ARRAY_SIZE(meson8_ddr_clk_regmaps); i++)
+		meson8_ddr_clk_regmaps[i]->map = regmap;
+
+	/* Register all clks */
+	for (i = 0; i < meson8_ddr_clk_hw_onecell_data.num; i++) {
+		hw = meson8_ddr_clk_hw_onecell_data.hws[i];
+
+		ret = devm_clk_hw_register(&pdev->dev, hw);
+		if (ret) {
+			dev_err(&pdev->dev, "Clock registration failed\n");
+			return ret;
+		}
+	}
+
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+					   &meson8_ddr_clk_hw_onecell_data);
+}
+
+static const struct of_device_id meson8_ddr_clkc_match_table[] = {
+	{ .compatible = "amlogic,meson8-ddr-clkc" },
+	{ .compatible = "amlogic,meson8b-ddr-clkc" },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver meson8_ddr_clkc_driver = {
+	.probe		= meson8_ddr_clkc_probe,
+	.driver		= {
+		.name	= "meson8-ddr-clkc",
+		.of_match_table = meson8_ddr_clkc_match_table,
+	},
+};
+
+builtin_platform_driver(meson8_ddr_clkc_driver);
-- 
2.23.0
