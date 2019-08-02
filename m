From: Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH 3/4] dt-bindings: iio: adc: Migrate AD7606 documentation to yaml
Date: Fri, 2 Aug 2019 13:03:03 +0300
Message-ID: <20190802100304.15899-3-beniamin.bia@analog.com>
References: <20190802100304.15899-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802100304.15899-1-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, paulmck@linux.ibm.com, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, biabeniamin@outlook.com, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

The documentation for ad7606 was migrated to yaml, the new Linux Kernel
standard.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
---
 .../bindings/iio/adc/adi,ad7606.yaml          | 134 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 2 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
new file mode 100644
index 000000000000..509dbe9c84d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7606.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7606 Simultaneous Sampling ADC
+
+maintainers:
+  - Beniamin Bia <beniamin.bia@analog.com>
+  - Stefan Popa <stefan.popa@analog.com>
+
+description: |
+  Analog Devices AD7606 Simultaneous Sampling ADC
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ad7606_7606-6_7606-4.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7616.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7605-4
+      - adi,ad7606-8
+      - adi,ad7606-6
+      - adi,ad7606-4
+      - adi,ad7616
+
+  reg:
+    maxItems: 1
+
+  spi-cpha: true
+
+  avcc-supply:
+    description:
+      Phandle to the Avcc power supply
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  adi,conversion-start-gpios:
+    description:
+      Must be the device tree identifier of the CONVST pin.
+      This logic input is used to initiate conversions on the analog
+      input channels. As the line is active high, it should be marked
+      GPIO_ACTIVE_HIGH.
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Must be the device tree identifier of the RESET pin. If specified,
+      it will be asserted during driver probe. As the line is active high,
+      it should be marked GPIO_ACTIVE_HIGH.
+    maxItems: 1
+
+  standby-gpios:
+    description:
+       Must be the device tree identifier of the STBY pin. This pin is used
+       to place the AD7606 into one of two power-down modes, Standby mode or
+       Shutdown mode. As the line is active low, it should be marked
+       GPIO_ACTIVE_LOW.
+    maxItems: 1
+
+  adi,first-data-gpios:
+    description:
+      Must be the device tree identifier of the FRSTDATA pin.
+      The FRSTDATA output indicates when the first channel, V1, is
+      being read back on either the parallel, byte or serial interface.
+      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.
+    maxItems: 1
+
+  adi,range-gpios:
+    description:
+      Must be the device tree identifier of the RANGE pin. The polarity on
+      this pin determines the input range of the analog input channels. If
+      this pin is tied to a logic high, the analog input range is ±10V for
+      all channels. If this pin is tied to a logic low, the analog input range
+      is ±5V for all channels. As the line is active high, it should be marked
+      GPIO_ACTIVE_HIGH.
+    maxItems: 1
+
+  adi,oversampling-ratio-gpios:
+    description:
+      Must be the device tree identifier of the over-sampling
+      mode pins. As the line is active high, it should be marked
+      GPIO_ACTIVE_HIGH.
+    maxItems: 1
+
+  adi,sw-mode:
+    description:
+      Software mode of operation, so far available only for ad7616.
+      It is enabled when all three oversampling mode pins are connected to
+      high level. The device is configured by the corresponding registers. If the
+      adi,oversampling-ratio-gpios property is defined, then the driver will set the
+      oversampling gpios to high. Otherwise, it is assumed that the pins are hardwired
+      to VDD.
+    maxItems: 1
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - spi-cpha
+  - avcc-supply
+  - interrupts
+  - adi,conversion-start-gpios
+
+examples:
+  - |
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+                compatible = "adi,ad7606-8";
+                reg = <0>;
+                spi-max-frequency = <1000000>;
+                spi-cpol;
+
+                avcc-supply = <&adc_vref>;
+
+                interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+                interrupt-parent = <&gpio>;
+
+                adi,conversion-start-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+                reset-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
+                adi,first-data-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+                adi,oversampling-ratio-gpios = <&gpio 18 GPIO_ACTIVE_HIGH
+                                                &gpio 23 GPIO_ACTIVE_HIGH
+                                                &gpio 26 GPIO_ACTIVE_HIGH>;
+                standby-gpios = <&gpio 24 GPIO_ACTIVE_LOW>;
+                adi,sw-mode;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 052d7a8591fb..d2e465772071 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -900,7 +900,7 @@ L:	linux-iio@vger.kernel.org
 W:	http://ez.analog.com/community/linux-device-drivers
 S:	Supported
 F:	drivers/iio/adc/ad7606.c
-F:	Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
+F:	Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
 
 ANALOG DEVICES INC AD7768-1 DRIVER
 M:	Stefan Popa <stefan.popa@analog.com>
-- 
2.17.1
