From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] dt-bindings: iio: ad7124: Fix dtc warnings in example
Date: Tue, 16 Jul 2019 14:33:24 -0600
Message-ID: <20190716203324.12198-2-robh@kernel.org>
References: <20190716203324.12198-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190716203324.12198-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

With the conversion to DT schema, the examples are now compiled with
dtc. The ad7124 binding example has the following warning:

Documentation/devicetree/bindings/iio/adc/adi,ad7124.example.dts:19.11-21: \
Warning (reg_format): /example-0/adc@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)

There's a default #size-cells and #address-cells values of 1 for
examples. For examples needing different values such as this one on a
SPI bus, they need to provide a SPI bus parent node.

Fixes: 26ae15e62d3c ("Convert AD7124 bindings documentation to YAML format.")

Cc: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/iio/adc/adi,ad7124.yaml          | 71 ++++++++++---------
 1 file changed, 38 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
index cf494a08b837..9692b7f719f5 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
@@ -114,42 +114,47 @@ patternProperties:
 
 examples:
   - |
-    adc@0 {
-      compatible = "adi,ad7124-4";
-      reg = <0>;
-      spi-max-frequency = <5000000>;
-      interrupts = <25 2>;
-      interrupt-parent = <&gpio>;
-      refin1-supply = <&adc_vref>;
-      clocks = <&ad7124_mclk>;
-      clock-names = "mclk";
-
+    spi {
       #address-cells = <1>;
       #size-cells = <0>;
 
-      channel@0 {
+      adc@0 {
+        compatible = "adi,ad7124-4";
         reg = <0>;
-        diff-channels = <0 1>;
-        adi,reference-select = <0>;
-        adi,buffered-positive;
-      };
-
-      channel@1 {
-        reg = <1>;
-        bipolar;
-        diff-channels = <2 3>;
-        adi,reference-select = <0>;
-        adi,buffered-positive;
-        adi,buffered-negative;
-      };
-
-      channel@2 {
-        reg = <2>;
-        diff-channels = <4 5>;
-      };
-
-      channel@3 {
-        reg = <3>;
-        diff-channels = <6 7>;
+        spi-max-frequency = <5000000>;
+        interrupts = <25 2>;
+        interrupt-parent = <&gpio>;
+        refin1-supply = <&adc_vref>;
+        clocks = <&ad7124_mclk>;
+        clock-names = "mclk";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0>;
+          diff-channels = <0 1>;
+          adi,reference-select = <0>;
+          adi,buffered-positive;
+        };
+
+        channel@1 {
+          reg = <1>;
+          bipolar;
+          diff-channels = <2 3>;
+          adi,reference-select = <0>;
+          adi,buffered-positive;
+          adi,buffered-negative;
+        };
+
+        channel@2 {
+          reg = <2>;
+          diff-channels = <4 5>;
+        };
+
+        channel@3 {
+          reg = <3>;
+          diff-channels = <6 7>;
+        };
       };
     };
-- 
2.20.1
