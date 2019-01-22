From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v2 lora-next 3/4] dt-bindings: lora: sx125x: add clock bindings
Date: Tue, 22 Jan 2019 18:07:28 +0000
Message-ID: <20190122180729.1834-4-ben.whitten@lairdtech.com>
References: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-lpwan@lists.infradead.org, robh@kernel.org, Ben Whitten <ben.whitten@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Ben Whitten <ben.whitten@gmail.com>

The SX125x consumes a clock (FXOSC) ranging from 32 to 36 MHz.
If the radio is coupled with an SX130x the radio is therefor operating in
master mode and it may also provide a gated version of this clock for the
concentrator. In this case the concentrator is expecting a 32 MHz input
clock.

In the example we connect to the "txco" clock source, represented by a
fixed clock. The radio also provides a clock output named "clk32m" for
consumption by the SX130x concentrator.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
v1 -> v2:
* Fixed incorrect usage of clock cells
* Fixed wording in commit and descriptions
* Dropped enforced clock names
---
 .../bindings/net/lora/semtech,sx125x.yaml     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
index 4a51a251d97f..8287472fd545 100644
--- a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
@@ -27,12 +27,36 @@ properties:
     description: The chip select on the SPI bus or radio number in concentrator
       , with radio A = 0 and radio B = 1.
 
+  clocks:
+    maxItems: 1
+    description: Input clock (FXOSC) provider with output ranging from 32 MHz
+      to 36 MHz.
+
+  clock-names:
+    maxItems: 1
+    description: Input clock (FXOSC) name from provider.
+
+  clock-output-names:
+    maxItems: 1
+    description: Output clock (CLK_OUT) name, clock is gated version of the
+      input (FXOSC). Used in master mode operation.
+
+  '#clock-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
 examples:
   - |
+    tcxo: dummy32m {
+      compatible = "fixed-clock";
+      clock-frequency = <32000000>;
+      clock-output-names = "tcxo";
+      #clock-cells = <0>;
+    };
+
     spi {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -40,5 +64,9 @@ examples:
       radio0: lora@0 {
         compatible = "semtech,sx1257";
         reg = <0>;
+        clocks = <&tcxo>;
+        clock-names = "tcxo";
+        clock-output-names = "clk32m";
+        #clock-cells = <0>;
       };
     };
-- 
2.17.1
