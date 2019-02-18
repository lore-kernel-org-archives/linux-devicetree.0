From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 05/12] arm64: dts: msm8998: thermal: Fix the cpu sensor numbers
Date: Mon, 18 Feb 2019 18:05:19 +0530
Message-ID: <bbedd3634138517914449e5a488c38047aaa2fd0.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The silver cluster (typically cpu0-3) are monitored by sensor IDs 1-3 on
tsens controller 0. The gold cluster (typically cpu4-7) are monitored by
sensor IDs 7-10 on tsens controller 0.

Fixes: 4449b6f248d9a1 ("arm64: dts: qcom: msm8998: Add tsens and thermal-zones")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index db4cb687126b..662ca458e64a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -336,7 +336,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens0 6>;
+			thermal-sensors = <&tsens0 1>;
 
 			trips {
 				cpu_alert0: trip0 {
@@ -357,7 +357,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens0 7>;
+			thermal-sensors = <&tsens0 2>;
 
 			trips {
 				cpu_alert1: trip0 {
@@ -378,7 +378,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens0 8>;
+			thermal-sensors = <&tsens0 3>;
 
 			trips {
 				cpu_alert2: trip0 {
@@ -399,7 +399,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens0 9>;
+			thermal-sensors = <&tsens0 4>;
 
 			trips {
 				cpu_alert3: trip0 {
@@ -420,7 +420,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens0 10>;
+			thermal-sensors = <&tsens0 7>;
 
 			trips {
 				cpu_alert4: trip0 {
@@ -441,7 +441,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens0 11>;
+			thermal-sensors = <&tsens0 8>;
 
 			trips {
 				cpu_alert5: trip0 {
@@ -462,7 +462,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens1 0>;
+			thermal-sensors = <&tsens0 9>;
 
 			trips {
 				cpu_alert6: trip0 {
@@ -483,7 +483,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens1 1>;
+			thermal-sensors = <&tsens0 10>;
 
 			trips {
 				cpu_alert7: trip0 {
-- 
2.17.1
