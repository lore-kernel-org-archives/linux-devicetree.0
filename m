From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH v2 2/3] ARM: qcom: Add coincell charger driver
Date: Tue, 14 Jul 2015 16:26:19 -0700
Message-ID: <1436916380-3599-2-git-send-email-tim.bird@sonymobile.com>
References: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, bjorn.andersson@sonymobile.com
List-Id: devicetree@vger.kernel.org

This driver is used to configure the coincell charger found in
Qualcomm PMICs.

The driver allows configuring the current-limiting resistor for
the charger, as well as the voltage to apply to the coincell
(or capacitor) when charging.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
---

Changes in v2:
 - (none in this file, but dts changes in 1/3 and 3/3)

 drivers/misc/Kconfig         |  11 ++++
 drivers/misc/Makefile        |   1 +
 drivers/misc/qcom-coincell.c | 154 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/misc/qcom-coincell.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 42c3852..0909869 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -271,6 +271,17 @@ config HP_ILO
 	  To compile this driver as a module, choose M here: the
 	  module will be called hpilo.
 
+config QCOM_COINCELL
+	tristate "Qualcomm coincell charger support"
+	depends on OF
+	select REGMAP
+	help
+	  This driver supports the coincell block found inside of
+	  Qualcomm PMICs.  The coincell charger provides a means to
+	  charge a coincell battery or backup capacitor which is used
+	  to maintain PMIC register and RTC state in the absence of
+	  external power.
+
 config SGI_GRU
 	tristate "SGI GRU driver"
 	depends on X86_UV && SMP
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index d056fb7..537d7f3 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_LKDTM)		+= lkdtm.o
 obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
 obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
 obj-$(CONFIG_PHANTOM)		+= phantom.o
+obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
 obj-$(CONFIG_SENSORS_BH1780)	+= bh1780gli.o
 obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
 obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
new file mode 100644
index 0000000..9c019e4
--- /dev/null
+++ b/drivers/misc/qcom-coincell.c
@@ -0,0 +1,154 @@
+/* Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015, Sony Mobile Communications Inc.
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+struct qcom_coincell {
+	struct device	*dev;
+	struct regmap	*regmap;
+	u32		base_addr;
+};
+
+#define QCOM_COINCELL_REG_RSET		0x44
+#define QCOM_COINCELL_REG_VSET		0x45
+#define QCOM_COINCELL_REG_ENABLE	0x46
+
+#define QCOM_COINCELL_ENABLE		BIT(7)
+
+static const int qcom_rset_map[] = {2100, 1700, 1200, 800};
+static const int qcom_vset_map[] = {2500, 3200, 3100, 3000};
+/* NOTE: for pm8921 and others, voltage of 2500 is 16 (10000b), not 0 */
+
+static int qcom_coincell_chgr_config(struct qcom_coincell *chgr, int rset,
+				     int vset, int enable)
+{
+	int i, rc;
+	unsigned int value;
+
+	/* select current-limiting resistor */
+	for (i = 0; i < ARRAY_SIZE(qcom_rset_map); i++)
+		if (rset == qcom_rset_map[i])
+			break;
+
+	if (i >= ARRAY_SIZE(qcom_rset_map)) {
+		dev_err(chgr->dev, "invalid rset-ohms value %d\n", rset);
+		return -EINVAL;
+	}
+
+	rc = regmap_write(chgr->regmap,
+			  chgr->base_addr + QCOM_COINCELL_REG_RSET, i);
+	if (rc)
+		dev_err(chgr->dev, "could not write to RSET register\n");
+		return rc;
+
+	/* select charge voltage */
+	for (i = 0; i < ARRAY_SIZE(qcom_vset_map); i++)
+		if (vset == qcom_vset_map[i])
+			break;
+
+	if (i >= ARRAY_SIZE(qcom_vset_map)) {
+		dev_err(chgr->dev, "invalid vset-millivolts value %d\n", vset);
+		return -EINVAL;
+	}
+
+	rc = regmap_write(chgr->regmap,
+		chgr->base_addr + QCOM_COINCELL_REG_VSET, i);
+	if (rc)
+		dev_err(chgr->dev, "could not write to VSET register\n");
+		return rc;
+
+	/* set 'enable' register */
+	value = enable ? QCOM_COINCELL_ENABLE : 0;
+	rc = regmap_write(chgr->regmap,
+			  chgr->base_addr + QCOM_COINCELL_REG_ENABLE, value);
+	if (rc)
+		dev_err(chgr->dev, "could not write to ENABLE register\n");
+
+	return rc;
+}
+
+static int qcom_coincell_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct qcom_coincell *chgr;
+	u32 rset, vset, enable;
+	int rc;
+
+	if (!node) {
+		dev_err(&pdev->dev, "%s: device node missing\n", __func__);
+		return -ENODEV;
+	}
+
+	chgr = devm_kzalloc(&pdev->dev, sizeof(*chgr), GFP_KERNEL);
+	if (!chgr)
+		return -ENOMEM;
+
+	chgr->dev = &pdev->dev;
+
+	chgr->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!chgr->regmap) {
+		dev_err(chgr->dev, "Unable to get regmap\n");
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u32(node, "reg", &chgr->base_addr);
+	if (rc)
+		return rc;
+
+	rc = of_property_read_u32(node, "qcom,rset-ohms", &rset);
+	if (rc) {
+		dev_err(chgr->dev, "can't find 'qcom,rset-ohms' in DT block");
+		return rc;
+	}
+
+	rc = of_property_read_u32(node, "qcom,vset-millivolts", &vset);
+	if (rc) {
+		dev_err(chgr->dev,
+			"can't find 'qcom,vset-millivolts' in DT block");
+		return rc;
+	}
+
+	rc = of_property_read_u32(node, "qcom,charge-enable", &enable);
+	if (rc)
+		enable = 0;
+
+	rc = qcom_coincell_chgr_config(chgr, rset, vset, enable);
+
+	return rc;
+}
+
+static const struct of_device_id qcom_coincell_match_table[] = {
+	{ .compatible = "qcom,pm8941-coincell", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, qcom_coincell_match_table);
+
+static struct platform_driver qcom_coincell_driver = {
+	.driver	= {
+		.name		= "qcom,pm8941-coincell",
+		.of_match_table	= qcom_coincell_match_table,
+	},
+	.probe		= qcom_coincell_probe,
+};
+
+module_platform_driver(qcom_coincell_driver);
+
+MODULE_DESCRIPTION("Qualcomm PMIC coincell charger driver");
+MODULE_LICENSE("GPL v2");
-- 
1.8.2.2
