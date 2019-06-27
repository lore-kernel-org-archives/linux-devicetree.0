From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404: Add missing space for cooling-cells property
Date: Thu, 27 Jun 2019 16:02:15 +0200
Message-ID: <20190627140215.29353-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: amit.kucheria@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There should be a space both before and after the equal sign.
Add a missing space for the cooling cells property.

Fixes: f48cee3239a1 ("arm64: dts: qcom: qcs404: Add thermal zones for each sensor")
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 01a51f381850..3d0789775009 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -35,7 +35,7 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
-			#cooling-cells= <2>;
+			#cooling-cells = <2>;
 		};
 
 		CPU1: cpu@101 {
@@ -45,7 +45,7 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
-			#cooling-cells= <2>;
+			#cooling-cells = <2>;
 		};
 
 		CPU2: cpu@102 {
@@ -55,7 +55,7 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
-			#cooling-cells= <2>;
+			#cooling-cells = <2>;
 		};
 
 		CPU3: cpu@103 {
@@ -65,7 +65,7 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
-			#cooling-cells= <2>;
+			#cooling-cells = <2>;
 		};
 
 		L2_0: l2-cache {
-- 
2.21.0
