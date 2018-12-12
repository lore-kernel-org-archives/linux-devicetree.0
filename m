From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 2/2] arm64: dts: pms405: Export PMIC temperature to thermal framework
Date: Wed, 12 Dec 2018 15:47:55 +0530
Message-ID: <cb62259c6487f347f6a73fcc8c6ea88289c16928.1544599950.git.amit.kucheria@linaro.org>
References: <cover.1544599950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1544599950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1544599950.git.amit.kucheria@linaro.org>
References: <cover.1544599950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, mka@chromium.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The PMS405 PMIC has an ADC that exposes the on-die temperature that we
wire up to spmi-temp-alarm thermal driver. This allows the PMIC
temperature to be exposed to Linux through the thermal framework.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index ad2b62dfc9f6..1bb836d1e8aa 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -3,6 +3,32 @@
 
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		pms405 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&pms405_temp>;
+
+			trips {
+				pms405_alert0: pms405-alert0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				pms405_crit: pms405-crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
 
 &spmi_bus {
 	pms405_0: pms405@0 {
@@ -45,6 +71,59 @@
 			};
 		};
 
+		pms405_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pms405_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pms405_adc: adc@3100 {
+			compatible = "qcom,pms405-adc", "qcom,spmi-adc-rev2";
+			reg = <0x3100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			ref_gnd {
+				reg = <ADC5_REF_GND>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			vref_1p25 {
+				reg = <ADC5_1P25VREF>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			vph_pwr {
+				reg = <ADC5_VPH_PWR>;
+				qcom,pre-scaling = <1 3>;
+			};
+
+			die_temp {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			xo_therm_100k_pu {
+				reg = <ADC5_XO_THERM_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			amux_thm1_100k_pu {
+				reg = <ADC5_AMUX_THM1_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			amux_thm3_100k_pu {
+				reg = <ADC5_AMUX_THM3_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>;
-- 
2.17.1
