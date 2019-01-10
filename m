From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: l2x0: Convert L2 cache to json-schema
Date: Thu, 10 Jan 2019 16:18:58 -0600
Message-ID: <20190110221903.3990-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert the ARM L2 cache controller binding to json-schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/l2c2x0.txt        | 114 --------
 .../devicetree/bindings/arm/l2c2x0.yaml       | 248 ++++++++++++++++++
 2 files changed, 248 insertions(+), 114 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/l2c2x0.txt
 create mode 100644 Documentation/devicetree/bindings/arm/l2c2x0.yaml

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documentation/devicetree/bindings/arm/l2c2x0.txt
deleted file mode 100644
index fbe6cb21f4cf..000000000000
--- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
+++ /dev/null
@@ -1,114 +0,0 @@
-* ARM L2 Cache Controller
-
-ARM cores often have a separate L2C210/L2C220/L2C310 (also known as PL210/PL220/
-PL310 and variants) based level 2 cache controller. All these various implementations
-of the L2 cache controller have compatible programming models (Note 1).
-Some of the properties that are just prefixed "cache-*" are taken from section
-3.7.3 of the Devicetree Specification which can be found at:
-https://www.devicetree.org/specifications/
-
-The ARM L2 cache representation in the device tree should be done as follows:
-
-Required properties:
-
-- compatible : should be one of:
-  "arm,pl310-cache"
-  "arm,l220-cache"
-  "arm,l210-cache"
-  "bcm,bcm11351-a2-pl310-cache": DEPRECATED by "brcm,bcm11351-a2-pl310-cache"
-  "brcm,bcm11351-a2-pl310-cache": For Broadcom bcm11351 chipset where an
-     offset needs to be added to the address before passing down to the L2
-     cache controller
-  "marvell,aurora-system-cache": Marvell Controller designed to be
-     compatible with the ARM one, with system cache mode (meaning
-     maintenance operations on L1 are broadcasted to the L2 and L2
-     performs the same operation).
-  "marvell,aurora-outer-cache": Marvell Controller designed to be
-     compatible with the ARM one with outer cache mode.
-  "marvell,tauros3-cache": Marvell Tauros3 cache controller, compatible
-     with arm,pl310-cache controller.
-- cache-unified : Specifies the cache is a unified cache.
-- cache-level : Should be set to 2 for a level 2 cache.
-- reg : Physical base address and size of cache controller's memory mapped
-  registers.
-
-Optional properties:
-
-- arm,data-latency : Cycles of latency for Data RAM accesses. Specifies 3 cells of
-  read, write and setup latencies. Minimum valid values are 1. Controllers
-  without setup latency control should use a value of 0.
-- arm,tag-latency : Cycles of latency for Tag RAM accesses. Specifies 3 cells of
-  read, write and setup latencies. Controllers without setup latency control
-  should use 0. Controllers without separate read and write Tag RAM latency
-  values should only use the first cell.
-- arm,dirty-latency : Cycles of latency for Dirty RAMs. This is a single cell.
-- arm,filter-ranges : <start length> Starting address and length of window to
-  filter. Addresses in the filter window are directed to the M1 port. Other
-  addresses will go to the M0 port.
-- arm,io-coherent : indicates that the system is operating in an hardware
-  I/O coherent mode. Valid only when the arm,pl310-cache compatible
-  string is used.
-- interrupts : 1 combined interrupt.
-- cache-size : specifies the size in bytes of the cache
-- cache-sets : specifies the number of associativity sets of the cache
-- cache-block-size : specifies the size in bytes of a cache block
-- cache-line-size : specifies the size in bytes of a line in the cache,
-  if this is not specified, the line size is assumed to be equal to the
-  cache block size
-- cache-id-part: cache id part number to be used if it is not present
-  on hardware
-- wt-override: If present then L2 is forced to Write through mode
-- arm,double-linefill : Override double linefill enable setting. Enable if
-  non-zero, disable if zero.
-- arm,double-linefill-incr : Override double linefill on INCR read. Enable
-  if non-zero, disable if zero.
-- arm,double-linefill-wrap : Override double linefill on WRAP read. Enable
-  if non-zero, disable if zero.
-- arm,prefetch-drop : Override prefetch drop enable setting. Enable if non-zero,
-  disable if zero.
-- arm,prefetch-offset : Override prefetch offset value. Valid values are
-  0-7, 15, 23, and 31.
-- arm,shared-override : The default behavior of the L220 or PL310 cache
-  controllers with respect to the shareable attribute is to transform "normal
-  memory non-cacheable transactions" into "cacheable no allocate" (for reads)
-  or "write through no write allocate" (for writes).
-  On systems where this may cause DMA buffer corruption, this property must be
-  specified to indicate that such transforms are precluded.
-- arm,parity-enable : enable parity checking on the L2 cache (L220 or PL310).
-- arm,parity-disable : disable parity checking on the L2 cache (L220 or PL310).
-- arm,outer-sync-disable : disable the outer sync operation on the L2 cache.
-  Some core tiles, especially ARM PB11MPCore have a faulty L220 cache that
-  will randomly hang unless outer sync operations are disabled.
-- prefetch-data : Data prefetch. Value: <0> (forcibly disable), <1>
-  (forcibly enable), property absent (retain settings set by firmware)
-- prefetch-instr : Instruction prefetch. Value: <0> (forcibly disable),
-  <1> (forcibly enable), property absent (retain settings set by
-  firmware)
-- arm,dynamic-clock-gating : L2 dynamic clock gating. Value: <0> (forcibly
-  disable), <1> (forcibly enable), property absent (OS specific behavior,
-  preferably retain firmware settings)
-- arm,standby-mode: L2 standby mode enable. Value <0> (forcibly disable),
-  <1> (forcibly enable), property absent (OS specific behavior,
-  preferably retain firmware settings)
-- arm,early-bresp-disable : Disable the CA9 optimization Early BRESP (PL310)
-- arm,full-line-zero-disable : Disable the CA9 optimization Full line of zero
-  write (PL310)
-
-Example:
-
-L2: cache-controller {
-        compatible = "arm,pl310-cache";
-        reg = <0xfff12000 0x1000>;
-        arm,data-latency = <1 1 1>;
-        arm,tag-latency = <2 2 2>;
-        arm,filter-ranges = <0x80000000 0x8000000>;
-        cache-unified;
-        cache-level = <2>;
-	interrupts = <45>;
-};
-
-Note 1: The description in this document doesn't apply to integrated L2
-	cache controllers as found in e.g. Cortex-A15/A7/A57/A53. These
-	integrated L2 controllers are assumed to be all preconfigured by
-	early secure boot code. Thus no need to deal with their configuration
-	in the kernel at all.
diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.yaml b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
new file mode 100644
index 000000000000..bfc5c185561c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
@@ -0,0 +1,248 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/l2c2x0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM L2 Cache Controller
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |+
+  ARM cores often have a separate L2C210/L2C220/L2C310 (also known as PL210/
+  PL220/PL310 and variants) based level 2 cache controller. All these various
+  implementations of the L2 cache controller have compatible programming
+  models (Note 1). Some of the properties that are just prefixed "cache-*" are
+  taken from section 3.7.3 of the Devicetree Specification which can be found
+  at:
+  https://www.devicetree.org/specifications/
+
+  Note 1: The description in this document doesn't apply to integrated L2
+    cache controllers as found in e.g. Cortex-A15/A7/A57/A53. These
+    integrated L2 controllers are assumed to be all preconfigured by
+    early secure boot code. Thus no need to deal with their configuration
+    in the kernel at all.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - arm,pl310-cache
+      - arm,l220-cache
+      - arm,l210-cache
+        # DEPRECATED by "brcm,bcm11351-a2-pl310-cache"
+      - bcm,bcm11351-a2-pl310-cache
+        # For Broadcom bcm11351 chipset where an
+        # offset needs to be added to the address before passing down to the L2
+        # cache controller
+      - brcm,bcm11351-a2-pl310-cache
+        # Marvell Controller designed to be
+        # compatible with the ARM one, with system cache mode (meaning
+        # maintenance operations on L1 are broadcasted to the L2 and L2
+        # performs the same operation).
+      - marvell,aurora-system-cache
+        # Marvell Controller designed to be
+        # compatible with the ARM one with outer cache mode.
+      - marvell,aurora-outer-cache
+        # Marvell Tauros3 cache controller, compatible
+        # with arm,pl310-cache controller.
+      - marvell,tauros3-cache
+
+  cache-level:
+    const: 2
+
+  cache-unified: true
+  cache-size: true
+  cache-sets: true
+  cache-block-size: true
+  cache-line-size: true
+
+  reg:
+    maxItems: 1
+
+  arm,data-latency:
+    description: Cycles of latency for Data RAM accesses. Specifies 3 cells of
+      read, write and setup latencies. Minimum valid values are 1. Controllers
+      without setup latency control should use a value of 0.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 2
+        maxItems: 3
+        items:
+          minimum: 0
+          maximum: 8
+
+  arm,tag-latency:
+    description: Cycles of latency for Tag RAM accesses. Specifies 3 cells of
+      read, write and setup latencies. Controllers without setup latency control
+      should use 0. Controllers without separate read and write Tag RAM latency
+      values should only use the first cell.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 1
+        maxItems: 3
+        items:
+          minimum: 0
+          maximum: 8
+
+  arm,dirty-latency:
+    description: Cycles of latency for Dirty RAMs. This is a single cell.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1
+        maximum: 8
+
+  arm,filter-ranges:
+    description: <start length> Starting address and length of window to
+      filter. Addresses in the filter window are directed to the M1 port. Other
+      addresses will go to the M0 port.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - items:
+          minItems: 2
+          maxItems: 2
+
+  arm,io-coherent:
+    description: indicates that the system is operating in an hardware
+      I/O coherent mode. Valid only when the arm,pl310-cache compatible
+      string is used.
+    type: boolean
+
+  interrupts:
+    # Either a single combined interrupt or up to 9 individual interrupts
+    minItems: 1
+    maxItems: 9
+
+  cache-id-part:
+    description: cache id part number to be used if it is not present
+      on hardware
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  wt-override:
+    description: If present then L2 is forced to Write through mode
+    type: boolean
+
+  arm,double-linefill:
+    description: Override double linefill enable setting. Enable if
+      non-zero, disable if zero.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  arm,double-linefill-incr:
+    description: Override double linefill on INCR read. Enable
+      if non-zero, disable if zero.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  arm,double-linefill-wrap:
+    description: Override double linefill on WRAP read. Enable
+      if non-zero, disable if zero.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  arm,prefetch-drop:
+    description: Override prefetch drop enable setting. Enable if non-zero,
+      disable if zero.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  arm,prefetch-offset:
+    description: Override prefetch offset value.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1, 2, 3, 4, 5, 6, 7, 15, 23, 31 ]
+
+  arm,shared-override:
+    description: The default behavior of the L220 or PL310 cache
+      controllers with respect to the shareable attribute is to transform "normal
+      memory non-cacheable transactions" into "cacheable no allocate" (for reads)
+      or "write through no write allocate" (for writes).
+      On systems where this may cause DMA buffer corruption, this property must
+      be specified to indicate that such transforms are precluded.
+    type: boolean
+
+  arm,parity-enable:
+    description: enable parity checking on the L2 cache (L220 or PL310).
+    type: boolean
+
+  arm,parity-disable:
+    description: disable parity checking on the L2 cache (L220 or PL310).
+    type: boolean
+
+  arm,outer-sync-disable:
+    description: disable the outer sync operation on the L2 cache.
+      Some core tiles, especially ARM PB11MPCore have a faulty L220 cache that
+      will randomly hang unless outer sync operations are disabled.
+    type: boolean
+
+  prefetch-data:
+    description: |
+      Data prefetch. Value: <0> (forcibly disable), <1>
+      (forcibly enable), property absent (retain settings set by firmware)
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  prefetch-instr:
+    description: |
+      Instruction prefetch. Value: <0> (forcibly disable),
+      <1> (forcibly enable), property absent (retain settings set by
+      firmware)
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  arm,dynamic-clock-gating:
+    description: |
+      L2 dynamic clock gating. Value: <0> (forcibly
+      disable), <1> (forcibly enable), property absent (OS specific behavior,
+      preferably retain firmware settings)
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  arm,standby-mode:
+    description: L2 standby mode enable. Value <0> (forcibly disable),
+      <1> (forcibly enable), property absent (OS specific behavior,
+      preferably retain firmware settings)
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+  arm,early-bresp-disable:
+    description: Disable the CA9 optimization Early BRESP (PL310)
+    type: boolean
+
+  arm,full-line-zero-disable:
+    description: Disable the CA9 optimization Full line of zero
+      write (PL310)
+    type: boolean
+
+required:
+  - compatible
+  - cache-unified
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    cache-controller@fff12000 {
+        compatible = "arm,pl310-cache";
+        reg = <0xfff12000 0x1000>;
+        arm,data-latency = <1 1 1>;
+        arm,tag-latency = <2 2 2>;
+        arm,filter-ranges = <0x80000000 0x8000000>;
+        cache-unified;
+        cache-level = <2>;
+        interrupts = <45>;
+    };
+
+...
-- 
2.19.1
