From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v2] avia-hx711.yaml: transform DT binding to YAML
Date: Mon, 1 Apr 2019 19:33:54 +0200
Message-ID: <20190401173353.g4k5vb6flsfgtaaj@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

replace avia-hx711.txt by avia-hx711.yaml as yaml devicetree
documentation for avia hx711 iio adc sensor

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../devicetree/bindings/iio/adc/avia-hx711.txt     | 24 --------
 .../devicetree/bindings/iio/adc/avia-hx711.yaml    | 66 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
deleted file mode 100644
index 7222328a3d0d..000000000000
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* AVIA HX711 ADC chip for weight cells
-  Bit-banging driver
-
-Required properties:
- - compatible:	Should be "avia,hx711"
- - sck-gpios:	Definition of the GPIO for the clock
- - dout-gpios:	Definition of the GPIO for data-out
-		See Documentation/devicetree/bindings/gpio/gpio.txt
- - avdd-supply:	Definition of the regulator used as analog supply
-
-Optional properties:
- - clock-frequency:	Frequency of PD_SCK in Hz
-			Minimum value allowed is 10 kHz because of maximum
-			high time of 50 microseconds.
-
-Example:
-weight {
-	compatible = "avia,hx711";
-	sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
-	dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
-	avdd-suppy = <&avdd>;
-	clock-frequency = <100000>;
-};
-
diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
new file mode 100644
index 000000000000..8a4100ceeaf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: AVIA HX711 ADC chip for weight cells
+
+maintainers:
+  - Andreas Klinger <ak@it-klinger.de>
+
+description: |
+  Bit-banging driver using two GPIOs:
+  - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
+    and up to 3 cycles for selection of the input channel and gain for the
+    next measurement
+  - dout-gpio is the sensor data the sensor responds to the clock
+
+  Specifications about the driver can be found at:
+  http://www.aviaic.com/ENProducts.aspx
+
+properties:
+  compatible:
+    enum:
+      - avia,hx711
+
+  sck-gpios:
+    description:
+      Definition of the GPIO for the clock (output). In the datasheet it is
+      named PD_SCK
+    maxItems: 1
+
+  dout-gpios:
+    description:
+      Definition of the GPIO for the data-out sent by the sensor in
+      response to the clock (input).
+      See Documentation/devicetree/bindings/gpio/gpio.txt for information
+      on how to specify a consumer gpio.
+    maxItems: 1
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog supply
+    maxItems: 1
+
+  clock-frequency:
+    minimum: 20000
+    maximum: 2500000
+    default: 400000
+
+required:
+  - compatible
+  - sck-gpios
+  - dout-gpios
+  - avdd-supply
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    weight {
+        compatible = "avia,hx711";
+        sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
+        dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        avdd-suppy = <&avdd>;
+        clock-frequency = <100000>;
+    };
-- 
2.11.0
