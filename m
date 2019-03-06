From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/3] clk: qcom: Add QCS404 TuringCC
Date: Wed,  6 Mar 2019 09:47:58 -0800
Message-ID: <20190306174758.22462-4-bjorn.andersson@linaro.org>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Turing Clock Controller provides resources related to running the
Turing subsystem.

PM runtime is used to ensure that the associated AHB clock is ticking
while the clock framework is accessing the registers in the Turing clock
controller.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/Kconfig           |   6 +
 drivers/clk/qcom/Makefile          |   1 +
 drivers/clk/qcom/turingcc-qcs404.c | 170 +++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/clk/qcom/turingcc-qcs404.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 1c04575c118f..18bdf34d5e64 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -243,6 +243,12 @@ config SDM_GCC_660
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  i2C, USB, UFS, SDDC, PCIe, etc.
 
+config QCS_TURING_404
+	tristate "QCS404 Turing Clock Controller"
+	help
+	  Support for the Turing Clock Controller on QCS404, provides clocks
+	  and resets for the Turing subsystem.
+
 config SDM_GCC_845
 	tristate "SDM845 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ee8d0698e370..f0768fb1f037 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
+obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
diff --git a/drivers/clk/qcom/turingcc-qcs404.c b/drivers/clk/qcom/turingcc-qcs404.c
new file mode 100644
index 000000000000..aa859e6ec9bd
--- /dev/null
+++ b/drivers/clk/qcom/turingcc-qcs404.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, Linaro Ltd.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,turingcc-qcs404.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+#include "reset.h"
+
+static struct clk_branch turing_wrapper_aon_cbcr = {
+	.halt_reg = 0x5098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "turing_wrapper_aon_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch turing_q6ss_ahbm_aon_cbcr = {
+	.halt_reg = 0x9000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "turing_q6ss_ahbm_aon_cbcr",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch turing_q6ss_q6_axim_clk = {
+	.halt_reg = 0xb000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "turing_q6ss_q6_axim_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch turing_q6ss_ahbs_aon_cbcr = {
+	.halt_reg = 0x10000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "turing_q6ss_ahbs_aon_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch turing_wrapper_qos_ahbs_aon_cbcr = {
+	.halt_reg = 0x11014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "turing_wrapper_qos_ahbs_aon_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_regmap *turingcc_clocks[] = {
+	[TURING_WRAPPER_AON_CLK] = &turing_wrapper_aon_cbcr.clkr,
+	[TURING_Q6SS_AHBM_AON_CLK] = &turing_q6ss_ahbm_aon_cbcr.clkr,
+	[TURING_Q6SS_Q6_AXIM_CLK] = &turing_q6ss_q6_axim_clk.clkr,
+	[TURING_Q6SS_AHBS_AON_CLK] = &turing_q6ss_ahbs_aon_cbcr.clkr,
+	[TURING_WRAPPER_QOS_AHBS_AON_CLK] = &turing_wrapper_qos_ahbs_aon_cbcr.clkr,
+};
+
+static const struct regmap_config turingcc_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x30000,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc turingcc_desc = {
+	.config = &turingcc_regmap_config,
+	.clks = turingcc_clocks,
+	.num_clks = ARRAY_SIZE(turingcc_clocks),
+};
+
+static int turingcc_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		goto disable_pm_runtime;
+
+	ret = pm_clk_add(&pdev->dev, NULL);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		goto destroy_pm_clk;
+	}
+
+	ret = qcom_cc_probe(pdev, &turingcc_desc);
+	if (ret < 0)
+		goto destroy_pm_clk;
+
+	return 0;
+
+destroy_pm_clk:
+	pm_clk_destroy(&pdev->dev);
+
+disable_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static int turingcc_remove(struct platform_device *pdev)
+{
+	pm_clk_destroy(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops turingcc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static const struct of_device_id turingcc_match_table[] = {
+	{ .compatible = "qcom,qcs404-turingcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, turingcc_match_table);
+
+static struct platform_driver turingcc_driver = {
+	.probe		= turingcc_probe,
+	.remove		= turingcc_remove,
+	.driver		= {
+		.name	= "qcs404-turingcc",
+		.of_match_table = turingcc_match_table,
+		.pm = &turingcc_pm_ops,
+	},
+};
+
+module_platform_driver(turingcc_driver);
+
+MODULE_DESCRIPTION("Qualcomm QCS404 Turing Clock Controller");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0
