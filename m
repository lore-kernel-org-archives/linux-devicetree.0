From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: [PATCH v3] mfd: Add specific compatible strings for Qualcomm's SPMI PMIC's
Date: Tue, 17 Mar 2015 12:47:24 +0200
Message-ID: <1426589244-16740-1-git-send-email-iivanov@mm-sol.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some of the PMIC's could have specific regmap configuration
tables in future, so add specific compatible strings for known
PMIC's. Also print runtime detected chip revision information.

Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
---

Changes since v2

* Fixed error checks from regmap_reads's.
* Reorganized pmic_spmi_id_table.
* Lower device info print level.

 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  19 +++-
 drivers/mfd/qcom-spmi-pmic.c                       | 103 +++++++++++++++++++--
 2 files changed, 111 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
index 7182b88..6ac06c1 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
@@ -15,10 +15,21 @@ each. A function can consume one or more of these fixed-size register regions.

 Required properties:
 - compatible:      Should contain one of:
-                     "qcom,pm8941"
-                     "qcom,pm8841"
-                     "qcom,pma8084"
-                     or generalized "qcom,spmi-pmic".
+                   "qcom,pm8941",
+                   "qcom,pm8841",
+                   "qcom,pma8084",
+                   "qcom,pm8019",
+                   "qcom,pm8226",
+                   "qcom,pm8110",
+                   "qcom,pma8084",
+                   "qcom,pmi8962",
+                   "qcom,pmd9635",
+                   "qcom,pm8994",
+                   "qcom,pmi8994",
+                   "qcom,pm8916",
+                   "qcom,pm8004",
+                   "qcom,pm8909",
+                   or generalized "qcom,spmi-pmic".
 - reg:             Specifies the SPMI USID slave address for this device.
                    For more information see:
                    Documentation/devicetree/bindings/spmi/spmi.txt
diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index 4b8beb2..af6ac1c 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -17,6 +17,100 @@
 #include <linux/regmap.h>
 #include <linux/of_platform.h>

+#define PMIC_REV2		0x101
+#define PMIC_REV3		0x102
+#define PMIC_REV4		0x103
+#define PMIC_TYPE		0x104
+#define PMIC_SUBTYPE		0x105
+
+#define PMIC_TYPE_VALUE		0x51
+
+#define COMMON_SUBTYPE		0x00
+#define PM8941_SUBTYPE		0x01
+#define PM8841_SUBTYPE		0x02
+#define PM8019_SUBTYPE		0x03
+#define PM8226_SUBTYPE		0x04
+#define PM8110_SUBTYPE		0x05
+#define PMA8084_SUBTYPE		0x06
+#define PMI8962_SUBTYPE		0x07
+#define PMD9635_SUBTYPE		0x08
+#define PM8994_SUBTYPE		0x09
+#define PMI8994_SUBTYPE		0x0a
+#define PM8916_SUBTYPE		0x0b
+#define PM8004_SUBTYPE		0x0c
+#define PM8909_SUBTYPE		0x0d
+
+static const struct of_device_id pmic_spmi_id_table[] = {
+	{ .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
+	{ .compatible = "qcom,pm8941",    .data = (void *)PM8941_SUBTYPE },
+	{ .compatible = "qcom,pm8841",    .data = (void *)PM8841_SUBTYPE },
+	{ .compatible = "qcom,pm8019",    .data = (void *)PM8019_SUBTYPE },
+	{ .compatible = "qcom,pm8226",    .data = (void *)PM8226_SUBTYPE },
+	{ .compatible = "qcom,pm8110",    .data = (void *)PM8110_SUBTYPE },
+	{ .compatible = "qcom,pma8084",   .data = (void *)PMA8084_SUBTYPE },
+	{ .compatible = "qcom,pmi8962",   .data = (void *)PMI8962_SUBTYPE },
+	{ .compatible = "qcom,pmd9635",   .data = (void *)PMD9635_SUBTYPE },
+	{ .compatible = "qcom,pm8994",    .data = (void *)PM8994_SUBTYPE },
+	{ .compatible = "qcom,pmi8994",   .data = (void *)PMI8994_SUBTYPE },
+	{ .compatible = "qcom,pm8916",    .data = (void *)PM8916_SUBTYPE },
+	{ .compatible = "qcom,pm8004",    .data = (void *)PM8004_SUBTYPE },
+	{ .compatible = "qcom,pm8909",    .data = (void *)PM8909_SUBTYPE },
+	{ }
+};
+
+static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
+{
+	unsigned int rev2, minor, major, type, subtype;
+	const char *name = "unknown";
+	int ret, i;
+
+	ret = regmap_read(map, PMIC_TYPE, &type);
+	if (ret < 0)
+		return;
+
+	if (type != PMIC_TYPE_VALUE)
+		return;
+
+	ret = regmap_read(map, PMIC_SUBTYPE, &subtype);
+	if (ret < 0)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(pmic_spmi_id_table); i++) {
+		if (subtype == (unsigned long)pmic_spmi_id_table[i].data)
+			break;
+	}
+
+	if (i != ARRAY_SIZE(pmic_spmi_id_table))
+		name = pmic_spmi_id_table[i].compatible;
+
+	ret = regmap_read(map, PMIC_REV2, &rev2);
+	if (ret < 0)
+		return;
+
+	ret = regmap_read(map, PMIC_REV3, &minor);
+	if (ret < 0)
+		return;
+
+	ret = regmap_read(map, PMIC_REV4, &major);
+	if (ret < 0)
+		return;
+
+	/*
+	 * In early versions of PM8941 and PM8226, the major revision number
+	 * started incrementing from 0 (eg 0 = v1.0, 1 = v2.0).
+	 * Increment the major revision number here if the chip is an early
+	 * version of PM8941 or PM8226.
+	 */
+	if ((subtype == PM8941_SUBTYPE || subtype == PM8226_SUBTYPE) &&
+	    major < 0x02)
+		major++;
+
+	if (subtype == PM8110_SUBTYPE)
+		minor = rev2;
+
+	dev_dbg(dev, "%x: %s v%d.%d\n", subtype, name, major, minor);
+}
+
 static const struct regmap_config spmi_regmap_config = {
 	.reg_bits	= 16,
 	.val_bits	= 8,
@@ -33,6 +127,8 @@ static int pmic_spmi_probe(struct spmi_device *sdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);

+	pmic_spmi_show_revid(regmap, &sdev->dev);
+
 	return of_platform_populate(root, NULL, NULL, &sdev->dev);
 }

@@ -41,13 +137,6 @@ static void pmic_spmi_remove(struct spmi_device *sdev)
 	of_platform_depopulate(&sdev->dev);
 }

-static const struct of_device_id pmic_spmi_id_table[] = {
-	{ .compatible = "qcom,spmi-pmic" },
-	{ .compatible = "qcom,pm8941" },
-	{ .compatible = "qcom,pm8841" },
-	{ .compatible = "qcom,pma8084" },
-	{ }
-};
 MODULE_DEVICE_TABLE(of, pmic_spmi_id_table);

 static struct spmi_driver pmic_spmi_driver = {
--
1.9.1
