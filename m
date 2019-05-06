Return-Path: <SRS0=eS3R=TG=analog.com=alexandru.Ardelean@kernel.org>
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [RFC][PATCH] dt-bindings: iio: accel: add adi,adxl345.yaml binding
Date: Mon, 6 May 2019 14:46:10 +0300
Message-ID: <20190506114610.28083-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a YAML binding for the Analog Devices ADXL345 I2C/SPI
accelerometer.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---

And now for the RFC part.
Normally, I would dig into source-code to try to figure this out, but at
this point-in-time, I am low on time/energy to do this.
And maybe this helps trigger a discussion about this.

Apologies if this has been coverted on the devicetree mailing list, but
at least we'd get some coverage on the IIO list (with this).

The ADXL345 device (as others) supports both I2C & SPI interfaces.

Question1: do we write 2 YAML files, or 1 ? I was looking at Zephyr (for
some ideas/reference) but it seems to me that the YAML DT binding format is
different than this one ? They write 2 files for ADXL372 (1 for SPI, 1 for
I2C).

Question1-a: one thing is that SPI requires some props to be `required`
that would not be required for the I2C binding. This could be solved by
doing 2 files, but if doing 1 YAML file, is there a way to do conditional
`required` ? i.e. property is required if `SPI` ? not sure how to check for
SPI vs I2C, it would be interesting (at some point) to somehow enforce
SPI/I2C bindings correctness.

Question2: `make dt_binding_check` seems to generate only the first
example. Is this known behavior, or do I need to take something else into
consideration ?

Question3: one idea that was neat in Zephyr, is that there is a 'inherits'
+ `!include` mechanism for including common SPI & I2C device stuff. It
would be neat to have this. Is there a way to do this now, or maybe this
would come later ? Maybe, just having a way to include a YAML file into
another would be interesting.

 .../bindings/iio/accel/adi,adxl345.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
new file mode 100644
index 000000000000..246b90c07aaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/accelerometers/adi,adxl345.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADXL345/ADXL375 3-Axis Digital Accelerometers
+
+maintainers:
+  - Michael Hennerich <michael.hennerich@analog.com>
+
+description: |
+  Driver for Analog Devices ADXL345/ADXL375 3-Axis Digital Accelerometers
+    http://www.analog.com/en/products/mems/accelerometers/adxl345.html
+    http://www.analog.com/en/products/sensors-mems/accelerometers/adxl375.html
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - adi,adxl345
+              - adi,adxl375
+
+  reg:
+    description:
+      The I2C address or SPI chip select number of the sensor
+    maxItems: 1
+
+  spi-cpha:
+    description:
+      SPI clock phase must be set, to select SPI mode 3
+
+  spi-cpol:
+    description:
+      SPI clock polarity must be set, to select SPI mode 3
+
+  interrupts:
+    description:
+      A variable number of interrupts warrants a description of what conditions
+      affect the number of interrupts. Otherwise, descriptions on standard
+      properties are not necessary.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    /* Example for a I2C device node */
+    accelerometer@2a {
+         compatible = "adi,adxl345";
+         reg = <0x53>;
+    };
+  - |
+    /* Example for a SPI device node */
+    accelerometer@0 {
+         compatible = "adi,adxl345";
+         reg = <0>;
+         spi-max-frequency = <5000000>;
+         spi-cpol;
+         spi-cpha;
+    };
-- 
2.17.1
