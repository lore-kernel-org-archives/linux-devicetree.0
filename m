From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] irqchip: armada-370-xp: Move the devicetree binding documentation
Date: Mon, 12 May 2014 11:27:40 -0300
Message-ID: <1399904860-937-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Move the devicetree binding documentation to the interrupt-controller
directory, where it belongs.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/arm/armada-370-xp-mpic.txt | 38 ----------------------
 .../marvell,armada-370-xp-mpic.txt                 | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/armada-370-xp-mpic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-370-xp-mpic.txt

diff --git a/Documentation/devicetree/bindings/arm/armada-370-xp-mpic.txt b/Documentation/devicetree/bindings/arm/armada-370-xp-mpic.txt
deleted file mode 100644
index 5fc0313..0000000
--- a/Documentation/devicetree/bindings/arm/armada-370-xp-mpic.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Marvell Armada 370, 375, 38x, XP Interrupt Controller
------------------------------------------------------
-
-Required properties:
-- compatible: Should be "marvell,mpic"
-- interrupt-controller: Identifies the node as an interrupt controller.
-- msi-controller: Identifies the node as an PCI Message Signaled
-  Interrupt controller.
-- #interrupt-cells: The number of cells to define the interrupts. Should be 1.
-  The cell is the IRQ number
-
-- reg: Should contain PMIC registers location and length. First pair
-  for the main interrupt registers, second pair for the per-CPU
-  interrupt registers. For this last pair, to be compliant with SMP
-  support, the "virtual" must be use (For the record, these registers
-  automatically map to the interrupt controller registers of the
-  current CPU)
-
-Optional properties:
-
-- interrupts: If defined, then it indicates that this MPIC is
-  connected as a slave to another interrupt controller. This is
-  typically the case on Armada 375 and Armada 38x, where the MPIC is
-  connected as a slave to the Cortex-A9 GIC. The provided interrupt
-  indicate to which GIC interrupt the MPIC output is connected.
-
-Example:
-
-        mpic: interrupt-controller@d0020000 {
-              compatible = "marvell,mpic";
-              #interrupt-cells = <1>;
-              #address-cells = <1>;
-              #size-cells = <1>;
-              interrupt-controller;
-              msi-controller;
-              reg = <0xd0020a00 0x1d0>,
-                    <0xd0021070 0x58>;
-        };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-370-xp-mpic.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-370-xp-mpic.txt
new file mode 100644
index 0000000..5fc0313
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-370-xp-mpic.txt
@@ -0,0 +1,38 @@
+Marvell Armada 370, 375, 38x, XP Interrupt Controller
+-----------------------------------------------------
+
+Required properties:
+- compatible: Should be "marvell,mpic"
+- interrupt-controller: Identifies the node as an interrupt controller.
+- msi-controller: Identifies the node as an PCI Message Signaled
+  Interrupt controller.
+- #interrupt-cells: The number of cells to define the interrupts. Should be 1.
+  The cell is the IRQ number
+
+- reg: Should contain PMIC registers location and length. First pair
+  for the main interrupt registers, second pair for the per-CPU
+  interrupt registers. For this last pair, to be compliant with SMP
+  support, the "virtual" must be use (For the record, these registers
+  automatically map to the interrupt controller registers of the
+  current CPU)
+
+Optional properties:
+
+- interrupts: If defined, then it indicates that this MPIC is
+  connected as a slave to another interrupt controller. This is
+  typically the case on Armada 375 and Armada 38x, where the MPIC is
+  connected as a slave to the Cortex-A9 GIC. The provided interrupt
+  indicate to which GIC interrupt the MPIC output is connected.
+
+Example:
+
+        mpic: interrupt-controller@d0020000 {
+              compatible = "marvell,mpic";
+              #interrupt-cells = <1>;
+              #address-cells = <1>;
+              #size-cells = <1>;
+              interrupt-controller;
+              msi-controller;
+              reg = <0xd0020a00 0x1d0>,
+                    <0xd0021070 0x58>;
+        };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
