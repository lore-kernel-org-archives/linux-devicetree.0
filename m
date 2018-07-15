From: Saravanan Sekar <sravanhome@gmail.com>
Subject: [PATCH v5 4/5] arm64: dts: actions: Add Clock Management Unit for S700
Date: Sun, 15 Jul 2018 22:01:50 +0200
Message-ID: <20180715200151.10416-5-sravanhome@gmail.com>
References: <20180715200151.10416-1-sravanhome@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180715200151.10416-1-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org, sboyd@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, sravanhome@gmail.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Add Clock Management Unit for Actions Semi S700 SoC.

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 66dd5309f0a2..4497741d48b2 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/actions,s700-cmu.h>
 
 / {
 	compatible = "actions,s700";
@@ -44,6 +45,13 @@
 		};
 	};
 
+	cmu: clock-controller@e0168000 {
+		compatible = "actions,s700-cmu";
+		reg = <0x0 0xe0168000 0x0 0x1000>;
+		clocks = <&hosc>, <&losc>;
+		#clock-cells = <1>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -87,6 +95,12 @@
 		#clock-cells = <0>;
 	};
 
+	losc: losc {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.18.0
