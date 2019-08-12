From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH 4/4] dt-bindings: iio: adc: ad7192: Add binding documentation for AD7192
Date: Mon, 12 Aug 2019 12:03:41 +0300
Message-ID: <20190812090341.27183-4-mircea.caprioru@analog.com>
References: <20190812090341.27183-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812090341.27183-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

This patch add device tree binding documentation for AD7192 adc in YAML
format.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---
 .../bindings/iio/adc/adi,ad7192.yaml          | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
new file mode 100644
index 000000000000..a56ee391f6a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Analog Devices Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/iio/adc/adi,ad7192.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7192 ADC device driver
+
+maintainers:
+  - Michael Hennerich <michael.hennerich@analog.com>
+
+description: |
+  Bindings for the Analog Devices AD7192 ADC device. Datasheet can be
+  found here:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7192.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7190
+      - adi,ad7192
+      - adi,ad7193
+      - adi,ad7195
+
+  reg:
+    description: SPI chip select number for the device
+    maxItems: 1
+
+  spi-cpol: true
+
+  spi-cpha: true
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
+  dvdd-supply:
+    description: DVdd voltage supply
+    items:
+      - const: dvdd
+
+  avdd-supply:
+    description: AVdd voltage supply
+    items:
+      - const: avdd
+
+  adi,rejection-60-Hz-enable:
+    description: |
+      This bit enables a notch at 60 Hz when the first notch of the sinc
+      filter is at 50 Hz. When REJ60 is set, a filter notch is placed at
+      60 Hz when the sinc filter first notch is at 50 Hz. This allows
+      simultaneous 50 Hz/ 60 Hz rejection.
+    type: boolean
+
+  adi,refin2-pins-enable:
+    description: |
+      External reference applied between the P1/REFIN2(+) and P0/REFIN2(−) pins.
+    type: boolean
+
+  adi,buffer-enable:
+    description: |
+      Enables the buffer on the analog inputs. If cleared, the analog inputs
+      are unbuffered, lowering the power consumption of the device. If this
+      bit is set, the analog inputs are buffered, allowing the user to place
+      source impedances on the front end without contributing gain errors to
+      the system.
+    type: boolean
+
+  adi,burnout-currents-enable:
+    description: |
+      When this bit is set to 1, the 500 nA current sources in the signal
+      path are enabled. When BURN = 0, the burnout currents are disabled.
+      The burnout currents can be enabled only when the buffer is active
+      and when chop is disabled.
+    type: boolean
+
+  bipolar:
+    description: see Documentation/devicetree/bindings/iio/adc/adc.txt
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - dvdd-supply
+  - avdd-supply
+  - spi-cpol
+  - spi-cpha
+
+examples:
+  - |
+    spi0 {
+      ad7192@0 {
+        compatible = "adi,ad7192";
+        reg = <0>;
+        spi-max-frequency = <1000000>;
+        spi-cpol;
+        spi-cpha;
+        clocks = <&ad7192_mclk>;
+        clock-names = "mclk";
+        #interrupt-cells = <2>;
+        interrupts = <25 0x2>;
+        interrupt-parent = <&gpio>;
+        dvdd-supply = <&dvdd>;
+        avdd-supply = <&avdd>;
+
+        adi,refin2-pins-enable;
+        adi,rejection-60-Hz-enable;
+        adi,buffer-enable;
+        adi,burnout-currents-enable;
+        };
+    }
-- 
2.17.1
