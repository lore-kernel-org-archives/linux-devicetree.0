From: Lucas Oshiro <lucasseikioshiro@gmail.com>
Subject: [PATCH v2] dt-bindings: iio: accel: adxl372: switch to YAML bindings
Date: Fri, 31 May 2019 17:11:14 -0300
Message-ID: <20190531201114.2973-1-lucasseikioshiro@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stefan.popa@analog.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, ardeleanalex@gmail.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rodrigo Ribeiro <rodrigorsdc@gmail.com>, Matheus Tavares <matheus.bernardino@usp.br>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert the old device tree documentation to yaml format.

Signed-off-by: Lucas Oshiro <lucasseikioshiro@gmail.com>
Signed-off-by: Rodrigo Ribeiro <rodrigorsdc@gmail.com>
Co-developed-by: Rodrigo Ribeiro <rodrigorsdc@gmail.com>
Reviewed-by: Matheus Tavares <matheus.bernardino@usp.br>
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
---
V2:
    - Update MAINTAINERS file
    - Remove description field for reg and interrupts properties
    - Add interrupts as a required property

 .../bindings/iio/accel/adi,adxl372.yaml       | 63 +++++++++++++++++++
 .../devicetree/bindings/iio/accel/adxl372.txt | 33 ----------
 MAINTAINERS                                   |  2 +-
 3 files changed, 64 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/accel/adxl372.txt

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
new file mode 100644
index 000000000000..a7fafb9bf5c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/accelerometers/adi,adxl372.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADXL372 3-Axis, +/-(200g) Digital Accelerometer
+
+maintainers:
+  - Stefan Popa <stefan.popa@analog.com>
+
+description: |
+  Analog Devices ADXL372 3-Axis, +/-(200g) Digital Accelerometer that supports
+  both I2C & SPI interfaces
+    https://www.analog.com/en/products/adxl372.html
+
+properties:
+  compatible:
+    enum:
+      - adi,adxl372
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+        #include <dt-bindings/gpio/gpio.h>
+        #include <dt-bindings/interrupt-controller/irq.h>
+        i2c0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                /* Example for a I2C device node */
+                accelerometer@53 {
+                        compatible = "adi,adxl372";
+                        reg = <0x53>;
+                        interrupt-parent = <&gpio>;
+                        interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+                };
+        };
+  - |
+        #include <dt-bindings/gpio/gpio.h>
+        #include <dt-bindings/interrupt-controller/irq.h>
+        spi0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                accelerometer@0 {
+                        compatible = "adi,adxl372";
+                        reg = <0>;
+                        spi-max-frequency = <1000000>;
+                        interrupt-parent = <&gpio>;
+                        interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+                };
+        };
diff --git a/Documentation/devicetree/bindings/iio/accel/adxl372.txt b/Documentation/devicetree/bindings/iio/accel/adxl372.txt
deleted file mode 100644
index a289964756a7..000000000000
--- a/Documentation/devicetree/bindings/iio/accel/adxl372.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Analog Devices ADXL372 3-Axis, +/-(200g) Digital Accelerometer
-
-http://www.analog.com/media/en/technical-documentation/data-sheets/adxl372.pdf
-
-Required properties:
- - compatible : should be "adi,adxl372"
- - reg: the I2C address or SPI chip select number for the device
-
-Required properties for SPI bus usage:
- - spi-max-frequency: Max SPI frequency to use
-
-Optional properties:
- - interrupts: interrupt mapping for IRQ as documented in
-   Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-Example for a I2C device node:
-
-	accelerometer@53 {
-		compatible = "adi,adxl372";
-		reg = <0x53>;
-		interrupt-parent = <&gpio>;
-		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
-	};
-
-Example for a SPI device node:
-
-	accelerometer@0 {
-		compatible = "adi,adxl372";
-		reg = <0>;
-		spi-max-frequency = <1000000>;
-		interrupt-parent = <&gpio>;
-		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 43a9cebb2c19..06cca7cd9627 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,7 +559,7 @@ S:	Supported
 F:	drivers/iio/accel/adxl372.c
 F:	drivers/iio/accel/adxl372_spi.c
 F:	drivers/iio/accel/adxl372_i2c.c
-F:	Documentation/devicetree/bindings/iio/accel/adxl372.txt
+F:	Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
 
 AF9013 MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
-- 
2.21.0
