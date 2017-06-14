From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH v3 4/4] ARM: dts: bcm283x: Add and use bcm2835-aux-intc
Date: Wed, 14 Jun 2017 17:29:10 +0100
Message-ID: <1497457750-35585-5-git-send-email-phil@raspberrypi.org>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
 <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497457750-35585-1-git-send-email-phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a DT node for the AUX interrupt controller, updating the AUX
peripheral nodes to make use of it.

Note that the IO region overlaps that of the AUX clock driver, but by
the time the irqchip driver appears in the tree the clock driver should
have been updated to ioremap the region without reserving it, along
with preparing for a point in the future where the clock node may be
shrunk to the single word it actually needs.

Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 431dcfc..b304221 100644
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
