From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date: Fri, 26 Jul 2019 03:48:41 +0530
Message-ID: <5d86bfcdfd118294122e2182f3328fe823bc985d.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

msm8916 uses sensors 0, 1, 2, 4 and 5. Sensor 3 is NOT used. Fixup the
device tree so that the correct sensor ID is used and as a result we can
actually check the temperature for the cpu2_3 sensor.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..8686e101905c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -179,7 +179,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 4>;
+			thermal-sensors = <&tsens 5>;
 
 			trips {
 				cpu0_1_alert0: trip-point@0 {
@@ -209,7 +209,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 3>;
+			thermal-sensors = <&tsens 4>;
 
 			trips {
 				cpu2_3_alert0: trip-point@0 {
-- 
2.17.1
