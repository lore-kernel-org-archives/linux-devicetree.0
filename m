From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 02/12] arm64: dts: msm8998: efficiency is not valid property
Date: Mon, 18 Feb 2019 18:05:16 +0530
Message-ID: <bd63da47d92b9bbf942c9bc854d7bafcd3a0a87c.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
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
index 3c5fb2509d5f..db4cb687126b 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -77,7 +77,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 				compatible = "arm,arch-cache";
@@ -96,7 +95,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
 				compatible = "arm,arch-cache";
@@ -111,7 +109,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
 				compatible = "arm,arch-cache";
@@ -126,7 +123,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
-			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
 				compatible = "arm,arch-cache";
@@ -141,7 +137,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 				compatible = "arm,arch-cache";
@@ -160,7 +155,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
 				compatible = "arm,arch-cache";
@@ -175,7 +169,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
 				compatible = "arm,arch-cache";
@@ -190,7 +183,6 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
-			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
 				compatible = "arm,arch-cache";
-- 
2.17.1
