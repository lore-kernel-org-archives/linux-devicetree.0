From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: riscv: Fix CPU schema errors
Date: Wed, 25 Sep 2019 08:12:52 -0500
Message-ID: <20190925131252.19359-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix the errors in the RiscV CPU DT schema:

Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@1: 'timebase-frequency' is a required property
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible:0: 'riscv' is not one of ['sifive,rocket0', 'sifive,e5', 'sifive,e51', 'sifive,u54-mc', 'sifive,u54', 'sifive,u5']
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible: ['riscv'] is too short
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property

Fixes: 4fd669a8c487 ("dt-bindings: riscv: convert cpu binding to json-schema")
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add timebase-frequency to simulator example.

 .../devicetree/bindings/riscv/cpus.yaml       | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index b261a3015f84..eb0ef19829b6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -24,15 +24,17 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sifive,rocket0
-          - sifive,e5
-          - sifive,e51
-          - sifive,u54-mc
-          - sifive,u54
-          - sifive,u5
-      - const: riscv
+    oneOf:
+      - items:
+          - enum:
+              - sifive,rocket0
+              - sifive,e5
+              - sifive,e51
+              - sifive,u54-mc
+              - sifive,u54
+              - sifive,u5
+          - const: riscv
+      - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
       and identifies the type of the hart.
@@ -67,8 +69,6 @@ properties:
       lowercase to simplify parsing.
 
   timebase-frequency:
-    type: integer
-    minimum: 1
     description:
       Specifies the clock frequency of the system timer in Hz.
       This value is common to all harts on a single system image.
@@ -102,9 +102,9 @@ examples:
     cpus {
         #address-cells = <1>;
         #size-cells = <0>;
-        timebase-frequency = <1000000>;
         cpu@0 {
                 clock-frequency = <0>;
+                timebase-frequency = <1000000>;
                 compatible = "sifive,rocket0", "riscv";
                 device_type = "cpu";
                 i-cache-block-size = <64>;
@@ -120,6 +120,7 @@ examples:
         };
         cpu@1 {
                 clock-frequency = <0>;
+                timebase-frequency = <1000000>;
                 compatible = "sifive,rocket0", "riscv";
                 d-cache-block-size = <64>;
                 d-cache-sets = <64>;
@@ -153,6 +154,7 @@ examples:
                 device_type = "cpu";
                 reg = <0>;
                 compatible = "riscv";
+                timebase-frequency = <1000000>;
                 riscv,isa = "rv64imafdc";
                 mmu-type = "riscv,sv48";
                 interrupt-controller {
-- 
2.20.1
