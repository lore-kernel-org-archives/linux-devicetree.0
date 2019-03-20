From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 1/2] arm64: dts: qcom: pms405: calibrate the VADC correctly
Date: Wed, 20 Mar 2019 19:09:57 +0530
Message-ID: <08751dd65ad76558724ce4d495b2a85d7ea27ca5.1553088982.git.amit.kucheria@linaro.org>
References: <cover.1553088982.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553088982.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1553088982.git.amit.kucheria@linaro.org>
References: <cover.1553088982.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Set the qcom,ratiometric property to make the VADC use the VDD reference
(1.875V) and GND for channel calibration of the temperature channels
instead of 1.25V. Allow a 200us delay between the AMUX configuration and
ADC starting conversion using qcom,hw-settle-time as described in
documentation.

Fixes: 041b9a7b9fdb ("arm64: dts: pms405: Export PMIC temperature to thermal framework")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 1bb836d1e8aa..8b6aa2334f56 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -110,16 +110,22 @@
 
 			xo_therm_100k_pu {
 				reg = <ADC5_XO_THERM_100K_PU>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
 			};
 
 			amux_thm1_100k_pu {
 				reg = <ADC5_AMUX_THM1_100K_PU>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
 			};
 
 			amux_thm3_100k_pu {
 				reg = <ADC5_AMUX_THM3_100K_PU>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
 			};
 		};
-- 
2.17.1
