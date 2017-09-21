From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v9 4/7] clk: qcom: Add A53 PLL support
Date: Thu, 21 Sep 2017 19:49:37 +0300
Message-ID: <20170921164940.20343-5-georgi.djakov@linaro.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170921164940.20343-1-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The CPUs on Qualcomm MSM8916-based platforms are clocked by two PLLs,
a primary (A53) CPU PLL and a secondary fixed-rate GPLL0. These sources
are connected to a mux and half-integer divider, which is feeding the
CPU cores.

This patch adds support for the primary CPU PLL which generates the
higher range of frequencies above 1GHz.

Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/clock/qcom,a53pll.txt      |  22 +++++
 drivers/clk/qcom/Kconfig                           |  10 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/a53-pll.c                         | 107 +++++++++++++++++++++
 4 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
new file mode 100644
index 000000000000..e3fa8118eaee
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
@@ -0,0 +1,22 @@
+Qualcomm MSM8916 A53 PLL Binding
+--------------------------------
+The A53 PLL on MSM8916 platforms is the main CPU PLL used used for frequencies
+above 1GHz.
+
+Required properties :
+- compatible : Shall contain only one of the following:
+
+		"qcom,msm8916-a53pll"
+
+- reg : shall contain base register location and length
+
+- #clock-cells : must be set to <0>
+
+Example:
+
+	a53pll: clock@b016000 {
+		compatible = "qcom,msm8916-a53pll";
+		reg = <0xb016000 0x40>;
+		#clock-cells = <0>;
+	};
+
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9f6c278deead..81ac7b9378fe 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -12,6 +12,16 @@ config COMMON_CLK_QCOM
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
 
+config QCOM_A53PLL
+	bool "MSM8916 A53 PLL"
+	depends on COMMON_CLK_QCOM
+	default ARCH_QCOM
+	help
+	  Support for the A53 PLL on MSM8916 devices. It provides
+	  the CPU with frequencies above 1GHz.
+	  Say Y if you want to support higher CPU frequencies on MSM8916
+	  devices.
+
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on COMMON_CLK_QCOM && MFD_QCOM_RPM
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 3f3aff229fb7..19ae884b5166 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -31,5 +31,6 @@ obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
+obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
new file mode 100644
index 000000000000..6276934daa0a
--- /dev/null
+++ b/drivers/clk/qcom/a53-pll.c
@@ -0,0 +1,107 @@
+/*
+ * Copyright (c) 2017, Linaro Limited
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-pll.h"
+#include "clk-regmap.h"
+
+static const struct pll_freq_tbl a53pll_freq[] = {
+	{  998400000, 52, 0x0, 0x1, 0 },
+	{ 1094400000, 57, 0x0, 0x1, 0 },
+	{ 1152000000, 62, 0x0, 0x1, 0 },
+	{ 1209600000, 65, 0x0, 0x1, 0 },
+	{ 1401600000, 73, 0x0, 0x1, 0 },
+};
+
+static const struct regmap_config a53pll_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x40,
+	.fast_io		= true,
+};
+
+static const struct of_device_id qcom_a53pll_match_table[] = {
+	{ .compatible = "qcom,msm8916-a53pll" },
+	{ }
+};
+
+static int qcom_a53pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	struct resource *res;
+	struct clk_pll *pll;
+	void __iomem *base;
+	struct clk_init_data init = { };
+	int ret;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &a53pll_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	pll->l_reg = 0x04;
+	pll->m_reg = 0x08;
+	pll->n_reg = 0x0c;
+	pll->config_reg = 0x14;
+	pll->mode_reg = 0x00;
+	pll->status_reg = 0x1c;
+	pll->status_bit = 16;
+	pll->freq_tbl = a53pll_freq;
+
+	init.name = "a53pll";
+	init.parent_names = (const char *[]){ "xo" };
+	init.num_parents = 1;
+	init.ops = &clk_pll_sr2_ops;
+	init.flags = CLK_IS_CRITICAL;
+	pll->clkr.hw.init = &init;
+
+	ret = devm_clk_register_regmap(dev, &pll->clkr);
+	if (ret) {
+		dev_err(dev, "failed to register regmap clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
+				     &pll->clkr.hw);
+	if (ret) {
+		dev_err(dev, "failed to add clock provider: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver qcom_a53pll_driver = {
+	.probe = qcom_a53pll_probe,
+	.driver = {
+		.name = "qcom-a53pll",
+		.of_match_table = qcom_a53pll_match_table,
+	},
+};
+
+builtin_platform_driver(qcom_a53pll_driver);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
