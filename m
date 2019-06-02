From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 3/5] dt-bindings: riscv: convert cpu binding to json-schema
Date: Sun,  2 Jun 2019 01:04:58 -0700
Message-ID: <20190602080500.31700-4-paul.walmsley@sifive.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190602080500.31700-1-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Paul Walmsley <paul@pwsan.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

At Rob's request, we're starting to migrate our DT binding
documentation to json-schema YAML format.  Start by converting our cpu
binding documentation.  While doing so, document more properties and
nodes.  This includes adding binding documentation support for the E51
and U54 CPU cores ("harts") that are present on this SoC.  These cores
are described in:

    https://static.dev.sifive.com/FU540-C000-v1.0.pdf

This cpus.yaml file is intended to be a starting point and to
evolve over time.  It passes dt-doc-validate as of the yaml-bindings
commit 4c79d42e9216.

This patch was originally based on the ARM json-schema binding
documentation as added by commit 672951cbd1b7 ("dt-bindings: arm: Convert
cpu binding to json-schema").

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
---
 .../devicetree/bindings/riscv/cpus.yaml       | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/cpus.yaml

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
new file mode 100644
index 000000000000..6e8d55d9d4e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/cpus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V bindings for 'cpus' DT nodes
+
+maintainers:
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Palmer Dabbelt <palmer@sifive.com>
+
+allOf:
+  - $ref: /schemas/cpus.yaml#
+
+properties:
+  $nodename:
+    const: cpus
+    description: Container of cpu nodes
+
+  '#address-cells':
+    const: 1
+    description: |
+      A single unsigned 32-bit integer uniquely identifies each RISC-V
+      hart in a system.  (See the "reg" node under the "cpu" node,
+      below).
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^cpu@[0-9a-f]+$':
+    properties:
+      compatible:
+        type: array
+        items:
+          - enum:
+              - sifive,rocket0
+              - sifive,e5
+              - sifive,e51
+              - sifive,u54-mc
+              - sifive,u54
+              - sifive,u5
+          - const: riscv
+        description:
+          Identifies that the hart uses the RISC-V instruction set
+          and identifies the type of the hart.
+
+      mmu-type:
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/string"
+          - enum:
+              - riscv,sv32
+              - riscv,sv39
+              - riscv,sv48
+        description:
+          Identifies the MMU address translation mode used on this
+          hart.  These values originate from the RISC-V Privileged
+          Specification document, available from
+          https://riscv.org/specifications/
+
+      riscv,isa:
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/string"
+          - enum:
+              - rv64imac
+              - rv64imafdc
+        description:
+          Identifies the specific RISC-V instruction set architecture
+          supported by the hart.  These are documented in the RISC-V
+          User-Level ISA document, available from
+          https://riscv.org/specifications/
+
+      timebase-frequency:
+        type: integer
+        minimum: 1
+        description:
+          Specifies the clock frequency of the system timer in Hz.
+          This value is common to all harts on a single system image.
+
+      interrupt-controller:
+        type: object
+        description: Describes the CPU's local interrupt controller
+
+        properties:
+          '#interrupt-cells':
+            const: 1
+
+          compatible:
+            const: riscv,cpu-intc
+
+          interrupt-controller: true
+
+        required:
+          - '#interrupt-cells'
+          - compatible
+          - interrupt-controller
+
+    required:
+      - riscv,isa
+      - timebase-frequency
+      - interrupt-controller
+
+examples:
+  - |
+    // Example 1: SiFive Freedom U540G Development Kit
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        cpu@0 {
+                clock-frequency = <0>;
+                compatible = "sifive,rocket0", "riscv";
+                device_type = "cpu";
+                i-cache-block-size = <64>;
+                i-cache-sets = <128>;
+                i-cache-size = <16384>;
+                reg = <0>;
+                riscv,isa = "rv64imac";
+                cpu_intc0: interrupt-controller {
+                        #interrupt-cells = <1>;
+                        compatible = "riscv,cpu-intc";
+                        interrupt-controller;
+                };
+        };
+        cpu@1 {
+                clock-frequency = <0>;
+                compatible = "sifive,rocket0", "riscv";
+                d-cache-block-size = <64>;
+                d-cache-sets = <64>;
+                d-cache-size = <32768>;
+                d-tlb-sets = <1>;
+                d-tlb-size = <32>;
+                device_type = "cpu";
+                i-cache-block-size = <64>;
+                i-cache-sets = <64>;
+                i-cache-size = <32768>;
+                i-tlb-sets = <1>;
+                i-tlb-size = <32>;
+                mmu-type = "riscv,sv39";
+                reg = <1>;
+                riscv,isa = "rv64imafdc";
+                tlb-split;
+                cpu_intc1: interrupt-controller {
+                        #interrupt-cells = <1>;
+                        compatible = "riscv,cpu-intc";
+                        interrupt-controller;
+                };
+        };
+    };
+
+  - |
+    // Example 2: Spike ISA Simulator with 1 Hart
+    cpus {
+            cpu@0 {
+                    device_type = "cpu";
+                    reg = <0>;
+                    compatible = "riscv";
+                    riscv,isa = "rv64imafdc";
+                    mmu-type = "riscv,sv48";
+                    interrupt-controller {
+                            #interrupt-cells = <1>;
+                            interrupt-controller;
+                            compatible = "riscv,cpu-intc";
+                    };
+            };
+    };
+...
-- 
2.20.1
