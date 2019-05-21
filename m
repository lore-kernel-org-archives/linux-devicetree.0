From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: interrupt-controller: arm,gic: Fix schema errors in example
Date: Tue, 21 May 2019 16:28:54 -0500
Message-ID: <20190521212854.24902-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Validating the examples against the schema have a few errors:

arm,gic.example.dt.yaml: 'ranges' does not match any of the regexes: '^v2m@[0-9a-f]+$', 'pinctrl-[0-9]+'
arm,gic.example.dt.yaml: #address-cells:0:0: 2 is not one of [0, 1]
arm,gic.example.dt.yaml: #size-cells:0:0: 1 was expected

'ranges' is valid, but missing from the schema, so add it. The reg
addresses and sizes don't match the schema requirements and the example
template. We could just override the example template to use 64-bit
addresses, but there's not really any value showing that in the example.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../interrupt-controller/arm,gic.yaml         | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 5011d9be2d57..3d2a58ac296b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -91,6 +91,8 @@ properties:
     minItems: 2
     maxItems: 4
 
+  ranges: true
+
   interrupts:
     description: Interrupt source of the parent interrupt controller on
       secondary GICs, or VGIC maintenance interrupt on primary GIC (see
@@ -196,28 +198,28 @@ examples:
     interrupt-controller@e1101000 {
       compatible = "arm,gic-400";
       #interrupt-cells = <3>;
-      #address-cells = <2>;
-      #size-cells = <2>;
+      #address-cells = <1>;
+      #size-cells = <1>;
       interrupt-controller;
       interrupts = <1 8 0xf04>;
-      ranges = <0 0 0 0xe1100000 0 0x100000>;
-      reg = <0x0 0xe1110000 0 0x01000>,
-            <0x0 0xe112f000 0 0x02000>,
-            <0x0 0xe1140000 0 0x10000>,
-            <0x0 0xe1160000 0 0x10000>;
+      ranges = <0 0xe1100000 0x100000>;
+      reg = <0xe1110000 0x01000>,
+            <0xe112f000 0x02000>,
+            <0xe1140000 0x10000>,
+            <0xe1160000 0x10000>;
 
-      v2m0: v2m@8000 {
+      v2m0: v2m@80000 {
         compatible = "arm,gic-v2m-frame";
         msi-controller;
-        reg = <0x0 0x80000 0 0x1000>;
+        reg = <0x80000 0x1000>;
       };
 
       //...
 
-      v2mN: v2m@9000 {
+      v2mN: v2m@90000 {
         compatible = "arm,gic-v2m-frame";
         msi-controller;
-        reg = <0x0 0x90000 0 0x1000>;
+        reg = <0x90000 0x1000>;
       };
     };
 ...
-- 
2.20.1
