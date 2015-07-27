From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 3/7] ARM: dts: qs600: Add real regulators to sdcc
Date: Mon, 27 Jul 2015 14:50:20 +0100
Message-ID: <1438005020-16306-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds real regulators to sdcc nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 71512b3..23ff599 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -67,6 +67,12 @@
 					bias-pull-down;
 				};
 
+				pm8921_l5: l5 {
+					regulator-min-microvolt = <2750000>;
+					regulator-max-microvolt = <3000000>;
+					bias-pull-down;
+				};
+
 				pm8921_l23: l23 {
 					regulator-min-microvolt = <1700000>;
 					regulator-max-microvolt = <1900000>;
@@ -140,19 +146,34 @@
 			status = "okay";
 		};
 
+		/* on board fixed 3.3v supply */
+		v3p3_fixed: v3p3 {
+			compatible = "regulator-fixed";
+			regulator-name = "PCIE V3P3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
 		amba {
 			/* eMMC */
 			sdcc1: sdcc@12400000 {
 				status = "okay";
+				vmmc-supply = <&pm8921_l5>;
+				vqmmc-supply = <&pm8921_s4>;
 			};
 
 			/* External micro SD card */
 			sdcc3: sdcc@12180000 {
 				status = "okay";
+				vmmc-supply = <&v3p3_fixed>;
 			};
 			/* WLAN */
 			sdcc4: sdcc@121c0000 {
 				status = "okay";
+				vmmc-supply = <&v3p3_fixed>;
+				vqmmc-supply = <&v3p3_fixed>;
+				mmc-pwrseq = <&sdcc4_pwrseq>;
 			};
 		};
 	};
-- 
1.9.1
