Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 2/6] power: reset: qcom-pon: Add Qcom PON driver
Date: Wed, 27 Jun 2018 17:22:57 +0530
Message-Id: <20180627115301.21330-3-vkoul@kernel.org>
In-Reply-To: <20180627115301.21330-1-vkoul@kernel.org>
References: <20180627115301.21330-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add support Qualcomm PM8xxx PON which is responsible for reboot
mode support.

Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/power/reset/Kconfig    |  8 ++++
 drivers/power/reset/Makefile   |  1 +
 drivers/power/reset/qcom-pon.c | 91 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 drivers/power/reset/qcom-pon.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index df58fc878b3e..1572b2d3ad3d 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -104,6 +104,14 @@ config POWER_RESET_MSM
 	help
 	  Power off and restart support for Qualcomm boards.
 
+config POWER_RESET_QCOM_PON
+	bool "Qualcomm power-on driver"
+	depends on ARCH_QCOM
+	depends on MFD_SPMI_PMIC
+	select REBOOT_MODE
+	help
+	  Power On support for Qualcomm boards.
+
 config POWER_RESET_OCELOT_RESET
 	bool "Microsemi Ocelot reset driver"
 	depends on MSCC_OCELOT || COMPILE_TEST
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 7778c7485cf1..0aebee954ac1 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_POWER_RESET_GPIO) += gpio-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO_RESTART) += gpio-restart.o
 obj-$(CONFIG_POWER_RESET_HISI) += hisi-reboot.o
 obj-$(CONFIG_POWER_RESET_MSM) += msm-poweroff.o
+obj-$(CONFIG_POWER_RESET_QCOM_PON) += qcom-pon.o
 obj-$(CONFIG_POWER_RESET_OCELOT_RESET) += ocelot-reset.o
 obj-$(CONFIG_POWER_RESET_PIIX4_POWEROFF) += piix4-poweroff.o
 obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
new file mode 100644
index 000000000000..0c4caaa7e88f
--- /dev/null
+++ b/drivers/power/reset/qcom-pon.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017-18 Linaro Limited
+
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/reboot-mode.h>
+#include <linux/regmap.h>
+
+#define PON_SOFT_RB_SPARE		0x8f
+
+struct pm8916_pon {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 baseaddr;
+	struct reboot_mode_driver reboot_mode;
+};
+
+static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
+				    unsigned int magic)
+{
+	struct pm8916_pon *pon = container_of
+			(reboot, struct pm8916_pon, reboot_mode);
+	int ret;
+
+	ret = regmap_update_bits(pon->regmap,
+				 pon->baseaddr + PON_SOFT_RB_SPARE,
+				 0xfc, magic << 2);
+	if (ret < 0)
+		dev_err(pon->dev, "update reboot mode bits failed\n");
+
+	return ret;
+}
+
+static int pm8916_pon_probe(struct platform_device *pdev)
+{
+	struct pm8916_pon *pon;
+	int error;
+
+	pon = devm_kzalloc(&pdev->dev, sizeof(*pon), GFP_KERNEL);
+	if (!pon)
+		return -ENOMEM;
+
+	pon->dev = &pdev->dev;
+
+	pon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!pon->regmap) {
+		dev_err(&pdev->dev, "failed to locate regmap\n");
+		return -ENODEV;
+	}
+
+	error = of_property_read_u32(pdev->dev.of_node, "reg",
+				     &pon->baseaddr);
+	if (error)
+		return error;
+
+	pon->reboot_mode.dev = &pdev->dev;
+	pon->reboot_mode.write = pm8916_reboot_mode_write;
+	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
+	if (error) {
+		dev_err(&pdev->dev, "can't register reboot mode\n");
+		return error;
+	}
+
+	platform_set_drvdata(pdev, pon);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static const struct of_device_id pm8916_pon_id_table[] = {
+	{ .compatible = "qcom,pm8916-pon" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pm8916_pon_id_table);
+
+static struct platform_driver pm8916_pon_driver = {
+	.probe = pm8916_pon_probe,
+	.driver = {
+		.name = "pm8916-pon",
+		.of_match_table = of_match_ptr(pm8916_pon_id_table),
+	},
+};
+module_platform_driver(pm8916_pon_driver);
+
+MODULE_DESCRIPTION("pm8916 Power On driver");
+MODULE_LICENSE("GPL v2");
-- 
2.14.4
