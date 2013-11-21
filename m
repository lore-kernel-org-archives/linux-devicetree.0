From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v2 1/1] dt: binding: reword PowerPC 8xxx GPIO documentation
Date: Thu, 21 Nov 2013 09:41:44 +0100
Message-ID: <1385023304-15396-1-git-send-email-gsi@denx.de>
References: <1384983293-11002-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384983293-11002-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Rob Herring@" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

re-format and re-word the device tree binding documentation for MPC8xxx
and compatibles, reference the common document for interrupt controllers
and remove outdated duplicate SoC specific information

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring@ <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---

changes in v2:
- s/CHIP/chip/ in 'compatible', s/and/or/ for the
  list of strings to use in 'compatible'
- "should be two" and "s/specific/available/ set of
  trigger conditions" in '#interrupt-cells'
- IRQ controller properties added to the 'gpio1' example node
  as it is referenced as one from 'funkyfpga'
---
 .../devicetree/bindings/gpio/8xxx_gpio.txt         |   66 ++++++++++++--------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt b/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
index b0019eb5330e..798cfc9d3839 100644
--- a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
@@ -5,16 +5,42 @@ This is for the non-QE/CPM/GUTs GPIO controllers as found on
 
 Every GPIO controller node must have #gpio-cells property defined,
 this information will be used to translate gpio-specifiers.
+See bindings/gpio/gpio.txt for details of how to specify GPIO
+information for devices.
+
+The GPIO module usually is connected to the SoC's internal interrupt
+controller, see bindings/interrupt-controller/interrupts.txt (the
+interrupt client nodes section) for details how to specify this GPIO
+module's interrupt.
+
+The GPIO module may serve as another interrupt controller (cascaded to
+the SoC's internal interrupt controller).  See the interrupt controller
+nodes section in bindings/interrupt-controller/interrupts.txt for
+details.
 
 Required properties:
-- compatible : "fsl,<CHIP>-gpio" followed by "fsl,mpc8349-gpio" for
-  83xx, "fsl,mpc8572-gpio" for 85xx and "fsl,mpc8610-gpio" for 86xx.
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters (currently unused).
- - interrupts : Interrupt mapping for GPIO IRQ.
- - interrupt-parent : Phandle for the interrupt controller that
-   services interrupts for this device.
-- gpio-controller : Marks the port as GPIO controller.
+- compatible:		"fsl,<chip>-gpio" followed by "fsl,mpc8349-gpio"
+			for 83xx, "fsl,mpc8572-gpio" for 85xx, or
+			"fsl,mpc8610-gpio" for 86xx.
+- #gpio-cells:		Should be two. The first cell is the pin number
+			and the second cell is used to specify optional
+			parameters (currently unused).
+- interrupt-parent:	Phandle for the interrupt controller that
+			services interrupts for this device.
+- interrupts:		Interrupt mapping for GPIO IRQ.
+- gpio-controller:	Marks the port as GPIO controller.
+
+Optional properties:
+- interrupt-controller:	Empty boolean property which marks the GPIO
+			module as an IRQ controller.
+- #interrupt-cells:	Should be two.  Defines the number of integer
+			cells required to specify an interrupt within
+			this interrupt controller.  The first cell
+			defines the pin number, the second cell
+			defines additional flags (trigger type,
+			trigger polarity).  Note that the available
+			set of trigger conditions supported by the
+			GPIO module depends on the actual SoC.
 
 Example of gpio-controller nodes for a MPC8347 SoC:
 
@@ -22,39 +48,27 @@ Example of gpio-controller nodes for a MPC8347 SoC:
 		#gpio-cells = <2>;
 		compatible = "fsl,mpc8347-gpio", "fsl,mpc8349-gpio";
 		reg = <0xc00 0x100>;
-		interrupts = <74 0x8>;
 		interrupt-parent = <&ipic>;
+		interrupts = <74 0x8>;
 		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 	};
 
 	gpio2: gpio-controller@d00 {
 		#gpio-cells = <2>;
 		compatible = "fsl,mpc8347-gpio", "fsl,mpc8349-gpio";
 		reg = <0xd00 0x100>;
-		interrupts = <75 0x8>;
 		interrupt-parent = <&ipic>;
+		interrupts = <75 0x8>;
 		gpio-controller;
 	};
 
-See booting-without-of.txt for details of how to specify GPIO
-information for devices.
-
-To use GPIO pins as interrupt sources for peripherals, specify the
-GPIO controller as the interrupt parent and define GPIO number +
-trigger mode using the interrupts property, which is defined like
-this:
-
-interrupts = <number trigger>, where:
- - number: GPIO pin (0..31)
- - trigger: trigger mode:
-	2 = trigger on falling edge
-	3 = trigger on both edges
-
-Example of device using this is:
+Example of a peripheral using the GPIO module as an IRQ controller:
 
 	funkyfpga@0 {
 		compatible = "funky-fpga";
 		...
-		interrupts = <4 3>;
 		interrupt-parent = <&gpio1>;
+		interrupts = <4 3>;
 	};
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
