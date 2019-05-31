From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 2/2] reset: qcom-pon: Add support for gen2 pon
Date: Fri, 31 May 2019 23:47:34 +0000
Message-ID: <20190531234734.102842-2-john.stultz@linaro.org>
References: <20190531234734.102842-1-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531234734.102842-1-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for gen2 pon register so "reboot bootloader" can
work on pixel3 and db845.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi |  2 +-
 drivers/power/reset/qcom-pon.c       | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index d3ca35a940fb..051a52df80f9 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -39,7 +39,7 @@
 		#size-cells = <0>;
 
 		pm8998_pon: pon@800 {
-			compatible = "qcom,pm8916-pon";
+			compatible = "qcom,pm8998-pon";
 
 			reg = <0x800>;
 			mode-bootloader = <0x2>;
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 3fa1642d4c54..d0336a1612a4 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -14,11 +14,15 @@
 
 #define PON_SOFT_RB_SPARE		0x8f
 
+#define GEN1_REASON_SHIFT		2
+#define GEN2_REASON_SHIFT		1
+
 struct pm8916_pon {
 	struct device *dev;
 	struct regmap *regmap;
 	u32 baseaddr;
 	struct reboot_mode_driver reboot_mode;
+	long reason_shift;
 };
 
 static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -30,15 +34,18 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
 
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
-				 0xfc, magic << 2);
+				 0xfc, magic << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
 	return ret;
 }
 
+static const struct of_device_id pm8916_pon_id_table[];
+
 static int pm8916_pon_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct pm8916_pon *pon;
 	int error;
 
@@ -60,6 +67,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 		return error;
 
 	pon->reboot_mode.dev = &pdev->dev;
+	pon->reason_shift = of_device_get_match_data(&pdev->dev);
 	pon->reboot_mode.write = pm8916_reboot_mode_write;
 	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 	if (error) {
@@ -73,8 +81,9 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id pm8916_pon_id_table[] = {
-	{ .compatible = "qcom,pm8916-pon" },
-	{ .compatible = "qcom,pms405-pon" },
+	{ .compatible = "qcom,pm8916-pon", .data = (void *)GEN1_REASON_SHIFT },
+	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
+	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8916_pon_id_table);
-- 
2.17.1
