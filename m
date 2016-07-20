From: Bhushan Shah <bshah@kde.org>
Subject: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Add sdhci1 node
Date: Wed, 20 Jul 2016 11:56:10 +0530
Message-ID: <20160720062610.20822-1-bshah@kde.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Bhushan Shah <bshah@kde.org>
List-Id: devicetree@vger.kernel.org

This introduces the eMMC sdhci node and its pinctrl state

Signed-off-by: Bhushan Shah <bshah@kde.org>
---
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 68f071f..947bd7f 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -233,6 +233,35 @@
 		status = "ok";
 	};
 
+	pinctrl@fd510000 {
+		sdhc1_pin_a: sdhc1-pin-active {
+			clk {
+				pins = "sdc1_clk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			cmd-data {
+				pins = "sdc1_cmd", "sdc1_data";
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+		};
+	};
+
+	sdhci@f9824900 {
+		status = "ok";
+
+		vmmc-supply = <&pm8941_l20>;
+		vqmmc-supply = <&pm8941_s3>;
+
+		bus-width = <8>;
+		non-removable;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdhc1_pin_a>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		input-name = "gpio-keys";
-- 
2.9.0
