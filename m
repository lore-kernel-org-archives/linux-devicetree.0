From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Subject: [PATCH 2/2] dt-bindings: iio: adc: Add DT docs for AD7292
Date: Sun, 13 Oct 2019 11:13:47 -0300
Message-ID: <20191013141345.uctcutryo7pmdkem@smtp.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: dragos.bogdan@analog.com, alexandru.ardelean@analog.com, stefan.popa@analog.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a device tree binding doc for AD7292 monitor and control system.

Signed-off-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
---
 .../bindings/iio/adc/adi,ad7292.yaml          | 71 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
new file mode 100644
index 000000000000..16be9ea4194d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7292.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7292 10-Bit Monitor and Control System
+
+maintainers:
+  - Marcelo Schmitt <marcelo.schmitt1@gmail.com>
+
+description: |
+  Analog Devices AD7292 10-Bit Monitor and Control System with ADC, DACs,
+  Temperature Sensor, and GPIOs
+
+  Specifications about the part can be found at:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/ad7292.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7292
+
+  reg:
+    maxItems: 1
+
+  vref-supply:
+    description: |
+      The regulator supply for ADC and DAC reference voltage.
+    maxItems: 1
+
+  spi-cpha:
+    description: |
+      See Documentation/devicetree/bindings/spi/spi-controller.yaml
+    maxItems: 1
+
+  diff-channels:
+    description: |
+      Empty property to tell whether VIN0 and VIN1 shall work as differential
+      inputs.
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    spi0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ad7292: ad7292@0 {
+        compatible = "adi,ad7292";
+        reg = <0>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        spi-max-frequency = <25000000>;
+        vref-supply = <&adc_vref>;
+        spi-cpha;
+        diff-channels;
+      };
+    }
diff --git a/MAINTAINERS b/MAINTAINERS
index e78317a5f4f1..5941cfc0d6f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -819,6 +819,7 @@ L:	linux-iio@vger.kernel.org
 W:	http://ez.analog.com/community/linux-device-drivers
 S:	Supported
 F:	drivers/iio/adc/ad7292.c
+F:	Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
 
 ANALOG DEVICES INC AD7606 DRIVER
 M:	Stefan Popa <stefan.popa@analog.com>
-- 
2.23.0
