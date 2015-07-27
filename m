From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 2/7] ARM: dts: ifc6410: add real regulators for sdcc nodes.
Date: Mon, 27 Jul 2015 14:50:12 +0100
Message-ID: <1438005012-16263-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds real regulators for all the three sdcc nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index a7c939b..cdfcf02 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -73,6 +73,12 @@
 					bias-pull-down;
 				};
 
+				pm8921_l5: l5 {
+					regulator-min-microvolt = <2750000>;
+					regulator-max-microvolt = <3000000>;
+					bias-pull-down;
+				};
+
 				pm8921_l6: l6 {
 					regulator-min-microvolt = <2950000>;
 					regulator-max-microvolt = <2950000>;
@@ -84,6 +90,10 @@
 					regulator-max-microvolt = <1900000>;
 					bias-pull-down;
 				};
+
+				pm8921_lvs1: lvs1 {
+					bias-pull-down;
+				};
 			};
 		};
 
@@ -175,11 +185,14 @@
 			/* eMMC */
 			sdcc1: sdcc@12400000 {
 				status = "okay";
+				vmmc-supply = <&pm8921_l5>;
+				vqmmc-supply = <&pm8921_s4>;
 			};
 
 			/* External micro SD card */
 			sdcc3: sdcc@12180000 {
 				status = "okay";
+				vmmc-supply = <&pm8921_l6>;
 				pinctrl-names	= "default";
 				pinctrl-0	= <&card_detect>;
 				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
@@ -187,6 +200,8 @@
 			/* WLAN */
 			sdcc4: sdcc@121c0000 {
 				status = "okay";
+				vmmc-supply = <&ext_3p3v>;
+				vqmmc-supply = <&pm8921_lvs1>;
 			};
 		};
 	};
-- 
1.9.1
