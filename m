From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v3 2/2] dt-bindings: iio: adc: Add docs for AD7768-1
Date: Thu, 31 Jan 2019 18:21:42 +0200
Message-ID: <1548951702-28525-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

Document support for AD7768-1 Analog to Digital Converter.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
	- Added information regarding the simultaneous sampling of the SYNC-IN pin
	- Added the reset-gpios in the binding.
Changes in v3:
	- Nothing changed

 .../devicetree/bindings/iio/adc/adi,ad7768-1.txt   | 41 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
new file mode 100644
index 0000000..9f5b88c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
@@ -0,0 +1,41 @@
+Analog Devices AD7768-1 ADC device driver
+
+Required properties for the AD7768-1:
+
+- compatible: Must be "adi,ad7768-1"
+- reg: SPI chip select number for the device
+- spi-max-frequency: Max SPI frequency to use
+	see: Documentation/devicetree/bindings/spi/spi-bus.txt
+- clocks: phandle to the master clock (mclk)
+	see: Documentation/devicetree/bindings/clock/clock-bindings.txt
+- clock-names: Must be "mclk".
+- interrupts: IRQ line for the ADC
+	see: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+- vref-supply: vref supply can be used as reference for conversion
+- adi,sync-in-gpios: must be the device tree identifier of the SYNC-IN pin. Enables
+	synchronization of multiple devices that require simultaneous sampling.
+	A pulse is always required if the configuration is changed in any way, for example
+	if the filter decimation rate changes. As the line is active low, it should
+	be marked GPIO_ACTIVE_LOW.
+
+Optional properties:
+
+ - reset-gpios : GPIO spec for the RESET pin. If specified, it will be asserted during
+	driver probe. As the line is active low, it should be marked GPIO_ACTIVE_LOW.
+
+Example:
+
+	adc@0 {
+		compatible = "adi,ad7768-1";
+		reg = <0>;
+		spi-max-frequency = <2000000>;
+		spi-cpol;
+		spi-cpha;
+		vref-supply = <&adc_vref>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&gpio>;
+		adi,sync-in-gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+		clocks = <&ad7768_mclk>;
+		clock-names = "mclk";
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ba3811..e5613b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -868,6 +868,7 @@ L:	linux-iio@vger.kernel.org
 W:	http://ez.analog.com/community/linux-device-drivers
 S:	Supported
 F:	drivers/iio/adc/ad7768-1.c
+F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
 
 ANALOG DEVICES INC AD9389B DRIVER
 M:	Hans Verkuil <hans.verkuil@cisco.com>
-- 
2.7.4
