From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V4 4/5] dt-bindings: iio: adc: Convert ad7124 documentation to YAML
Date: Tue, 25 Jun 2019 11:11:27 +0300
Message-ID: <20190625081128.22190-4-mircea.caprioru@analog.com>
References: <20190625081128.22190-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625081128.22190-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

Convert AD7124 bindings documentation to YAML format.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---

Changelog v2:
- modified SPDX license to GPL-2.0 OR BSD-2-Clause
- added regex for a range from 0 to 15
- added minimum and maximum constraints for reg property
- set type and range of values for adi,reference-select property
- used items for diff-channels property
- set bipolar, adi,buffered-positive and negative to type: boolean

Changelog v3:
- moved adi,buffered-positive and negative properties to own commit

Changelog v4:
- removed old txt dt-binding

 .../bindings/iio/adc/adi,ad7124.txt           |  75 ---------
 .../bindings/iio/adc/adi,ad7124.yaml          | 144 ++++++++++++++++++
 2 files changed, 144 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.txt
deleted file mode 100644
index 416273dce569..000000000000
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-Analog Devices AD7124 ADC device driver
-
-Required properties for the AD7124:
-	- compatible: Must be one of "adi,ad7124-4" or "adi,ad7124-8"
-	- reg: SPI chip select number for the device
-	- spi-max-frequency: Max SPI frequency to use
-		see: Documentation/devicetree/bindings/spi/spi-bus.txt
-	- clocks: phandle to the master clock (mclk)
-		see: Documentation/devicetree/bindings/clock/clock-bindings.txt
-	- clock-names: Must be "mclk".
-	- interrupts: IRQ line for the ADC
-		see: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-	  Required properties:
-		* #address-cells: Must be 1.
-		* #size-cells: Must be 0.
-
-	  Subnode(s) represent the external channels which are connected to the ADC.
-	  Each subnode represents one channel and has the following properties:
-		Required properties:
-			* reg: The channel number. It can have up to 4 channels on ad7124-4
-			  and 8 channels on ad7124-8, numbered from 0 to 15.
-			* diff-channels: see: Documentation/devicetree/bindings/iio/adc/adc.txt
-
-		Optional properties:
-			* bipolar: see: Documentation/devicetree/bindings/iio/adc/adc.txt
-			* adi,reference-select: Select the reference source to use when
-			  converting on the the specific channel. Valid values are:
-			  0: REFIN1(+)/REFIN1(−).
-			  1: REFIN2(+)/REFIN2(−).
-			  3: AVDD
-			  If this field is left empty, internal reference is selected.
-
-Optional properties:
-	- refin1-supply: refin1 supply can be used as reference for conversion.
-	- refin2-supply: refin2 supply can be used as reference for conversion.
-	- avdd-supply: avdd supply can be used as reference for conversion.
-
-Example:
-	adc@0 {
-		compatible = "adi,ad7124-4";
-		reg = <0>;
-		spi-max-frequency = <5000000>;
-		interrupts = <25 2>;
-		interrupt-parent = <&gpio>;
-		refin1-supply = <&adc_vref>;
-		clocks = <&ad7124_mclk>;
-		clock-names = "mclk";
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		channel@0 {
-			reg = <0>;
-			diff-channels = <0 1>;
-			adi,reference-select = <0>;
-		};
-
-		channel@1 {
-			reg = <1>;
-			bipolar;
-			diff-channels = <2 3>;
-			adi,reference-select = <0>;
-		};
-
-		channel@2 {
-			reg = <2>;
-			diff-channels = <4 5>;
-		};
-
-		channel@3 {
-			reg = <3>;
-			diff-channels = <6 7>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
new file mode 100644
index 000000000000..1b3d84d08609
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Analog Devices Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/iio/adc/adi,ad7124.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7124 ADC device driver
+
+maintainers:
+  - Stefan Popa <stefan.popa@analog.com>
+
+description: |
+  Bindings for the Analog Devices AD7124 ADC device. Datasheet can be
+  found here:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/AD7124-8.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7124-4
+      - adi,ad7124-8
+
+  reg:
+    description: SPI chip select number for the device
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: phandle to the master clock (mclk)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  interrupts:
+    description: IRQ line for the ADC
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  refin1-supply:
+    description: refin1 supply can be used as reference for conversion.
+    maxItems: 1
+
+  refin2-supply:
+    description: refin2 supply can be used as reference for conversion.
+    maxItems: 1
+
+  avdd-supply:
+    description: avdd supply can be used as reference for conversion.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+patternProperties:
+  "^channel@([0-9]|1[0-5])$":
+    type: object
+    description: |
+      Represents the external channels which are connected to the ADC.
+      See Documentation/devicetree/bindings/iio/adc/adc.txt.
+
+    properties:
+      reg:
+        description: |
+          The channel number. It can have up to 8 channels on ad7124-4
+          and 16 channels on ad7124-8, numbered from 0 to 15.
+        items:
+         minimum: 0
+         maximum: 15
+
+      adi,reference-select:
+        description: |
+          Select the reference source to use when converting on
+          the specific channel. Valid values are:
+          0: REFIN1(+)/REFIN1(−).
+          1: REFIN2(+)/REFIN2(−).
+          3: AVDD
+          If this field is left empty, internal reference is selected.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 3]
+
+      diff-channels:
+        description: see Documentation/devicetree/bindings/iio/adc/adc.txt
+        items:
+          minimum: 0
+          maximum: 15
+
+      bipolar:
+        description: see Documentation/devicetree/bindings/iio/adc/adc.txt
+        type: boolean
+
+    required:
+      - reg
+      - diff-channels
+
+examples:
+  - |
+    adc@0 {
+      compatible = "adi,ad7124-4";
+      reg = <0>;
+      spi-max-frequency = <5000000>;
+      interrupts = <25 2>;
+      interrupt-parent = <&gpio>;
+      refin1-supply = <&adc_vref>;
+      clocks = <&ad7124_mclk>;
+      clock-names = "mclk";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      channel@0 {
+        reg = <0>;
+        diff-channels = <0 1>;
+        adi,reference-select = <0>;
+      };
+
+      channel@1 {
+        reg = <1>;
+        bipolar;
+        diff-channels = <2 3>;
+        adi,reference-select = <0>;
+      };
+
+      channel@2 {
+        reg = <2>;
+        diff-channels = <4 5>;
+      };
+
+      channel@3 {
+        reg = <3>;
+        diff-channels = <6 7>;
+      };
+    };
-- 
2.17.1
