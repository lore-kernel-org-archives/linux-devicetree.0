From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 2/6] reset: qcom: PDC Global (Power Domain Controller) reset controller
Date: Thu, 30 Aug 2018 00:42:11 +0530
Message-ID: <20180829191215.10071-3-sibis@codeaurora.org>
References: <20180829191215.10071-1-sibis@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829191215.10071-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, mka@chromium.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add reset controller for SDM845 SoCs to control reset signals provided
by PDC Global for Modem, Compute, Display, GPU, Debug, AOP, Sensors,
Audio, SP and APPS

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/reset/Kconfig          |   9 +++
 drivers/reset/Makefile         |   1 +
 drivers/reset/reset-qcom-pdc.c | 124 +++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 drivers/reset/reset-qcom-pdc.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 13d28fdbdbb5..c21da9fe51ec 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -98,6 +98,15 @@ config RESET_QCOM_AOSS
 	  reset signals provided by AOSS for Modem, Venus, ADSP,
 	  GPU, Camera, Wireless, Display subsystem. Otherwise, say N.
 
+config RESET_QCOM_PDC
+	tristate "Qualcomm PDC Reset Driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  This enables the PDC (Power Domain Controller) reset driver
+	  for Qualcomm Technologies Inc SDM845 SoCs. Say Y if you want
+	  to control reset signals provided by PDC for Modem, Compute,
+	  Display, GPU, Debug, AOP, Sensors, Audio, SP and APPS.
+
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
 	default ARCH_SOCFPGA || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARCH_ASPEED
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 4243c38228e2..d08e8b90046a 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
 obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
 obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
+obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_STM32MP157) += reset-stm32mp1.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
new file mode 100644
index 000000000000..ab74bccd4a5b
--- /dev/null
+++ b/drivers/reset/reset-qcom-pdc.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/qcom,sdm845-pdc.h>
+
+#define RPMH_PDC_SYNC_RESET	0x100
+
+struct qcom_pdc_reset_map {
+	u8 bit;
+};
+
+struct qcom_pdc_reset_data {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+};
+
+static const struct regmap_config sdm845_pdc_regmap_config = {
+	.name		= "pdc-reset",
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x20000,
+	.fast_io	= true,
+};
+
+static const struct qcom_pdc_reset_map sdm845_pdc_resets[] = {
+	[PDC_APPS_SYNC_RESET] = {0},
+	[PDC_SP_SYNC_RESET] = {1},
+	[PDC_AUDIO_SYNC_RESET] = {2},
+	[PDC_SENSORS_SYNC_RESET] = {3},
+	[PDC_AOP_SYNC_RESET] = {4},
+	[PDC_DEBUG_SYNC_RESET] = {5},
+	[PDC_GPU_SYNC_RESET] = {6},
+	[PDC_DISPLAY_SYNC_RESET] = {7},
+	[PDC_COMPUTE_SYNC_RESET] = {8},
+	[PDC_MODEM_SYNC_RESET] = {9},
+};
+
+static inline struct qcom_pdc_reset_data *to_qcom_pdc_reset_data(
+				struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct qcom_pdc_reset_data, rcdev);
+}
+
+static int qcom_pdc_control_assert(struct reset_controller_dev *rcdev,
+					unsigned long idx)
+{
+	struct qcom_pdc_reset_data *data = to_qcom_pdc_reset_data(rcdev);
+
+	return regmap_update_bits(data->regmap, RPMH_PDC_SYNC_RESET,
+				  BIT(sdm845_pdc_resets[idx].bit),
+				  BIT(sdm845_pdc_resets[idx].bit));
+}
+
+static int qcom_pdc_control_deassert(struct reset_controller_dev *rcdev,
+					unsigned long idx)
+{
+	struct qcom_pdc_reset_data *data = to_qcom_pdc_reset_data(rcdev);
+
+	return regmap_update_bits(data->regmap, RPMH_PDC_SYNC_RESET,
+				  BIT(sdm845_pdc_resets[idx].bit), 0);
+}
+
+static const struct reset_control_ops qcom_pdc_reset_ops = {
+	.assert = qcom_pdc_control_assert,
+	.deassert = qcom_pdc_control_deassert,
+};
+
+static int qcom_pdc_reset_probe(struct platform_device *pdev)
+{
+	struct qcom_pdc_reset_data *data;
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+	struct resource *res;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	data->regmap = devm_regmap_init_mmio(dev, base,
+					     &sdm845_pdc_regmap_config);
+	if (IS_ERR(data->regmap)) {
+		dev_err(dev, "Unable to initialize regmap\n");
+		return PTR_ERR(data->regmap);
+	}
+
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &qcom_pdc_reset_ops;
+	data->rcdev.nr_resets = ARRAY_SIZE(sdm845_pdc_resets);
+	data->rcdev.of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static const struct of_device_id qcom_pdc_reset_of_match[] = {
+	{ .compatible = "qcom,sdm845-pdc-global" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_pdc_reset_of_match);
+
+static struct platform_driver qcom_pdc_reset_driver = {
+	.probe = qcom_pdc_reset_probe,
+	.driver = {
+		.name = "qcom_pdc_reset",
+		.of_match_table = qcom_pdc_reset_of_match,
+	},
+};
+module_platform_driver(qcom_pdc_reset_driver);
+
+MODULE_DESCRIPTION("Qualcomm PDC Reset Driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
