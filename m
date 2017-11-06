From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] arm64: dts: actions: Add S900 clock management unit nodes
Date: Tue,  7 Nov 2017 01:15:51 +0530
Message-ID: <1509997552-29718-3-git-send-email-manivannan.sadhasivam@linaro.org>
References: <1509997552-29718-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509997552-29718-1-git-send-email-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, afaerber@suse.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, arnd@arndb.de, davem@davemloft.net, mchehab@kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, viresh.kumar@linaro.org, manivannanece23@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add Actions Semi S900 Clock Management Unit (CMU) nodes

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v2:

1. Fixed commit message
2. Changed "diff_24M" to "diff24M"
3. Changed clock-controller node name to "cmu"
4. Added clocks property
5. Moved "cmu" node under "soc" node
6. Sorted headers in alphabetical order

 arch/arm64/boot/dts/actions/s900.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
index 11406f6..bc0963e 100644
--- a/arch/arm64/boot/dts/actions/s900.dtsi
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -4,6 +4,7 @@
  * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 
+#include <dt-bindings/clock/actions,s900-cmu.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -88,6 +89,18 @@
 		#clock-cells = <0>;
 	};
 
+	losc: losc {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
+	};
+
+	diff24M: diff24M {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -154,6 +167,13 @@
 			status = "disabled";
 		};
 
+		cmu: clock-controller@e0160000 {
+			compatible = "actions,s900-cmu";
+			reg = <0 0xe0160000 0 0x1000>;
+			clocks = <&hosc>, <&losc>;
+			#clock-cells = <1>;
+		};
+
 		timer: timer@e0228000 {
 			compatible = "actions,s900-timer";
 			reg = <0x0 0xe0228000 0x0 0x8000>;
-- 
2.7.4
