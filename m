From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Mon, 23 Jan 2017 15:00:45 +0100
Message-ID: <a4d90de597cfcfab5fddeeb538505774a980818b.1485180017.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ARM Mali Utgard GPU family is embedded into a number of SoCs from
Allwinner, Amlogic, Mediatek or Rockchip.

Add a binding for the GPU of that family.

Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

---

Changes from v1:
  - Dropped the arm,mali-utgard compatible
  - Made the clocks mandatory
  - Added Linus Walleij Reviewed-by, and the ST compatible for the Mali
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 79 ++++++++-
 1 file changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
new file mode 100644
index 000000000000..ba0edcdd1b00
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
@@ -0,0 +1,79 @@
+ARM Mali Utgard GPU
+===================
+
+Required properties:
+  - compatible
+    * Must be one of the following:
+      + "arm,mali-300"
+      + "arm,mali-400"
+      + "arm,mali-450"
+    * And, optionally, one of the vendor specific compatible:
+      + allwinner,sun4i-a10-mali
+      + allwinner,sun7i-a20-mali
+
+  - reg: Physical base address and length of the GPU registers
+
+  - interrupts: an entry for each entry in interrupt-names.
+    See ../interrupt-controller/interrupts.txt for details.
+
+  - interrupt-names:
+    * ppX: Pixel Processor X interrupt (X from 0 to 7)
+    * ppmmuX: Pixel Processor X MMU interrupt (X from 0 to 7)
+    * pp: Pixel Processor broadcast interrupt (mali-450 only)
+    * gp: Geometry Processor interrupt
+    * gpmmu: Geometry Processor MMU interrupt
+
+  - clocks: an entry for each entry in clock-names
+  - clock-names:
+    * bus: bus clock for the GPU
+    * core: clock driving the GPU itself
+
+Optional properties:
+  - interrupt-names and interrupts:
+    * pmu: Power Management Unit interrupt, if implemented in hardware
+
+Vendor-specific bindings
+------------------------
+
+The Mali GPU is integrated very differently from one SoC to
+another. In order to accomodate those differences, you have the option
+to specify one more vendor-specific compatible, among:
+
+  - allwinner,sun4i-a10-mali
+    Required properties:
+      * resets: phandle to the reset line for the GPU
+
+  - allwinner,sun7i-a20-mali
+    Required properties:
+      * resets: phandle to the reset line for the GPU
+
+  - stericsson,db8500-mali
+    Required properties:
+      * interrupt-names and interrupts:
+        + combined: combined interrupt of all of the above lines
+
+Example:
+
+mali: gpu@01c40000 {
+	compatible = "allwinner,sun7i-a20-mali", "arm,mali-400";
+	reg = <0x01c40000 0x10000>;
+	interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "gp",
+			  "gpmmu",
+			  "pp0",
+			  "ppmmu0",
+			  "pp1",
+			  "ppmmu1",
+			  "pmu";
+	clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
+	clock-names = "bus", "core";
+	resets = <&ccu RST_BUS_GPU>;
+};
+
+

base-commit: 49def1853334396f948dcb4cedb9347abb318df5
-- 
git-series 0.8.11
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
