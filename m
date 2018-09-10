From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 1/2] arm64: dts: msm8916: Add gpu thermal management
Date: Mon, 10 Sep 2018 12:47:14 +0530
Message-ID: <3f859c7f5af7955d779cdaa88fc09f0b1d79a35e.1536563656.git.amit.kucheria@linaro.org>
References: <cover.1536563656.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1536563656.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1536563656.git.amit.kucheria@linaro.org>
References: <cover.1536563656.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Initialise the gpu thermal zone to export temperature to userspace.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 7b32b8990d62..a494196a657e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -237,6 +237,26 @@
 			};
 		};
 
+		gpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				gpu_alert: trip0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				gpu_crit: trip1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
 	};
 
 	cpu_opp_table: cpu_opp_table {
-- 
2.17.1
