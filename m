From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: riscv: Limit cpus schema to only check RiscV 'cpu' nodes
Date: Wed, 26 Jun 2019 17:57:59 -0600
Message-ID: <20190626235759.3615-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Matching on the 'cpus' node was a bad choice because the schema is
incorrectly applied to non-RiscV cpus nodes. As we now have a common cpus
schema which checks the general structure, it is also redundant to do so
in the Risc-V CPU schema.

The downside is one could conceivably mix different architecture's cpu
nodes or have typos in the compatible string. The latter problem pretty
much exists for every schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/riscv/cpus.yaml       | 143 ++++++++----------
 1 file changed, 61 insertions(+), 82 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 27f02ec4bb45..67e54251eb90 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -10,97 +10,76 @@ maintainers:
   - Paul Walmsley <paul.walmsley@sifive.com>
   - Palmer Dabbelt <palmer@sifive.com>
 
-allOf:
-  - $ref: /schemas/cpus.yaml#
-
 properties:
-  $nodename:
-    const: cpus
-    description: Container of cpu nodes
-
-  '#address-cells':
-    const: 1
-    description: |
-      A single unsigned 32-bit integer uniquely identifies each RISC-V
-      hart in a system.  (See the "reg" node under the "cpu" node,
-      below).
-
-  '#size-cells':
-    const: 0
+  compatible:
+    items:
+      - enum:
+          - sifive,rocket0
+          - sifive,e5
+          - sifive,e51
+          - sifive,u54-mc
+          - sifive,u54
+          - sifive,u5
+      - const: riscv
+    description:
+      Identifies that the hart uses the RISC-V instruction set
+      and identifies the type of the hart.
+
+  mmu-type:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/string"
+      - enum:
+          - riscv,sv32
+          - riscv,sv39
+          - riscv,sv48
+    description:
+      Identifies the MMU address translation mode used on this
+      hart.  These values originate from the RISC-V Privileged
+      Specification document, available from
+      https://riscv.org/specifications/
+
+  riscv,isa:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/string"
+      - enum:
+          - rv64imac
+          - rv64imafdc
+    description:
+      Identifies the specific RISC-V instruction set architecture
+      supported by the hart.  These are documented in the RISC-V
+      User-Level ISA document, available from
+      https://riscv.org/specifications/
+
+  timebase-frequency:
+    type: integer
+    minimum: 1
+    description:
+      Specifies the clock frequency of the system timer in Hz.
+      This value is common to all harts on a single system image.
+
+  interrupt-controller:
+    type: object
+    description: Describes the CPU's local interrupt controller
 
-patternProperties:
-  '^cpu@[0-9a-f]+$':
     properties:
-      compatible:
-        type: array
-        items:
-          - enum:
-              - sifive,rocket0
-              - sifive,e5
-              - sifive,e51
-              - sifive,u54-mc
-              - sifive,u54
-              - sifive,u5
-          - const: riscv
-        description:
-          Identifies that the hart uses the RISC-V instruction set
-          and identifies the type of the hart.
-
-      mmu-type:
-        allOf:
-          - $ref: "/schemas/types.yaml#/definitions/string"
-          - enum:
-              - riscv,sv32
-              - riscv,sv39
-              - riscv,sv48
-        description:
-          Identifies the MMU address translation mode used on this
-          hart.  These values originate from the RISC-V Privileged
-          Specification document, available from
-          https://riscv.org/specifications/
-
-      riscv,isa:
-        allOf:
-          - $ref: "/schemas/types.yaml#/definitions/string"
-          - enum:
-              - rv64imac
-              - rv64imafdc
-        description:
-          Identifies the specific RISC-V instruction set architecture
-          supported by the hart.  These are documented in the RISC-V
-          User-Level ISA document, available from
-          https://riscv.org/specifications/
+      '#interrupt-cells':
+        const: 1
 
-      timebase-frequency:
-        type: integer
-        minimum: 1
-        description:
-          Specifies the clock frequency of the system timer in Hz.
-          This value is common to all harts on a single system image.
-
-      interrupt-controller:
-        type: object
-        description: Describes the CPU's local interrupt controller
-
-        properties:
-          '#interrupt-cells':
-            const: 1
-
-          compatible:
-            const: riscv,cpu-intc
-
-          interrupt-controller: true
+      compatible:
+        const: riscv,cpu-intc
 
-        required:
-          - '#interrupt-cells'
-          - compatible
-          - interrupt-controller
+      interrupt-controller: true
 
     required:
-      - riscv,isa
-      - timebase-frequency
+      - '#interrupt-cells'
+      - compatible
       - interrupt-controller
 
+required:
+  - riscv,isa
+  - timebase-frequency
+  - interrupt-controller
+
 examples:
   - |
     // Example 1: SiFive Freedom U540G Development Kit
-- 
2.20.1
