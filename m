From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v2 lora-next 4/4] dt-bindings: lora: sx130x: add clock bindings
Date: Tue, 22 Jan 2019 18:07:29 +0000
Message-ID: <20190122180729.1834-5-ben.whitten@lairdtech.com>
References: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Sender: netdev-owner@vger.kernel.org
To: afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-lpwan@lists.infradead.org, robh@kernel.org, Ben Whitten <ben.whitten@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Ben Whitten <ben.whitten@gmail.com>

The SX130x family consumes two clocks, a 32 MHz clock provided by a
connected IQ transceiver, and a 133 MHz high speed clock.

In the example we connect the concentrator to a fixed clock providing
the 133 MHz high speed clock, and we connect to a connected transceiver
32 MHz clock.

The connected radios are both fed from a fixed 32 MHz clock, with only
one being the clock source back to the SX130x concentrator.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
v1 -> v2:
* Fixed incorrect usage of clock cells
* Fixed wording in commit and descriptions
---
 .../bindings/net/lora/semtech,sx130x.yaml     | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
index 41919fb67ec4..6f9db3c84385 100644
--- a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
@@ -15,7 +15,8 @@ description: |
   demodulating LoRa signals on 8 channels simultaneously.
 
   It is typically paired with two SX125x IQ radios controlled over an
-  SPI directly from the concentrator.
+  SPI directly from the concentrator. One of the radios will provide
+  a 32 MHz clock back into the concentrator.
 
   The concentrator itself is controlled over SPI.
 
@@ -35,6 +36,20 @@ properties:
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
+    maxItems: 2
+    description: Input clock (CLK32M) name from provider, Input clock (CLKHS)
+      name from provider.
+
   radio-spi:
     type: object
     description: The concentrator can have two radios connected which are
@@ -68,6 +83,20 @@ examples:
 
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
@@ -77,6 +106,8 @@ examples:
         reg = <0>;
         reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
         spi-max-frequency = <8000000>;
+        clocks = <&radio1>, <&clkhs>;
+        clock-names = "clk32m", "clkhs";
 
         radio-spi {
           #address-cells = <1>;
@@ -85,11 +116,17 @@ examples:
           radio0: lora@0 {
             compatible = "semtech,sx1257";
             reg = <0>;
+            clocks = <&tcxo>;
+            clock-names = "tcxo";
           };
 
           radio1: lora@1 {
             compatible = "semtech,sx1257";
             reg = <1>;
+            clocks = <&tcxo>;
+            clock-names = "tcxo";
+            clock-output-names = "clk32m";
+            #clock-cells = <0>;
           };
         };
       };
-- 
2.17.1
