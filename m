From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] clk: meson: meson8b: register the built-in reset controller
Date: Wed, 12 Jul 2017 00:49:38 +0200
Message-ID: <20170711224939.26267-2-martin.blumenstingl@googlemail.com>
References: <20170711224939.26267-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170711224939.26267-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, narmstrong@baylibre.com, jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The clock controller has a reset controller embedded. A large part of
the HHI_SYS_CPU_CLK_CNTL0 register contains reset bits. However, most of
them are only used by u-boot (as these are probably dangerous to use
when Linux is running).
Bits 27:24 are interesting though: these are the CPUx core soft reset
bits (bit 24 = CPU0 soft reset, bit 25 = CPU1 ...).

This patch implements a reset controller for these bits. The reset
controller itself is registered early (through CLK_OF_DECLARE_DRIVER)
because it is neede very early in the boot process (to start the
secondary CPU cores).

Other reset bits in the HHI_SYS_CPU_CLK_CNTL0 register, which are not
implemented by this patch (as these may never be used from within the
Linux kernel - and I don't want to add dead code):
- bit 30: L2 cache soft reset
- bit 29: AXI64to128 bridge (A5-to-MMC) soft reset (A5 interface)
- bit 28: SCU soft reset
- bit 18: A5 Global Reset
- bit 17: A5 AXI Soft Reset
- bit 16: A5 APB Soft Reset
- bit 15: GEN_DIV_SOFT_RESET
- bit 14: SOFT_RESET

All information was taken from the public S805 Datasheet and Amlogic's
vendor GPL kernel sources. This patch is based on an earlier version
submitted by Carlo Caione.

Suggested-by: Carlo Caione <carlo@endlessm.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/clock/amlogic,meson8b-clkc.txt        |   7 +-
 drivers/clk/meson/Kconfig                          |   1 +
 drivers/clk/meson/meson8b.c                        | 109 ++++++++++++++++++---
 drivers/clk/meson/meson8b.h                        |   1 +
 4 files changed, 105 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 606da38c0959..6f444e3867a0 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -16,18 +16,23 @@ Required Properties:
 	   mapped region.
 
 - #clock-cells: should be 1.
+- #reset-cells: should be 1.
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
 used in device tree sources.
 
+The clock controller provides a (soft) reset line for each CPU core. Valid
+reset lines are 0, 1, 2 and 3 (one for each CPU core).
+
 Example: Clock controller node:
 
 	clkc: clock-controller@c1104000 {
-		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
 		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 
diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 5588f75a8414..d2d0174a6eca 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -6,6 +6,7 @@ config COMMON_CLK_AMLOGIC
 config COMMON_CLK_MESON8B
 	bool
 	depends on COMMON_CLK_AMLOGIC
+	select RESET_CONTROLLER
 	help
 	  Support for the clock controller on AmLogic S802 (Meson8),
 	  S805 (Meson8b) and S812 (Meson8m2) devices. Say Y if you
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index bb3f1de876b1..20cbacd008aa 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -25,6 +25,8 @@
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
 #include <linux/init.h>
 
 #include "clkc.h"
@@ -32,6 +34,13 @@
 
 static DEFINE_SPINLOCK(clk_lock);
 
+static void __iomem *clk_base;
+
+struct meson8b_clk_reset {
+	struct reset_controller_dev reset;
+	void __iomem *base;
+};
+
 static const struct pll_rate_table sys_pll_rate_table[] = {
 	PLL_RATE(312000000, 52, 1, 2),
 	PLL_RATE(336000000, 56, 1, 2),
@@ -690,20 +699,64 @@ static struct clk_divider *const meson8b_clk_dividers[] = {
 	&meson8b_mpeg_clk_div,
 };
 
+static const unsigned char meson8b_clk_reset_bits[] = {
+	[0]	= 24, /* CPU0 soft reset */
+	[1]	= 25, /* CPU1 soft reset */
+	[2]	= 26, /* CPU2 soft reset */
+	[3]	= 27, /* CPU3 soft reset */
+};
+
+static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
+				    unsigned long id, bool assert)
+{
+	struct meson8b_clk_reset *meson8b_clk_reset =
+		container_of(rcdev, struct meson8b_clk_reset, reset);
+	unsigned long flags;
+	u32 val;
+
+	if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
+		return -EINVAL;
+
+	spin_lock_irqsave(&clk_lock, flags);
+
+	val = readl(meson8b_clk_reset->base + HHI_SYS_CPU_CLK_CNTL0);
+	if (assert)
+		val |= BIT(meson8b_clk_reset_bits[id]);
+	else
+		val &= ~BIT(meson8b_clk_reset_bits[id]);
+	writel(val, meson8b_clk_reset->base + HHI_SYS_CPU_CLK_CNTL0);
+
+	spin_unlock_irqrestore(&clk_lock, flags);
+
+	return 0;
+}
+
+static int meson8b_clk_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	return meson8b_clk_reset_update(rcdev, id, true);
+}
+
+static int meson8b_clk_reset_deassert(struct reset_controller_dev *rcdev,
+				       unsigned long id)
+{
+	return meson8b_clk_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops meson8b_clk_reset_ops = {
+	.assert = meson8b_clk_reset_assert,
+	.deassert = meson8b_clk_reset_deassert,
+};
+
 static int meson8b_clkc_probe(struct platform_device *pdev)
 {
-	void __iomem *clk_base;
 	int ret, clkid, i;
 	struct clk_hw *parent_hw;
 	struct clk *parent_clk;
 	struct device *dev = &pdev->dev;
 
-	/*  Generic clocks and PLLs */
-	clk_base = of_iomap(dev->of_node, 1);
-	if (!clk_base) {
-		pr_err("%s: Unable to map clk base\n", __func__);
+	if (!clk_base)
 		return -ENXIO;
-	}
 
 	/* Populate base address for PLLs */
 	for (i = 0; i < ARRAY_SIZE(meson8b_clk_plls); i++)
@@ -743,7 +796,7 @@ static int meson8b_clkc_probe(struct platform_device *pdev)
 		/* FIXME convert to devm_clk_register */
 		ret = devm_clk_hw_register(dev, meson8b_hw_onecell_data.hws[clkid]);
 		if (ret)
-			goto iounmap;
+			return ret;
 	}
 
 	/*
@@ -766,15 +819,11 @@ static int meson8b_clkc_probe(struct platform_device *pdev)
 	if (ret) {
 		pr_err("%s: failed to register clock notifier for cpu_clk\n",
 				__func__);
-		goto iounmap;
+		return ret;
 	}
 
 	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
 			&meson8b_hw_onecell_data);
-
-iounmap:
-	iounmap(clk_base);
-	return ret;
 }
 
 static const struct of_device_id meson8b_clkc_match_table[] = {
@@ -793,3 +842,39 @@ static struct platform_driver meson8b_driver = {
 };
 
 builtin_platform_driver(meson8b_driver);
+
+static void __init meson8b_clkc_reset_init(struct device_node *np)
+{
+	struct meson8b_clk_reset *rstc;
+	int ret;
+
+	/* Generic clocks, PLLs and some of the reset-bits */
+	clk_base = of_iomap(np, 1);
+	if (!clk_base) {
+		pr_err("%s: Unable to map clk base\n", __func__);
+		return;
+	}
+
+	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return;
+
+	/* Reset Controller */
+	rstc->base = clk_base;
+	rstc->reset.ops = &meson8b_clk_reset_ops;
+	rstc->reset.nr_resets = ARRAY_SIZE(meson8b_clk_reset_bits);
+	rstc->reset.of_node = np;
+	ret = reset_controller_register(&rstc->reset);
+	if (ret) {
+		pr_err("%s: Failed to register clkc reset controller: %d\n",
+		       __func__, ret);
+		return;
+	}
+}
+
+CLK_OF_DECLARE_DRIVER(meson8_clkc, "amlogic,meson8-clkc",
+		      meson8b_clkc_reset_init);
+CLK_OF_DECLARE_DRIVER(meson8b_clkc, "amlogic,meson8b-clkc",
+		      meson8b_clkc_reset_init);
+CLK_OF_DECLARE_DRIVER(meson8m2_clkc, "amlogic,meson8m2-clkc",
+		      meson8b_clkc_reset_init);
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index a687e02547dc..941df6768504 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -37,6 +37,7 @@
 #define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
 #define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
 #define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
 #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
 #define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
-- 
2.13.2

