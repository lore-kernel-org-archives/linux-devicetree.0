From: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/2] devicetree: add binding for Sigma Designs SMP86xx interrupt controller
Date: Wed, 20 Jan 2016 18:07:16 +0000
Message-ID: <1453313237-18570-1-git-send-email-mans@mansr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a binding for the secondary interrupt controller in
Sigma Designs SMP86xx and SMP87xx chips.

Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
---
Changes:
- not included in v3
---
 .../interrupt-controller/sigma,smp8642-intc.txt    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
new file mode 100644
index 000000000000..2643f3466091
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
@@ -0,0 +1,49 @@
+Sigma Designs SMP86xx/SMP87xx secondary interrupt controller
+
+Required properties:
+- compatible: should be "sigma,smp8642-intc"
+- reg: physical address of MMIO region
+- ranges: address space mapping of child nodes
+- interrupt-parent: phandle of parent interrupt controller
+- interrupt-controller: boolean
+- #address-cells: should be <1>
+- #size-cells: should be <1>
+
+One child node per control block with properties:
+- reg: address of registers for this control block
+- interrupt-controller: boolean
+- #interrupt-cells: should be <2>, interrupt index and flags per interrupts.txt
+- interrupts: interrupt spec of primary interrupt controller
+
+Example:
+
+interrupt-controller@6e000 {
+	compatible = "sigma,smp8642-intc";
+	reg = <0x6e000 0x400>;
+	ranges = <0x0 0x6e000 0x400>;
+	interrupt-parent = <&gic>;
+	interrupt-controller;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	irq0: irq0 {
+		reg = <0x000 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	irq1: irq1 {
+		reg = <0x100 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	irq2: irq2 {
+		reg = <0x300 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
