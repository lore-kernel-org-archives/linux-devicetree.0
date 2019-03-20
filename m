From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 2/2] arm64: dts: qcom: pms405: Rename adc outputs as per schematics
Date: Wed, 20 Mar 2019 19:09:58 +0530
Message-ID: <65fdb9213591901d30c9af89102c22a730fb2745.1553088982.git.amit.kucheria@linaro.org>
References: <cover.1553088982.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553088982.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1553088982.git.amit.kucheria@linaro.org>
References: <cover.1553088982.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The adc outputs shouldn't contain information about their configuration
e.g. 100K pull-up, but just reflect the name of the signal in the
schematics.

Making them labels also allows us to overwrite their configuration in
board-specific DTs.

Sort them by order as used in adc5_chans_rev2, while we're at it.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 8b6aa2334f56..37c8bea24796 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -98,7 +98,7 @@
 				qcom,pre-scaling = <1 1>;
 			};
 
-			vph_pwr {
+			pon_1: vph_pwr {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;
 			};
@@ -108,22 +108,22 @@
 				qcom,pre-scaling = <1 1>;
 			};
 
-			xo_therm_100k_pu {
-				reg = <ADC5_XO_THERM_100K_PU>;
+			pa_therm1: thermistor1 {
+				reg = <ADC5_AMUX_THM1_100K_PU>;
 				qcom,ratiometric;
 				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
 			};
 
-			amux_thm1_100k_pu {
-				reg = <ADC5_AMUX_THM1_100K_PU>;
+			pa_therm3: thermistor3 {
+				reg = <ADC5_AMUX_THM3_100K_PU>;
 				qcom,ratiometric;
 				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
 			};
 
-			amux_thm3_100k_pu {
-				reg = <ADC5_AMUX_THM3_100K_PU>;
+			xo_therm: xo_temp {
+				reg = <ADC5_XO_THERM_100K_PU>;
 				qcom,ratiometric;
 				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
-- 
2.17.1
