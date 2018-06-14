From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 2/2] clk: qcom: Add lpass clock controller driver for SDM845
Date: Thu, 14 Jun 2018 13:09:03 +0530
Message-ID: <1528961943-12506-3-git-send-email-tdas@codeaurora.org>
References: <1528961943-12506-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528961943-12506-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh@kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rohit Kumar <rohitkr@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add support for the lpass clock controller found on SDM845 based devices.
This would allow lpass peripheral loader drivers to control the clocks to
bring the subsystem out of reset.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig          |   9 ++
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/lpasscc-sdm845.c | 252 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-sdm845.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9c3480d..06b3f2e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -245,6 +245,15 @@ config SDM_VIDEOCC_845
 	  Say Y if you want to support video devices and functionality such as
 	  video encode and decode.

+config SDM_LPASSCC_845
+	tristate "SDM845 LPASS Clock Controller"
+	depends on COMMON_CLK_QCOM
+	select SDM_GCC_845
+	help
+	  Support for the LPASS clock controller on SDM845 devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.
+
 config SPMI_PMIC_CLKDIV
 	tristate "SPMI PMIC clkdiv Support"
 	depends on (COMMON_CLK_QCOM && SPMI) || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 762c011..799b9d7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,5 +39,6 @@ obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
+obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
 obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
new file mode 100644
index 0000000..d04a4c8
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpass-sdm845.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+
+static struct clk_branch gcc_lpass_q6_axi_clk = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_q6_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+struct clk_branch gcc_lpass_sway_clk = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_lpass_sway_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_wrapper_aon_clk = {
+	.halt_reg = 0x098,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_wrapper_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_q6ss_ahbm_aon_clk = {
+	.halt_reg = 0x12000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x12000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_q6ss_ahbm_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_q6ss_ahbs_aon_clk = {
+	.halt_reg = 0x1f000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1f000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_q6ss_ahbs_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_qdsp6ss_xo_clk = {
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x18,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_qdsp6ss_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_qdsp6ss_sleep_clk = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_qdsp6ss_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_qdsp6ss_core_clk = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_qdsp6ss_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct regmap_config lpass_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static struct clk_regmap *lpass_gcc_sdm845_clocks[] = {
+	[GCC_LPASS_Q6_AXI_CLK] = &gcc_lpass_q6_axi_clk.clkr,
+	[GCC_LPASS_SWAY_CLK] = &gcc_lpass_sway_clk.clkr,
+};
+
+static const struct qcom_cc_desc lpass_gcc_sdm845_desc = {
+	.config = &lpass_regmap_config,
+	.clks = lpass_gcc_sdm845_clocks,
+	.num_clks = ARRAY_SIZE(lpass_gcc_sdm845_clocks),
+};
+
+static const struct of_device_id lpass_gcc_sdm845_match_table[] = {
+	{ .compatible = "qcom,sdm845-lpass-gcc" },
+	{ }
+};
+
+static struct clk_regmap *lpass_cc_sdm845_clocks[] = {
+	[LPASS_AUDIO_WRAPPER_AON_CLK] = &lpass_audio_wrapper_aon_clk.clkr,
+	[LPASS_Q6SS_AHBM_AON_CLK] = &lpass_q6ss_ahbm_aon_clk.clkr,
+	[LPASS_Q6SS_AHBS_AON_CLK] = &lpass_q6ss_ahbs_aon_clk.clkr,
+};
+
+static const struct qcom_cc_desc lpass_cc_sdm845_desc = {
+	.config = &lpass_regmap_config,
+	.clks = lpass_cc_sdm845_clocks,
+	.num_clks = ARRAY_SIZE(lpass_cc_sdm845_clocks),
+};
+
+static const struct of_device_id lpasscc_sdm845_match_table[] = {
+	{ .compatible = "qcom,sdm845-lpass-cc" },
+	{ }
+};
+
+static struct clk_regmap *lpass_qdsp6ss_sdm845_clocks[] = {
+	[LPASS_QDSP6SS_XO_CLK] = &lpass_qdsp6ss_xo_clk.clkr,
+	[LPASS_QDSP6SS_SLEEP_CLK] = &lpass_qdsp6ss_sleep_clk.clkr,
+	[LPASS_QDSP6SS_CORE_CLK] = &lpass_qdsp6ss_core_clk.clkr,
+};
+
+static const struct qcom_cc_desc lpass_qdsp6ss_sdm845_desc = {
+	.config = &lpass_regmap_config,
+	.clks = lpass_qdsp6ss_sdm845_clocks,
+	.num_clks = ARRAY_SIZE(lpass_qdsp6ss_sdm845_clocks),
+};
+
+static const struct of_device_id lpass_qdsp6_sdm845_match_table[] = {
+	{ .compatible = "qcom,sdm845-lpass-qdsp6ss" },
+	{ }
+};
+
+static int lpass_clocks_sdm845_probe(struct platform_device *pdev,
+				     struct device_node *np,
+				     const struct qcom_cc_desc *desc)
+{
+	struct regmap *regmap;
+	struct resource res;
+	void __iomem *base;
+
+	if (of_address_to_resource(np, 0, &res))
+		return -ENOMEM;
+
+	base = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
+	if (IS_ERR(base))
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
+	if (!regmap)
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(pdev, desc, regmap);
+}
+
+/* LPASS CC clock controller */
+static const struct of_device_id lpass_cc_sdm845_match_table[] = {
+	{ .compatible = "qcom,sdm845-lpasscc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_cc_sdm845_match_table);
+
+static int lpass_cc_sdm845_probe(struct platform_device *pdev)
+{
+	struct device_node *cp;
+	const struct qcom_cc_desc *desc;
+	int ret;
+
+	for_each_available_child_of_node(pdev->dev.of_node, cp) {
+		if (of_match_node(lpass_gcc_sdm845_match_table, cp)) {
+			lpass_regmap_config.name = "lpass_gcc";
+			desc = &lpass_gcc_sdm845_desc;
+		} else if (of_match_node(lpasscc_sdm845_match_table, cp)) {
+			lpass_regmap_config.name = "lpass_cc";
+			desc = &lpass_cc_sdm845_desc;
+		} else if (of_match_node(lpass_qdsp6_sdm845_match_table, cp)) {
+			lpass_regmap_config.name = "lpass_qdsp6ss";
+			desc = &lpass_qdsp6ss_sdm845_desc;
+		} else {
+			dev_err(&pdev->dev, "LPASS child node not defined\n");
+			return -EINVAL;
+		}
+
+		ret = lpass_clocks_sdm845_probe(pdev, cp, desc);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver lpass_cc_sdm845_driver = {
+	.probe		= lpass_cc_sdm845_probe,
+	.driver		= {
+		.name	= "sdm845-lpasscc",
+		.of_match_table = lpass_cc_sdm845_match_table,
+	},
+};
+
+static int __init lpass_cc_sdm845_init(void)
+{
+	return platform_driver_register(&lpass_cc_sdm845_driver);
+}
+subsys_initcall(lpass_cc_sdm845_init);
+
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
