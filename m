From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v4 3/3] ARM: dts: BCM63xx: Add ARMPLL device tree nodes
Date: Thu, 29 Oct 2015 18:23:19 -0700
Message-ID: <1446168199-5959-4-git-send-email-f.fainelli@gmail.com>
References: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

Add the ARM PLL controller which comes standard with the Cortex-A9 found
on the BCM63138 SoCs. This is the same controller as the one found in
the Broadcom iProc architecture, however, we have a separate compatible
string to indicate the integration difference, since the hardware is
different.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v4:
- properly reflect the HW clocking and make it clear that periph_clk
  is feeding into the ARM PLL clock domain

No changes in v2 or v3

 arch/arm/boot/dts/bcm63138.dtsi | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
index 34cd64051250..d0560e8cd6de 100644
--- a/arch/arm/boot/dts/bcm63138.dtsi
+++ b/arch/arm/boot/dts/bcm63138.dtsi
@@ -43,18 +43,31 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		arm_timer_clk: arm_timer_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <500000000>;
-		};
-
+		/* UBUS peripheral clock */
 		periph_clk: periph_clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <50000000>;
 			clock-output-names = "periph";
 		};
+
+		/* peripheral clock for system timer */
+		axi_clk: axi_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&armpll>;
+			clock-div = <2>;
+			clock-mult = <1>;
+		};
+
+		/* APB bus clock */
+		apb_clk: apb_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&armpll>;
+			clock-div = <4>;
+			clock-mult = <1>;
+		};
 	};
 
 	/* ARM bus */
@@ -93,14 +106,14 @@
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x1e200 0x20>;
 			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&arm_timer_clk>;
+			clocks = <&axi_clk>;
 		};
 
 		local_timer: local-timer@1e600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x1e600 0x20>;
 			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&arm_timer_clk>;
+			clocks = <&axi_clk>;
 		};
 
 		twd_watchdog: watchdog@1e620 {
@@ -109,6 +122,13 @@
 			interrupts = <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		armpll: armpll {
+			#clock-cells = <0>;
+			compatible = "brcm,bcm63138-armpll";
+			clocks = <&periph_clk>;
+			reg = <0x20000 0xf00>;
+		};
+
 		pmb0: reset-controller@4800c0 {
 			compatible = "brcm,bcm63138-pmb";
 			reg = <0x4800c0 0x10>;
-- 
2.1.0

