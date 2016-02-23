From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 03/12] ARM: dts: apq8064: add pci support in CM QS600
Date: Tue, 23 Feb 2016 14:14:14 +0000
Message-ID: <1456236854-2511-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1456236639-1379-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456236639-1379-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds PCIE support to APQ8064, tested with Ethernet on
Compulab QS600 board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 21095da..35f1d46 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -37,6 +37,18 @@
 					bias-disable;
 				};
 			};
+
+			pcie_pins: pcie_pinmux {
+				mux {
+					pins = "gpio27";
+					function = "gpio";
+				};
+				conf {
+					pins = "gpio27";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
 		};
 
 		rpm@108000 {
@@ -103,6 +115,11 @@
 					regulator-max-microvolt = <1900000>;
 					bias-pull-down;
 				};
+
+				pm8921_lvs6: lvs6 {
+					bias-pull-down;
+				};
+
 			};
 		};
 
@@ -195,6 +212,16 @@
 			};
 		};
 
+		pci@1b500000 {
+			status = "ok";
+			vdda-supply = <&pm8921_s3>;
+			vdda_phy-supply = <&pm8921_lvs6>;
+			vdda_refclk-supply = <&v3p3_fixed>;
+			pinctrl-0 = <&pcie_pins>;
+			pinctrl-names = "default";
+			perst-gpio = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+		};
+
 		amba {
 			/* eMMC */
 			sdcc1: sdcc@12400000 {
-- 
1.9.1
