From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v3 7/7] iio: imu: adis16480: Add docs for ADIS16480 IMU
Date: Wed, 27 Feb 2019 18:14:28 +0200
Message-ID: <1551284068-4882-8-git-send-email-stefan.popa@analog.com>
References: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document support for ADIS16480 Inertial Measurement Unit.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iio/imu/adi,adis16480.txt  | 49 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt

diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt b/Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt
new file mode 100644
index 0000000..39ab016
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt
@@ -0,0 +1,49 @@
+
+Analog Devices ADIS16480 and similar IMUs
+
+Required properties for the ADIS16480:
+
+- compatible: Must be one of
+	* "adi,adis16375"
+	* "adi,adis16480"
+	* "adi,adis16485"
+	* "adi,adis16488"
+	* "adi,adis16495-1"
+	* "adi,adis16495-2"
+	* "adi,adis16495-3"
+	* "adi,adis16497-1"
+	* "adi,adis16497-2"
+	* "adi,adis16497-3"
+- reg: SPI chip select number for the device
+- spi-max-frequency: Max SPI frequency to use
+	see: Documentation/devicetree/bindings/spi/spi-bus.txt
+- spi-cpha: See Documentation/devicetree/bindings/spi/spi-bus.txt
+- spi-cpol: See Documentation/devicetree/bindings/spi/spi-bus.txt
+- interrupts: interrupt mapping for IRQ, accepted values are:
+	* IRQF_TRIGGER_RISING
+	* IRQF_TRIGGER_FALLING
+
+Optional properties:
+
+- interrupt-names: Data ready line selection. Valid values are:
+	* DIO1
+	* DIO2
+	* DIO3
+	* DIO4
+	If this field is left empty, DIO1 is assigned as default data ready
+	signal.
+- reset-gpios: must be the device tree identifier of the RESET pin. As the line
+	is active low, it should be marked GPIO_ACTIVE_LOW.
+
+Example:
+
+	imu@0 {
+		compatible = "adi,adis16495-1";
+		reg = <0>;
+		spi-max-frequency = <3200000>;
+		spi-cpol;
+		spi-cpha;
+		interrupts = <25 IRQF_TRIGGER_FALLING>;
+		interrupt-parent = <&gpio>;
+		interrupt-names = "DIO2";
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index e4091ac..beecd1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -942,6 +942,7 @@ F:	drivers/dma/dma-axi-dmac.c
 ANALOG DEVICES INC IIO DRIVERS
 M:	Lars-Peter Clausen <lars@metafoo.de>
 M:	Michael Hennerich <Michael.Hennerich@analog.com>
+M:	Stefan Popa <stefan.popa@analog.com>
 W:	http://wiki.analog.com/
 W:	http://ez.analog.com/community/linux-device-drivers
 S:	Supported
-- 
2.7.4
