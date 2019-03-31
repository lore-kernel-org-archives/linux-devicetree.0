From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH] bmp085.yaml: transform DT documentation of iio sensor into
 YAML
Date: Sun, 31 Mar 2019 18:47:56 +0200
Message-ID: <20190331164753.xifw6kkiwdg4xpzo@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, masneyb@onstation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

use bmp085.txt and change it into yaml format

fix links to datasheets in replaced documentation

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../devicetree/bindings/iio/pressure/bmp085.txt    | 27 --------
 .../devicetree/bindings/iio/pressure/bmp085.yaml   | 71 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/pressure/bmp085.txt
 create mode 100644 Documentation/devicetree/bindings/iio/pressure/bmp085.yaml

diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
deleted file mode 100644
index 61c72e63c584..000000000000
--- a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-BMP085/BMP18x/BMP28x digital pressure sensors
-
-Required properties:
-- compatible: must be one of:
-  "bosch,bmp085"
-  "bosch,bmp180"
-  "bosch,bmp280"
-  "bosch,bme280"
-
-Optional properties:
-- interrupts: interrupt mapping for IRQ
-- reset-gpios: a GPIO line handling reset of the sensor: as the line is
-  active low, it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)
-- vddd-supply: digital voltage regulator (see regulator/regulator.txt)
-- vdda-supply: analog voltage regulator (see regulator/regulator.txt)
-
-Example:
-
-pressure@77 {
-	compatible = "bosch,bmp085";
-	reg = <0x77>;
-	interrupt-parent = <&gpio0>;
-	interrupts = <25 IRQ_TYPE_EDGE_RISING>;
-	reset-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
-	vddd-supply = <&foo>;
-	vdda-supply = <&bar>;
-};
diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
new file mode 100644
index 000000000000..884f889c1ca5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BMP085/BMP180/BMP280/BME280 pressure iio sensors
+
+maintainers:
+  - Andreas Klinger <ak@it-klinger.de>
+
+description: |
+  Pressure, temperature and humidity iio sensors with i2c and spi interfaces
+
+  Specifications about the sensor can be found at:
+    https://www.bosch-sensortec.com/bst/products/all_products/bmp180
+    https://www.bosch-sensortec.com/bst/products/all_products/bmp280
+    https://www.bosch-sensortec.com/bst/products/all_products/bme280
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - bosch,bmp085
+          - bosch,bmp180
+          - bosch,bmp280
+          - bosch,bme280
+
+  vddd-supply:
+    description:
+      digital voltage regulator (see regulator/regulator.txt)
+    maxItems: 1
+
+  vdda-supply:
+    description:
+      analog voltage regulator (see regulator/regulator.txt)
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      A GPIO line handling reset of the sensor. As the line is active low,
+      it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)
+    maxItems: 1
+
+  interrupts:
+    description:
+      interrupt mapping for IRQ (BMP085 only)
+
+required:
+  - compatible
+  - vddd-supply
+  - vdda-supply
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pressure@77 {
+          compatible = "bosch,bmp085";
+          reg = <0x77>;
+          interrupt-parent = <&gpio0>;
+          interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+          reset-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
+          vddd-supply = <&foo>;
+          vdda-supply = <&bar>;
+      };
+    };
-- 
2.11.0
