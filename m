From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: [PATCH v2] mfd: Add specific compatible strings for Qualcomm's SPMI PMIC's
Date: Wed,  4 Mar 2015 12:19:25 +0200
Message-ID: <1425464365-3291-1-git-send-email-iivanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some of the PMIC's could have specific regmap configuration
tables in future, so add specific compatible strings for known
PMIC's. Also print runtime detected chip revision information.

Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
---

Changes since first version of this patch[1]:

 - Drop run compatible property update. Method did't work for modules.
 - Use more compact way to print detected chip name and revision.
 - Properly check regmap_read error codes.
 - Fix devicetree bindings description.
 - Rename patch description.

[1] https://lkml.org/lkml/2014/11/4/425

 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     | 19 ++++-
 drivers/mfd/qcom-spmi-pmic.c                       | 98 ++++++++++++++++++++--
 2 files changed, 106 insertions(+), 11 deletions(-)

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
index 4b8beb2..a1af4e5 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -17,6 +17,95 @@
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
+	[COMMON_SUBTYPE]  = { .compatible = "qcom,spmi-pmic" },
+	[PM8941_SUBTYPE]  = { .compatible = "qcom,pm8941" },
+	[PM8841_SUBTYPE]  = { .compatible = "qcom,pm8841" },
+	[PM8019_SUBTYPE]  = { .compatible = "qcom,pm8019" },
+	[PM8226_SUBTYPE]  = { .compatible = "qcom,pm8226" },
+	[PM8110_SUBTYPE]  = { .compatible = "qcom,pm8110" },
+	[PMA8084_SUBTYPE] = { .compatible = "qcom,pma8084" },
+	[PMI8962_SUBTYPE] = { .compatible = "qcom,pmi8962" },
+	[PMD9635_SUBTYPE] = { .compatible = "qcom,pmd9635" },
+	[PM8994_SUBTYPE]  = { .compatible = "qcom,pm8994" },
+	[PMI8994_SUBTYPE] = { .compatible = "qcom,pmi8994" },
+	[PM8916_SUBTYPE]  = { .compatible = "qcom,pm8916" },
+	[PM8004_SUBTYPE]  = { .compatible = "qcom,pm8004" },
+	[PM8909_SUBTYPE]  = { .compatible = "qcom,pm8909" },
+	{ }
+};
+
+static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
+{
+	unsigned int rev2, minor, major, type, subtype;
+	int ret;
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
+	if (subtype > ARRAY_SIZE(pmic_spmi_id_table))
+		return;
+
+	rev2 = regmap_read(map, PMIC_REV2, &rev2);
+	if (rev2 < 0)
+		return;
+
+	minor = regmap_read(map, PMIC_REV3, &minor);
+	if (minor < 0)
+		return;
+
+	major = regmap_read(map, PMIC_REV4, &major);
+	if (major < 0)
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
+	dev_info(dev, "%s-v%d.%d detected\n",
+		 pmic_spmi_id_table[subtype].compatible, major, minor);
+}
+
 static const struct regmap_config spmi_regmap_config = {
 	.reg_bits	= 16,
 	.val_bits	= 8,
@@ -33,6 +122,8 @@ static int pmic_spmi_probe(struct spmi_device *sdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);

+	pmic_spmi_show_revid(regmap, &sdev->dev);
+
 	return of_platform_populate(root, NULL, NULL, &sdev->dev);
 }

@@ -41,13 +132,6 @@ static void pmic_spmi_remove(struct spmi_device *sdev)
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
