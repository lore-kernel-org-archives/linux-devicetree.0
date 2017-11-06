From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: add description of Socionext EXIU interrupt controller
Date: Mon,  6 Nov 2017 18:34:36 +0000
Message-ID: <20171106183437.18214-1-ard.biesheuvel@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a description of the External Interrupt Unit (EXIU) interrupt
controller as found on the Socionext SynQuacer SoC.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/interrupt-controller/socionext,synquacer-exiu.txt | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/socionext,synquacer-exiu.txt b/Documentation/devicetree/bindings/interrupt-controller/socionext,synquacer-exiu.txt
new file mode 100644
index 000000000000..dc3778b6fbee
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/socionext,synquacer-exiu.txt
@@ -0,0 +1,32 @@
+Socionext SynQuacer External Interrupt Unit (EXIU)
+
+The Socionext Synquacer SoC has an external interrupt unit (EXIU)
+that forwards a block of 32 configurable input lines to 32 adjacent
+level-high type GICv3 SPIs.
+
+Required properties:
+
+- compatible           : Should be "socionext,synquacer-exiu".
+- reg                  : Specifies base physical address and size of the
+                         control registers.
+- interrupt-controller : Identifies the node as an interrupt controller.
+- #interrupt-cells     : Specifies the number of cells needed to encode an
+                         interrupt source. The value must be 3.
+- interrupt-parent     : phandle of the GIC these interrupts are routed to.
+- socionext,spi-base   : The SPI number of the first SPI of the 32 adjacent
+                         ones the EXIU forwards its interrups to.
+
+Notes:
+
+- Only SPIs can use the EXIU as an interrupt parent.
+
+Example:
+
+	exiu: exiu@510c0000 {
+		compatible = "socionext,synquacer-exiu";
+		reg = <0x0 0x510c0000 0x0 0x20>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <3>;
+		socionext,spi-base = <112>;
+	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
