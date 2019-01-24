From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v3 lora-next 4/4] dt-bindings: lora: sx130x: add clock bindings
Date: Thu, 24 Jan 2019 14:53:09 +0000
Message-ID: <20190124145309.21698-5-ben.whitten@lairdtech.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-1-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Whitten <ben.whitten@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Ben Whitten <ben.whitten@gmail.com>

The SX130x family consumes two clocks, a 32 MHz clock provided by a
connected IQ transceiver, and a 133 MHz high speed clock.
It also provides a 32 MHz clock out to the radio in the TX path.

In the example we connect the concentrator to a fixed clock providing
the 133 MHz high speed clock, and we connect to a connected transceiver
32 MHz clock.

A radio in the TX path is also connected to the 32 MHz clock out from the
concentrator.

The connected radios are both fed from a fixed 32 MHz clock, with only
one being the clock source back to the SX130x concentrator.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
v2 -> v3:
* Name input clocks specifically
* Add output clock for radio in TX path
v1 -> v2:
* Fixed incorrect usage of clock cells
* Fixed wording in commit and descriptions
---
 .../bindings/net/lora/semtech,sx130x.yaml     | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
index 24fad1218735..5d32668d6ca9 100644
--- a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
@@ -15,7 +15,9 @@ description: |
   demodulating LoRa signals on 8 channels simultaneously.
 
   It is typically paired with two SX125x IQ radios controlled over an
-  SPI directly from the concentrator.
+  SPI directly from the concentrator. One of the radios will provide
+  a 32 MHz clock back into the concentrator.
+  The concentrator also outputs a 32 MHz clock to the radio(s) in the TX chain.
 
   The concentrator itself is controlled over SPI.
 
@@ -37,6 +39,30 @@ properties:
     maxItems: 1
     description: A connection of the reset gpio line.
 
+  clocks:
+    maxItems: 2
+    items:
+      - description: 32 MHz clock provider (CLK32M)
+      - description: 133 MHz high speed clock provider (CLKHS)
+    description: The chip requires two clock inputs; A 32MHz clock at CMOS
+      level which is provided from a connected radio.
+      And a 133MHz high speed clock at CMOS level provided by an oscillator.
+
+  clock-names:
+    items:
+      - const: clk32m
+      - const: clkhs
+    description: Input clock (CLK32M) name from provider, Input clock (CLKHS)
+      name from provider.
+
+  clock-output-names:
+    items:
+      - const: sp_clk_out
+    description: Output clock (SP_CLK_OUT) typically connected to the TX radio.
+
+  '#clock-cells':
+    const: 0
+
   radio-spi:
     type: object
     description: The concentrator can have two radios connected which are
@@ -73,6 +99,20 @@ examples:
 
     #include <dt-bindings/gpio/gpio.h>
 
+    tcxo: dummy32m {
+      compatible = "fixed-clock";
+      clock-frequency = <32000000>;
+      clock-output-names = "tcxo";
+      #clock-cells = <0>;
+    };
+
+    clkhs: dummy133m {
+      compatible = "fixed-clock";
+      clock-frequency = <133000000>;
+      clock-output-names = "clkhs";
+      #clock-cells = <0>;
+    };
+
     spi {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -82,6 +122,10 @@ examples:
         reg = <0>;
         reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
         spi-max-frequency = <8000000>;
+        clocks = <&radio1>, <&clkhs>;
+        clock-names = "clk32m", "clkhs";
+        clock-output-names = "sp_clk_out";
+        #clock-cells = <0>;
 
         radio-spi {
           #address-cells = <1>;
@@ -90,11 +134,17 @@ examples:
           radio0: radio@0 {
             compatible = "semtech,sx1257";
             reg = <0>;
+            clocks = <&tcxo>, <&concentrator0>;
+            clock-names = "fxosc", "fclk_in";
           };
 
           radio1: radio@1 {
             compatible = "semtech,sx1257";
             reg = <1>;
+            clocks = <&tcxo>;
+            clock-names = "fxosc";
+            clock-output-names = "fclk_out";
+            #clock-cells = <0>;
           };
         };
       };
-- 
2.17.1
