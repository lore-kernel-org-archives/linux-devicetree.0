From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH lora-next 4/4] dt-bindings: lora: sx130x: add clock bindings
Date: Tue,  8 Jan 2019 17:41:32 +0900
Message-ID: <20190108084132.10214-4-ben.whitten@gmail.com>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190108084132.10214-1-ben.whitten@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: linux-lpwan@lists.infradead.org, afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ben Whitten <ben.whitten@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

The sx130x family consumes two clocks, a 32MHz clock provided by a
connected IQ transceiver, and a 133MHz high speed clock.

In the example we connect the concentrator to output 0 of a fixed clock
providing the 133MHz high speed clock, and we connect to output 0 of a
connected transceiver 32MHz clock.

The connected radios are both fed from output 0 of a fixed 32MHz clock,
with only one being the clock source back with one output to the
sx130x concentrator.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
 .../{ => net}/lora/semtech,sx130x.yaml        | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{ => net}/lora/semtech,sx130x.yaml (62%)

diff --git a/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
similarity index 62%
rename from Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
rename to Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
index ad263bc4e60d..23a096ca2912 100644
--- a/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
@@ -15,7 +15,8 @@ description: |
   demodulating LoRa signals on 8 channels simultaneously.
 
   It is typically paired with two sx125x IQ radios controlled over an
-  SPI directly from the concentrator.
+  SPI directly from the concentrator. One of the radios will provide
+  a 32MHz clock back into the concentrator.
 
   The concentrator itself it controlled over SPI.
 
@@ -41,6 +42,20 @@ properties:
       in Hz. Maximum SPI frequency is 10MHz although 8MHz is typically used
       on a number of cards.
 
+  clocks:
+    maxItems: 2
+    items:
+      - description: 32MHz clock provider
+      - description: 133MHz high speed clock provider
+    description: The chip requires two clock inputs; A 32MHz clock at CMOS
+      level which is provided from a connected radio.
+      And a 133MHz high speed clock at CMOS level provided by an oscillator.
+
+  clock-names:
+    items:
+      - const: clk32m
+      - const: clkhs
+
   radio-spi:
     description: The concentrator has two radios connected which are contained
       within the following node.
@@ -64,11 +79,27 @@ required:
 
 examples:
   - |
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
     concentrator0: lora@0 {
       compatible = "semtech,sx1301";
       reg = <0>;
       reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
       spi-max-frequency = <8000000>;
+      clocks = <&radio1 0>, <&clkhs 0>;
+      clock-names = "clk32m", "clkhs";
 
       radio-spi {
         #address-cells = <1>;
@@ -77,11 +108,17 @@ examples:
         radio0: lora@0 {
           compatible = "semtech,sx1257";
           reg = <0>;
+          clocks = <&tcxo 0>;
+          clock-names = "tcxo";
         };
 
         radio1: lora@1 {
           compatible = "semtech,sx1257";
           reg = <1>;
+          clocks = <&tcxo 0>;
+          clock-names = "tcxo";
+          clock-output-names = "clk32m";
+          #clock-cells = <0>;
         };
       };
     };
-- 
2.17.1
