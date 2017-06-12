From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v2 4/4] ARM: dts: bcm283x: Add and use bcm2835-aux-intc
Date: Mon, 12 Jun 2017 15:25:33 +0100
Message-ID: <248bb555-6dff-daf5-ca63-7d55c2992fce@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a DT node for the AUX interrupt controller, updating the AUX
peripheral nodes to make use of it.

Note that the IO region overlaps that of the AUX clock driver, but by
the time the intc driver appears in the tree the clock driver should
have been updated to ioremap the region without reserving it, along
with preparing for a point in the future where the clock node MEM
resource may be shrunk to the single word it actually needs.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index cc721a4..1febb6e 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -1,6 +1,7 @@
 #include <dt-bindings/pinctrl/bcm2835.h>
 #include <dt-bindings/clock/bcm2835.h>
 #include <dt-bindings/clock/bcm2835-aux.h>
+#include <dt-bindings/interrupt-controller/bcm2835-aux-intc.h>
 #include <dt-bindings/gpio/gpio.h>
 
 /* firmware-provided startup stubs live here, where the secondary CPUs are
@@ -459,7 +460,22 @@
 			status = "disabled";
 		};
 
-		aux: aux@0x7e215000 {
+		auxintc: interrupt-controller@7e215000 {
+			compatible = "brcm,bcm2835-aux-intc";
+			reg = <0x7e215000 0x4>;
+			interrupts = <1 29>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		/*
+		 * N.B. This node overlaps with the previous node,
+		 * but the updated driver remaps the region without
+		 * reserving it. After a suitable period this
+		 * node can be reduced to cover only the single word
+		 * at 7e215004.
+		 */
+		aux: aux@7e215000 {
 			compatible = "brcm,bcm2835-aux";
 			#clock-cells = <1>;
 			reg = <0x7e215000 0x8>;
@@ -469,7 +485,8 @@
 		uart1: serial@7e215040 {
 			compatible = "brcm,bcm2835-aux-uart";
 			reg = <0x7e215040 0x40>;
-			interrupts = <1 29>;
+			interrupt-parent = <&auxintc>;
+			interrupts = <BCM2835_AUX_IRQ_UART>;
 			clocks = <&aux BCM2835_AUX_CLOCK_UART>;
 			status = "disabled";
 		};
@@ -477,7 +494,8 @@
 		spi1: spi@7e215080 {
 			compatible = "brcm,bcm2835-aux-spi";
 			reg = <0x7e215080 0x40>;
-			interrupts = <1 29>;
+			interrupt-parent = <&auxintc>;
+			interrupts = <BCM2835_AUX_IRQ_SPI1>;
 			clocks = <&aux BCM2835_AUX_CLOCK_SPI1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -487,7 +505,8 @@
 		spi2: spi@7e2150c0 {
 			compatible = "brcm,bcm2835-aux-spi";
 			reg = <0x7e2150c0 0x40>;
-			interrupts = <1 29>;
+			interrupt-parent = <&auxintc>;
+			interrupts = <BCM2835_AUX_IRQ_SPI2>;
 			clocks = <&aux BCM2835_AUX_CLOCK_SPI2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
1.9.1
