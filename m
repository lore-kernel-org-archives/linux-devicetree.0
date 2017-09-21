From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v9 7/7] clk: qcom: Add APCS clock controller support
Date: Thu, 21 Sep 2017 19:49:40 +0300
Message-ID: <20170921164940.20343-8-georgi.djakov@linaro.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921164940.20343-1-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

Add a driver for the APCS clock controller. It is part of the APCS
hardware block, which among other things implements also a combined
mux and half integer divider functionality. It can choose between a
fixed-rate clock or the dedicated APCS (A53) PLL. The source and the
divider can be set both at the same time.

This is required for enabling CPU frequency scaling on MSM8916-based
platforms.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/Kconfig        |  11 +++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/apcs-msm8916.c | 172 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)
 create mode 100644 drivers/clk/qcom/apcs-msm8916.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 81ac7b9378fe..255023b439c9 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -22,6 +22,17 @@ config QCOM_A53PLL
 	  Say Y if you want to support higher CPU frequencies on MSM8916
 	  devices.
 
+config QCOM_CLK_APCS_MSM8916
+	bool "MSM8916 APCS Clock Controller"
+	depends on COMMON_CLK_QCOM
+	depends on QCOM_APCS_IPC
+	default ARCH_QCOM
+	help
+	  Support for the APCS Clock Controller on msm8916 devices. The
+	  APCS is managing the mux and divider which feeds the CPUs.
+	  Say Y if you want to support CPU frequency scaling on devices
+	  such as msm8916.
+
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on COMMON_CLK_QCOM && MFD_QCOM_RPM
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ac38c2b21847..9b49fe77654a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -33,5 +33,6 @@ obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
 obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
+obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
new file mode 100644
index 000000000000..c297d9cb34b2
--- /dev/null
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -0,0 +1,172 @@
+/*
+ * Copyright (c) 2017, Linaro Limited
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
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/qcom-apcs.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include "clk-regmap.h"
+#include "clk-regmap-mux-div.h"
+
+enum {
+	P_GPLL0,
+	P_A53PLL,
+};
+
+static const struct parent_map gpll0_a53cc_map[] = {
+	{ P_GPLL0, 4 },
+	{ P_A53PLL, 5 },
+};
+
+static const char * const gpll0_a53cc[] = {
+	"gpll0_vote",
+	"a53pll",
+};
+
+/*
+ * We use the notifier function for switching to a temporary safe configuration
+ * (mux and divider), while the A53 PLL is reconfigured.
+ */
+static int a53cc_notifier_cb(struct notifier_block *nb, unsigned long event,
+			     void *data)
+{
+	int ret = 0;
+	struct clk_regmap_mux_div *md = container_of(nb,
+						     struct clk_regmap_mux_div,
+						     clk_nb);
+	if (event == PRE_RATE_CHANGE)
+		/* set the mux and divider to safe frequency (400mhz) */
+		ret = __mux_div_set_src_div(md, 4, 3);
+
+	return notifier_from_errno(ret);
+}
+
+static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_regmap_mux_div *a53cc;
+	struct qcom_apcs_ipc *apcs;
+	struct clk_init_data init = { };
+	int ret;
+
+	apcs = dev_get_drvdata(dev->parent);
+
+	if (IS_ERR(apcs->regmap)) {
+		ret = PTR_ERR(apcs->regmap);
+		dev_err(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);
+	if (!a53cc)
+		return -ENOMEM;
+
+	init.name = "a53mux";
+	init.parent_names = gpll0_a53cc;
+	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
+	init.ops = &clk_regmap_mux_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+
+	a53cc->clkr.hw.init = &init;
+	a53cc->clkr.regmap = apcs->regmap;
+	a53cc->reg_offset = 0x50;
+	a53cc->hid_width = 5;
+	a53cc->hid_shift = 0;
+	a53cc->src_width = 3;
+	a53cc->src_shift = 8;
+	a53cc->parent_map = gpll0_a53cc_map;
+
+	a53cc->pclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(a53cc->pclk)) {
+		ret = PTR_ERR(a53cc->pclk);
+		dev_err(dev, "failed to get clk: %d\n", ret);
+		return ret;
+	}
+
+	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
+	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
+	if (ret) {
+		dev_err(dev, "failed to register clock notifier: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_clk_register_regmap(dev, &a53cc->clkr);
+	if (ret) {
+		dev_err(dev, "failed to register regmap clock: %d\n", ret);
+		goto err;
+	}
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
+				     &a53cc->clkr.hw);
+	if (ret) {
+		dev_err(dev, "failed to add clock provider: %d\n", ret);
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, a53cc);
+
+	return 0;
+
+err:
+	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
+	return ret;
+}
+
+static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
+{
+	struct clk_regmap_mux_div *a53cc = platform_get_drvdata(pdev);
+
+	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
+	of_clk_del_provider(pdev->dev.of_node);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_apcs_msm8916_clk_of_match[] = {
+	{ .compatible = "qcom,msm8916-apcs-clk" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_apcs_msm8916_clk_of_match);
+
+static struct platform_driver qcom_apcs_msm8916_clk_driver = {
+	.probe = qcom_apcs_msm8916_clk_probe,
+	.remove = qcom_apcs_msm8916_clk_remove,
+	.driver = {
+		.name = "qcom_apcs_msm8916_clk",
+		.of_match_table = qcom_apcs_msm8916_clk_of_match,
+	},
+};
+
+static int __init qcom_apcs_msm8916_clk_init(void)
+{
+	return platform_driver_register(&qcom_apcs_msm8916_clk_driver);
+}
+core_initcall(qcom_apcs_msm8916_clk_init);
+
+static void __exit qcom_apcs_msm8916_clk_exit(void)
+{
+	platform_driver_unregister(&qcom_apcs_msm8916_clk_driver);
+}
+module_exit(qcom_apcs_msm8916_clk_exit);
+
+MODULE_AUTHOR("Georgi Djakov <georgi.djakov@linaro.org>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm MSM8916 APCS clock driver");
