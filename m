From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 3/8] arm64: dts: qcom: msm8998: Add tsens and thermal-zones
Date: Mon,  3 Sep 2018 22:01:18 -0700
Message-ID: <20180904050123.26601-4-bjorn.andersson@linaro.org>
References: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the two tsens instances and the thermal zones for CPUs, GPUs,
battery and skin sensors.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch

 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |  38 +++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     | 193 ++++++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 09b46c54e413..202aa1a5cf27 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -12,6 +12,44 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	thermal-zones {
+		battery-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				battery_crit: trip0 {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		skin-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				skin_alert: trip0 {
+					temperature = <44000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				skip_crit: trip1 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 98b9edb89424..f92f04f9ed6d 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -225,6 +225,183 @@
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal0 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit0: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal1 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu_alert1: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit1: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal2 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu_alert2: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit2: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal3 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu_alert3: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit3: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal4 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				cpu_alert4: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit4: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal5 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				cpu_alert5: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit5: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal6 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				cpu_alert6: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit6: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal7 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu_alert7: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit7: trip1 {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 3>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
@@ -281,6 +458,22 @@
 			cell-index = <0>;
 		};
 
+		tsens0: thermal@10aa000 {
+			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
+			reg = <0x10aa000 0x2000>;
+
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal@10ad000 {
+			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
+			reg = <0x10ad000 0x2000>;
+
+			#qcom,sensors = <8>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		apcs_glb: mailbox@9820000 {
 			compatible = "qcom,msm8998-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
2.18.0
