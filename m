From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 5/5] DT: arm,gic-v3: Documment PPI partition support
Date: Mon, 11 Apr 2016 09:57:55 +0100
Message-ID: <1460365075-7316-6-git-send-email-marc.zyngier@arm.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460365075-7316-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a decription of the PPI partitioning support.

Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 .../bindings/interrupt-controller/arm,gic-v3.txt   | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
index 007a5b4..4c29cda 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
@@ -11,6 +11,8 @@ Main node required properties:
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
   interrupt source. Must be a single cell with a value of at least 3.
+  If the system requires describing PPI affinity, then the value must
+  be at least 4.
 
   The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
   interrupts. Other values are reserved for future use.
@@ -24,7 +26,14 @@ Main node required properties:
 		1 = edge triggered
 		4 = level triggered
 
-  Cells 4 and beyond are reserved for future use and must have a value
+  The 4th cell is a phandle to a node describing a set of CPUs this
+  interrupt is affine to. The interrupt must be a PPI, and the node
+  pointed must be a subnode of the "ppi-partitions" subnode. For
+  interrupt types other than PPI or PPIs that are not partitionned,
+  this cell must be zero. See the "ppi-partitions" node description
+  below.
+
+  Cells 5 and beyond are reserved for future use and must have a value
   of 0 if present.
 
 - reg : Specifies base physical address(s) and size of the GIC
@@ -50,6 +59,11 @@ Optional
 
 Sub-nodes:
 
+PPI affinity can be expressed as a single "ppi-partitions" node,
+containing a set of sub-nodes, each with the following property:
+- affinity: Should be a list of phandles to CPU nodes (as described in
+Documentation/devicetree/bindings/arm/cpus.txt).
+
 GICv3 has one or more Interrupt Translation Services (ITS) that are
 used to route Message Signalled Interrupts (MSI) to the CPUs.
 
@@ -91,7 +105,7 @@ Examples:
 
 	gic: interrupt-controller@2c010000 {
 		compatible = "arm,gic-v3";
-		#interrupt-cells = <3>;
+		#interrupt-cells = <4>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -119,4 +133,20 @@ Examples:
 			#msi-cells = <1>;
 			reg = <0x0 0x2c400000 0 0x200000>;
 		};
+
+		ppi-partitions {
+			part0: interrupt-partition-0 {
+				affinity = <&cpu0 &cpu2>;
+			};
+
+			part1: interrupt-partition-1 {
+				affinity = <&cpu1 &cpu3>;
+			};
+		};
+	};
+
+
+	device@0 {
+		reg = <0 0 0 4>;
+		interrupts = <1 1 4 &part0>;
 	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
