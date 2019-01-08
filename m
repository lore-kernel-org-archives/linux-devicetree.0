From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH lora-next 3/4] dt-bindings: lora: sx125x: add clock bindings
Date: Tue,  8 Jan 2019 17:41:31 +0900
Message-ID: <20190108084132.10214-3-ben.whitten@gmail.com>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108084132.10214-1-ben.whitten@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-lpwan@lists.infradead.org, afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ben Whitten <ben.whitten@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

The sx125x consumes a 32MHz clock and if it is coupled with a sx130x
concentrator may also provide a gated version of this 32MHz for the
concentrator.

In the example we connect to output 0 of "txco" clock source. The radio
also provides a single clock output, hence "#clock-cells = <0>", named
"clk32m" for consumption by the sx130x concentrator.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
 .../{ => net}/lora/semtech,sx125x.yaml        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 rename Documentation/devicetree/bindings/{ => net}/lora/semtech,sx125x.yaml (67%)

diff --git a/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
similarity index 67%
rename from Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
rename to Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
index 5eadec860b70..c2fb4ac06341 100644
--- a/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
@@ -33,13 +33,40 @@ properties:
     description: The frequency of the SPI communication to the radio,
       in Hz. Maximum SPI frequency is 10MHz.
 
+  clocks:
+    maxItems: 1
+    description: 32MHz clock provider
+
+  clock-names:
+    items:
+      - const: txco
+
+  clock-output-names:
+    items:
+      - const: clk32m
+    description: 32MHz output clock name
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
     radio0: lora@0 {
       compatible = "semtech,sx1257";
       reg = <0>;
+      clocks = <&tcxo 0>;
+      clock-names = "tcxo";
+      clock-output-names = "clk32m";
+      #clock-cells = <0>;
     };
-- 
2.17.1
