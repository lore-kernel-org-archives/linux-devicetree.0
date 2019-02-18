From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 08/12] arm64: dts: msm8998: thermal: Add temperature sensors near major peripherals
Date: Mon, 18 Feb 2019 18:05:22 +0530
Message-ID: <cfbf5b94cde763ea739b1c6e63d9d30463c0a63d.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

msm8998 has a total of 22 temperature sensors. Populate DT with
information about them.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 63 +++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index dc641523fcbd..26a493af0866 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -513,6 +513,69 @@
 
 			thermal-sensors = <&tsens0 13>;
 		};
+
+		cluster0-mhm-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 5>;
+		};
+
+		cluster1-mhm-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 6>;
+		};
+
+		cluster1-l2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 11>;
+		};
+
+		modem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 1>;
+		};
+
+		mem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 2>;
+		};
+
+		wlan-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 3>;
+		};
+
+		q6-dsp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 4>;
+		};
+
+		camera-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 5>;
+		};
+
+		multimedia-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 6>;
+		};
 	};
 
 	timer {
-- 
2.17.1
