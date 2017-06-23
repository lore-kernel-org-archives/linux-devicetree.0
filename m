From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v8 1/3] clk: qcom: Add A53 PLL support
Date: Fri, 23 Jun 2017 19:15:31 +0300
Message-ID: <20170623161533.20449-2-georgi.djakov@linaro.org>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170623161533.20449-1-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

The CPUs on Qualcomm MSM8916-based platforms are clocked by two PLLs,
a primary (A53) CPU PLL and a secondary fixed-rate GPLL0. These sources
are connected to a mux and half-integer divider, which is feeding the
CPU cores.

This patch adds support for the primary CPU PLL which generates the
higher range of frequencies above 1GHz.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,a53pll.txt      | 22 +++++
 drivers/clk/qcom/Kconfig                           |  9 +++
 drivers/clk/qcom/Makefile                          |  1 +
 drivers/clk/qcom/a53-pll.c                         | 94 ++++++++++++++++++++++
 4 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
new file mode 100644
index 000000000000..f4c2fddf6e7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
@@ -0,0 +1,22 @@
+MSM8916 A53 PLL Binding
+---------------
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
index 9f6c278deead..057cf60ed037 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -12,6 +12,15 @@ config COMMON_CLK_QCOM
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
 
+config QCOM_A53PLL
+	bool "A53 PLL"
+	depends on COMMON_CLK_QCOM
+	help
+	  Support for the A53 PLL on Qualcomm MSM8916 devices. It provides
+	  support for CPU frequencies above 1GHz.
+	  Say Y if you want to support CPU frequency scaling on devices
+	  such as MSM8916.
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
index 000000000000..e039937e89fc
--- /dev/null
+++ b/drivers/clk/qcom/a53-pll.c
@@ -0,0 +1,94 @@
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
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
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
+	struct clk_pll *pll;
+	struct resource *res;
+	void __iomem *base;
+	struct regmap *regmap;
+	struct clk_init_data init = { };
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
+	return devm_clk_register_regmap(dev, &pll->clkr);
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
