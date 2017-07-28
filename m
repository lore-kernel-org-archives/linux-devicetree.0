From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v3 2/3] clk: meson: meson8b: register the built-in reset controller
Date: Fri, 28 Jul 2017 23:13:12 +0200
Message-ID: <20170728211313.10603-3-martin.blumenstingl@googlemail.com>
References: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170728211313.10603-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock controller also includes some reset lines. This patch
implements a reset controller to assert and de-assert these resets.
The reset controller itself is registered early (through
CLK_OF_DECLARE_DRIVER) because it is needed very early in the boot
process (to start the secondary CPU cores).

According to the public S805 datasheet there are two more reset bits
in the HHI_SYS_CPU_CLK_CNTL0 register, which are not implemented by
this patch (as these seem to be unused in Amlogic's vendor Linux kernel
sources and their u-boot tree):
- bit 15: GEN_DIV_SOFT_RESET
- bit 14: SOFT_RESET

All information was taken from the public S805 Datasheet and Amlogic's
vendor GPL kernel sources. This patch is based on an earlier version
submitted by Carlo Caione.

Suggested-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/clk/meson/Kconfig   |   1 +
 drivers/clk/meson/meson8b.c | 159 ++++++++++++++++++++++++++++++++++++++++----
 drivers/clk/meson/meson8b.h |   9 ++-
 3 files changed, 156 insertions(+), 13 deletions(-)

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
index bb3f1de876b1..0c330d54392f 100644
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
@@ -690,20 +699,114 @@ static struct clk_divider *const meson8b_clk_dividers[] = {
 	&meson8b_mpeg_clk_div,
 };
 
+static const struct meson8b_clk_reset_line {
+	u32 reg;
+	u8 bit_idx;
+} meson8b_clk_reset_bits[] = {
+	[CLKC_RESET_L2_CACHE_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 30
+	},
+	[CLKC_RESET_AXI_64_TO_128_BRIDGE_A5_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 29
+	},
+	[CLKC_RESET_SCU_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 28
+	},
+	[CLKC_RESET_CPU3_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 27
+	},
+	[CLKC_RESET_CPU2_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 26
+	},
+	[CLKC_RESET_CPU1_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 25
+	},
+	[CLKC_RESET_CPU0_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 24
+	},
+	[CLKC_RESET_A5_GLOBAL_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 18
+	},
+	[CLKC_RESET_A5_AXI_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 17
+	},
+	[CLKC_RESET_A5_ABP_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 16
+	},
+	[CLKC_RESET_AXI_64_TO_128_BRIDGE_MMC_SOFT_RESET] = {
+		.reg = HHI_SYS_CPU_CLK_CNTL1, .bit_idx = 30
+	},
+	[CLKC_RESET_VID_CLK_CNTL_SOFT_RESET] = {
+		.reg = HHI_VID_CLK_CNTL, .bit_idx = 15
+	},
+	[CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_POST] = {
+		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 7
+	},
+	[CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_PRE] = {
+		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 3
+	},
+	[CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_POST] = {
+		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 1
+	},
+	[CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_PRE] = {
+		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 0
+	},
+};
+
+static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
+				    unsigned long id, bool assert)
+{
+	struct meson8b_clk_reset *meson8b_clk_reset =
+		container_of(rcdev, struct meson8b_clk_reset, reset);
+	unsigned long flags;
+	const struct meson8b_clk_reset_line *reset;
+	u32 val;
+
+	if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
+		return -EINVAL;
+
+	reset = &meson8b_clk_reset_bits[id];
+
+	spin_lock_irqsave(&clk_lock, flags);
+
+	val = readl(meson8b_clk_reset->base + reset->reg);
+	if (assert)
+		val |= BIT(reset->bit_idx);
+	else
+		val &= ~BIT(reset->bit_idx);
+	writel(val, meson8b_clk_reset->base + reset->reg);
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
@@ -743,7 +846,7 @@ static int meson8b_clkc_probe(struct platform_device *pdev)
 		/* FIXME convert to devm_clk_register */
 		ret = devm_clk_hw_register(dev, meson8b_hw_onecell_data.hws[clkid]);
 		if (ret)
-			goto iounmap;
+			return ret;
 	}
 
 	/*
@@ -766,15 +869,11 @@ static int meson8b_clkc_probe(struct platform_device *pdev)
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
@@ -793,3 +892,39 @@ static struct platform_driver meson8b_driver = {
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
index a687e02547dc..9e4c597d8a79 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -37,6 +37,9 @@
 #define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
 #define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
 #define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
+#define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
+#define HHI_VID_DIVIDER_CNTL		0x198 /* 0x66 offset in data sheet */
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
 #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
 #define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
@@ -163,7 +166,11 @@
 
 #define CLK_NR_CLKS		96
 
-/* include the CLKIDs that have been made part of the stable DT binding */
+/*
+ * include the CLKID and RESETID that have
+ * been made part of the stable DT binding
+ */
 #include <dt-bindings/clock/meson8b-clkc.h>
+#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
 
 #endif /* __MESON8B_H */
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
