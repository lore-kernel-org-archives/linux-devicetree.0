From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: iommu: Convert Arm SMMUv3 to DT schema
Date: Mon, 14 Oct 2019 14:12:56 -0500
Message-ID: <20191014191256.12697-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>, iommu@lists.linux-foundation.org
List-Id: devicetree@vger.kernel.org

Convert the Arm SMMv3 binding to the DT schema format.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <Robin.Murphy@arm.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- Refine interrupt definition based on Robin's comments

 .../devicetree/bindings/iommu/arm,smmu-v3.txt |  77 --------------
 .../bindings/iommu/arm,smmu-v3.yaml           | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt
deleted file mode 100644
index c9abbf3e4f68..000000000000
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-* ARM SMMUv3 Architecture Implementation
-
-The SMMUv3 architecture is a significant departure from previous
-revisions, replacing the MMIO register interface with in-memory command
-and event queues and adding support for the ATS and PRI components of
-the PCIe specification.
-
-** SMMUv3 required properties:
-
-- compatible        : Should include:
-
-                      * "arm,smmu-v3" for any SMMUv3 compliant
-                        implementation. This entry should be last in the
-                        compatible list.
-
-- reg               : Base address and size of the SMMU.
-
-- interrupts        : Non-secure interrupt list describing the wired
-                      interrupt sources corresponding to entries in
-                      interrupt-names. If no wired interrupts are
-                      present then this property may be omitted.
-
-- interrupt-names   : When the interrupts property is present, should
-                      include the following:
-                      * "eventq"    - Event Queue not empty
-                      * "priq"      - PRI Queue not empty
-                      * "cmdq-sync" - CMD_SYNC complete
-                      * "gerror"    - Global Error activated
-                      * "combined"  - The combined interrupt is optional,
-				      and should only be provided if the
-				      hardware supports just a single,
-				      combined interrupt line.
-				      If provided, then the combined interrupt
-				      will be used in preference to any others.
-
-- #iommu-cells      : See the generic IOMMU binding described in
-                        devicetree/bindings/pci/pci-iommu.txt
-                      for details. For SMMUv3, must be 1, with each cell
-                      describing a single stream ID. All possible stream
-                      IDs which a device may emit must be described.
-
-** SMMUv3 optional properties:
-
-- dma-coherent      : Present if DMA operations made by the SMMU (page
-                      table walks, stream table accesses etc) are cache
-                      coherent with the CPU.
-
-                      NOTE: this only applies to the SMMU itself, not
-                      masters connected upstream of the SMMU.
-
-- msi-parent        : See the generic MSI binding described in
-                        devicetree/bindings/interrupt-controller/msi.txt
-                      for a description of the msi-parent property.
-
-- hisilicon,broken-prefetch-cmd
-                    : Avoid sending CMD_PREFETCH_* commands to the SMMU.
-
-- cavium,cn9900-broken-page1-regspace
-                    : Replaces all page 1 offsets used for EVTQ_PROD/CONS,
-		      PRIQ_PROD/CONS register access with page 0 offsets.
-		      Set for Cavium ThunderX2 silicon that doesn't support
-		      SMMU page1 register space.
-
-** Example
-
-        smmu@2b400000 {
-                compatible = "arm,smmu-v3";
-                reg = <0x0 0x2b400000 0x0 0x20000>;
-                interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
-                             <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
-                             <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
-                             <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
-                interrupt-names = "eventq", "priq", "cmdq-sync", "gerror";
-                dma-coherent;
-                #iommu-cells = <1>;
-                msi-parent = <&its 0xff0000>;
-        };
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
new file mode 100644
index 000000000000..662cbc4592c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM SMMUv3 Architecture Implementation
+
+maintainers:
+  - Will Deacon <will@kernel.org>
+  - Robin Murphy <Robin.Murphy@arm.com>
+
+description: |+
+  The SMMUv3 architecture is a significant departure from previous
+  revisions, replacing the MMIO register interface with in-memory command
+  and event queues and adding support for the ATS and PRI components of
+  the PCIe specification.
+
+properties:
+  $nodename:
+    pattern: "^iommu@[0-9a-f]*"
+  compatible:
+    const: arm,smmu-v3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-names:
+    oneOf:
+      - const: combined
+        description:
+          The combined interrupt is optional, and should only be provided if the
+          hardware supports just a single, combined interrupt line.
+          If provided, then the combined interrupt will be used in preference to
+          any others.
+      - items:
+          - const: eventq     # Event Queue not empt
+          - const: priq       # PRI Queue not empty
+          - const: cmdq-sync  # CMD_SYNC complete
+          - const: gerror     # Global Error activated
+      - minItems: 2
+        maxItems: 4
+        items:
+          - const: eventq
+          - const: gerror
+          - const: priq
+          - const: cmdq-sync
+
+  '#iommu-cells':
+    const: 1
+
+  dma-coherent:
+    description: |
+      Present if page table walks made by the SMMU are cache coherent with the
+      CPU.
+
+      NOTE: this only applies to the SMMU itself, not masters connected
+      upstream of the SMMU.
+
+  msi-parent: true
+
+  hisilicon,broken-prefetch-cmd:
+    type: boolean
+    description: Avoid sending CMD_PREFETCH_* commands to the SMMU.
+
+  cavium,cn9900-broken-page1-regspace:
+    type: boolean
+    description:
+      Replaces all page 1 offsets used for EVTQ_PROD/CONS, PRIQ_PROD/CONS
+      register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
+      doesn't support SMMU page1 register space.
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    iommu@2b400000 {
+            compatible = "arm,smmu-v3";
+            reg = <0x2b400000 0x20000>;
+            interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "eventq", "priq", "cmdq-sync", "gerror";
+            dma-coherent;
+            #iommu-cells = <1>;
+            msi-parent = <&its 0xff0000>;
+    };
-- 
2.20.1
