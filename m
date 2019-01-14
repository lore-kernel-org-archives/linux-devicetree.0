From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 7/9] arm64: dts: sdm845: Increase alert trip point to 95 degrees
Date: Mon, 14 Jan 2019 15:51:09 +0530
Message-ID: <bdd6ebf7910ac04e1255afa1330207d3a0911b72.1547458732.git.amit.kucheria@linaro.org>
References: <cover.1547458732.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1547458732.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1547458732.git.amit.kucheria@linaro.org>
References: <cover.1547458732.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, viresh.kumar@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

75 degrees is too aggressive for throttling the CPU. After speaking to
Qualcomm engineers, increase it to 95 degrees.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0e659b0524ba..fb7da678b116 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1720,7 +1720,7 @@
 
 			trips {
 				cpu_alert0: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1741,7 +1741,7 @@
 
 			trips {
 				cpu_alert1: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1762,7 +1762,7 @@
 
 			trips {
 				cpu_alert2: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1783,7 +1783,7 @@
 
 			trips {
 				cpu_alert3: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1804,7 +1804,7 @@
 
 			trips {
 				cpu_alert4: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1825,7 +1825,7 @@
 
 			trips {
 				cpu_alert5: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1846,7 +1846,7 @@
 
 			trips {
 				cpu_alert6: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1867,7 +1867,7 @@
 
 			trips {
 				cpu_alert7: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
-- 
2.17.1
