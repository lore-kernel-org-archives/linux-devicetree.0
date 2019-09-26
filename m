From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 1/2] ARM: dts: msm8974-FP2: Drop unused card-detect pin
Date: Thu, 26 Sep 2019 20:44:34 +0200
Message-ID: <20190926184436.1078314-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The gpio is not used for SD card detection on the FP2.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index bf402ae39226..2869be16bc6e 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -272,14 +272,6 @@
 			};
 		};
 
-		sdhc2_cd_pin_a: sdhc2-cd-pin-active {
-			pins = "gpio62";
-			function = "gpio";
-
-			drive-strength = <2>;
-			bias-disable;
-		};
-
 		sdhc2_pin_a: sdhc2-pin-active {
 			clk {
 				pins = "sdc2_clk";
@@ -317,7 +309,7 @@
 		bus-width = <4>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&sdhc2_pin_a>, <&sdhc2_cd_pin_a>;
+		pinctrl-0 = <&sdhc2_pin_a>;
 	};
 
 	usb@f9a55000 {
-- 
2.23.0
