From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 13/13] arm64: dts: msm8916: thermal: Convert camera trip type to hot
Date: Fri, 29 Mar 2019 15:42:19 +0530
Message-ID: <86fe318aa10e4fa967b88cf1d0a728271a54613e.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We don't have any cooling-devices related to the camera. Use the "hot"
trip type so allow the temperature to be exported to userspace and
remove the "critical" trip.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index ea734b98ec96..e4b1010f70b6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -270,12 +270,7 @@
 				cam_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
-					type = "passive";
-				};
-				cam_crit: cam_crit {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "critical";
+					type = "hot";
 				};
 			};
 		};
-- 
2.17.1
