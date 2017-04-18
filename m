From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 3/7] ARM: dts: imx7s: Add node for GPC
Date: Tue, 18 Apr 2017 08:01:29 -0700
Message-ID: <20170418150133.31679-4-andrew.smirnov@gmail.com>
References: <20170418150133.31679-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170418150133.31679-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, yurovsky@gmail.com, Dong Aisheng <aisheng.dong@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add node for GPC and specify as a parent interrupt controller for SoC bus.

Cc: yurovsky@gmail.com
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 7148eac..5ba1289 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -42,6 +42,7 @@
  */
 
 #include <dt-bindings/clock/imx7d-clock.h>
+#include <dt-bindings/power/imx7-power.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -119,7 +120,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
-		interrupt-parent = <&intc>;
+		interrupt-parent = <&gpc>;
 		ranges;
 
 		funnel@30041000 {
@@ -301,6 +302,7 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			interrupt-parent = <&intc>;
 			reg = <0x31001000 0x1000>,
 			      <0x31002000 0x2000>,
 			      <0x31004000 0x2000>,
@@ -309,6 +311,7 @@
 
 		timer {
 			compatible = "arm,armv7-timer";
+			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
@@ -565,6 +568,27 @@
 				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 				#reset-cells = <1>;
 			};
+
+			gpc: gpc@303a0000 {
+				compatible = "fsl,imx7d-gpc";
+				reg = <0x303a0000 0x10000>;
+				interrupt-controller;
+				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+				#interrupt-cells = <3>;
+				interrupt-parent = <&intc>;
+				#power-domain-cells = <1>;
+
+				pgc {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					pgc_pcie_phy: pgc-power-domain@IMX7_POWER_DOMAIN_PCIE_PHY {
+						#power-domain-cells = <0>;
+						reg = <IMX7_POWER_DOMAIN_PCIE_PHY>;
+						power-supply = <&reg_1p0d>;
+					};
+				};
+			};
 		};
 
 		aips2: aips-bus@30400000 {
-- 
2.9.3
