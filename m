From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 2/5] mfd: qcom-spmi-pmic: use devm_mfd_add_devices instead of devm_of_platform_populate
Date: Sun,  6 Jan 2019 21:11:42 -0500
Message-ID: <20190107021145.6370-3-masneyb@onstation.org>
References: <20190107021145.6370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, lee.jones@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

pmic_spmi_probe calls devm_of_platform_populate, which traverses all
of the children in device tree from the parent down to the children,
grandchildren, etc. of_irq_count is called on most of the nodes (via
of_device_alloc) and this initializes all of the IRQs. Further along in
the boot process, spmi-gpio is initialized as a hierarchical IRQ chip
in a later patch (with spmi-arb as the parent IRQ domain), and the same
hwirq is now associated with two Linux virqs and IRQs will not work as
expected. Correct this issue by using devm_mfd_add_devices to initialize
just the children so that IRQs are initialized on an as-needed basis.

This patch also selects CONFIG_MFD_CORE since this is required by
devm_mfd_add_devices.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/mfd/Kconfig          |  1 +
 drivers/mfd/qcom-spmi-pmic.c | 61 ++++++++++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f461460a2aeb..ef27b3927295 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -960,6 +960,7 @@ config MFD_SPMI_PMIC
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on OF
 	depends on SPMI
+	select MFD_CORE
 	select REGMAP_SPMI
 	help
 	  This enables support for the Qualcomm SPMI PMICs.
diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index e2e95de649a4..21aa880e3503 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -12,10 +12,10 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/spmi.h>
 #include <linux/regmap.h>
-#include <linux/of_platform.h>
 
 #define PMIC_REV2		0x101
 #define PMIC_REV3		0x102
@@ -124,6 +124,61 @@ static const struct regmap_config spmi_regmap_config = {
 	.fast_io	= true,
 };
 
+static const struct mfd_cell pmic_spmi_cells[] = {
+	{
+		.name = "spmi-mpp",
+		.of_compatible = "qcom,spmi-mpp",
+	},
+	{
+		.name = "spmi-temp-alarm",
+		.of_compatible = "qcom,spmi-temp-alarm",
+	},
+	{
+		.name = "pm8941-rtc",
+		.of_compatible = "qcom,pm8941-rtc",
+	},
+	{
+		.name = "pm8941-pwrkey",
+		.of_compatible = "qcom,pm8941-pwrkey",
+	},
+	{
+		.name = "pm8941-misc",
+		.of_compatible = "qcom,pm8941-misc",
+	},
+	{
+		.name = "pm8941-charger",
+		.of_compatible = "qcom,pm8941-charger",
+	},
+	{
+		.name = "spmi-gpio",
+		.of_compatible = "qcom,spmi-gpio",
+	},
+	{
+		.name = "spmi-mpp",
+		.of_compatible = "qcom,spmi-mpp",
+	},
+	{
+		.name = "spmi-vadc",
+		.of_compatible = "qcom,spmi-vadc",
+	},
+	{
+		.name = "spmi-iadc",
+		.of_compatible = "qcom,spmi-iadc",
+	},
+	{
+		.name = "pm8941-coincell",
+		.of_compatible = "qcom,pm8941-coincell",
+	},
+	{
+		.name = "pm8941-wled",
+		.of_compatible = "qcom,pm8941-wled",
+	},
+	{
+		.name = "pm8941-regulators",
+		.of_compatible = "qcom,pm8941-regulators",
+	},
+};
+
 static int pmic_spmi_probe(struct spmi_device *sdev)
 {
 	struct regmap *regmap;
@@ -136,7 +191,9 @@ static int pmic_spmi_probe(struct spmi_device *sdev)
 	if (sdev->usid % 2 == 0)
 		pmic_spmi_show_revid(regmap, &sdev->dev);
 
-	return devm_of_platform_populate(&sdev->dev);
+	return devm_mfd_add_devices(&sdev->dev, PLATFORM_DEVID_AUTO,
+				    pmic_spmi_cells,
+				    ARRAY_SIZE(pmic_spmi_cells), NULL, 0, NULL);
 }
 
 MODULE_DEVICE_TABLE(of, pmic_spmi_id_table);
-- 
2.17.2
