From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 6/7] arm64: dts: sdm845: Increase alert trip point to 95 degrees
Date: Thu, 10 Jan 2019 05:30:55 +0530
Message-ID: <041258d65883df964890249a24d2a4788c419304.1547078153.git.amit.kucheria@linaro.org>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1547078153.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1547078153.git.amit.kucheria@linaro.org>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
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
index c27cbd3bcb0a..29e823b0caf4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1692,7 +1692,7 @@
 
 			trips {
 				cpu_alert0: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1713,7 +1713,7 @@
 
 			trips {
 				cpu_alert1: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1734,7 +1734,7 @@
 
 			trips {
 				cpu_alert2: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1755,7 +1755,7 @@
 
 			trips {
 				cpu_alert3: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1776,7 +1776,7 @@
 
 			trips {
 				cpu_alert4: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1797,7 +1797,7 @@
 
 			trips {
 				cpu_alert5: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1818,7 +1818,7 @@
 
 			trips {
 				cpu_alert6: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -1839,7 +1839,7 @@
 
 			trips {
 				cpu_alert7: trip0 {
-					temperature = <75000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
-- 
2.17.1
