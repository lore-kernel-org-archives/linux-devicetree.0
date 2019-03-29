From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 02/13] arm64: dts: msm8998: efficiency is not valid property
Date: Fri, 29 Mar 2019 15:42:08 +0530
Message-ID: <ccc5ea963b75ce613a11ae77dd4fb42e12bc1507.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

efficiency comes from downstream. The valid upstream property is
capacity-dmips-mhz but until we can come up with those numbers, remove
this property.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index ac25e9142cbd..0b6de0c29ee8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -78,7 +78,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 				compatible = "arm,arch-cache";
@@ -97,7 +96,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
 				compatible = "arm,arch-cache";
@@ -112,7 +110,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
 				compatible = "arm,arch-cache";
@@ -127,7 +124,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
 				compatible = "arm,arch-cache";
@@ -142,7 +138,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 				compatible = "arm,arch-cache";
@@ -161,7 +156,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
 				compatible = "arm,arch-cache";
@@ -176,7 +170,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
 				compatible = "arm,arch-cache";
@@ -191,7 +184,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
 				compatible = "arm,arch-cache";
-- 
2.17.1
