From: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2 1/2] irqchip: add documentation for TS-4800 interrupt controller
Date: Mon, 21 Dec 2015 15:11:22 -0500
Message-ID: <1450728683-31416-1-git-send-email-damien.riegel@savoirfairelinux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an interrupt-controller implemented in an FPGA, to multiplex
interrupts generated from other IPs. The FPGA usually uses a GPIO as a
parent interrupt controller to notify that one of the multiplexed
interrupts has triggered.

Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes in v2:
 - Added Acked-by Rob Herring.

 .../bindings/interrupt-controller/technologic,ts4800.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt b/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt
new file mode 100644
index 0000000..7f15f1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt
@@ -0,0 +1,16 @@
+TS-4800 FPGA interrupt controller
+
+TS-4800 FPGA has an internal interrupt controller. When one of the
+interrupts is triggered, the SoC is notified, usually using a GPIO as
+parent interrupt source.
+
+Required properties:
+- compatible: should be "technologic,ts4800-irqc"
+- interrupt-controller: identifies the node as an interrupt controller
+- reg: physical base address of the controller and length of memory mapped
+  region
+- #interrupt-cells: specifies the number of cells needed to encode an interrupt
+  source, should be 1.
+- interrupt-parent: phandle to the parent interrupt controller this one is
+  cascaded from
+- interrupts: specifies the interrupt line in the interrupt-parent controller
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
