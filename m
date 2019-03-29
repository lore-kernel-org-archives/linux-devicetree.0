From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 03/13] arm64: dts: msm8916: thermal: Add sensor for modem
Date: Fri, 29 Mar 2019 15:42:09 +0530
Message-ID: <0f5d5623be3c60efde8a98b45b2e5808190d3675.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On platforms that have a modem, sensor 0 monitors the modem.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0803ca8c02da..c8aa9a0986d2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -278,7 +278,21 @@
 					type = "critical";
 				};
 			};
+		};
+
+		modem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 0>;
 
+			trips {
+				modem_alert0: trip-point@0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
 		};
 
 	};
-- 
2.17.1
