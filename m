From: Matt Porter <mporter@konsulko.com>
Subject: [PATCH 1/3] iio: temperature: add max6675 dt binding
Date: Mon,  3 Aug 2015 16:56:48 -0400
Message-ID: <1438635410-3757-2-git-send-email-mporter@konsulko.com>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux IIO List <linux-iio@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a DT binding for the MAX6675 SPI thermocouple converter.
The datasheet for this device may be found at
http://datasheets.maximintegrated.com/en/ds/MAX6675.pdf

Signed-off-by: Matt Porter <mporter@konsulko.com>
---
 .../devicetree/bindings/iio/temperature/max6675.txt   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/max6675.txt

diff --git a/Documentation/devicetree/bindings/iio/temperature/max6675.txt b/Documentation/devicetree/bindings/iio/temperature/max6675.txt
new file mode 100644
index 0000000..4e643e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/max6675.txt
@@ -0,0 +1,19 @@
+Maxim MAX6675 thermocouple converter
+
+Required properties:
+
+	- compatible: must be "maxim,max6675"
+	- reg: SPI chip select number for the device
+	- spi-max-frequency: must be 4300000
+	- spi-cpha: SPI Mode 1.
+
+	Refer to spi/spi-bus.txt for generic SPI slave bindings
+
+Example:
+
+	max6675@0 {
+		compatible = "maxim,max6675";
+		reg = <0>;
+		spi-max-frequency = <4300000>;
+		spi-cpha;
+	};
-- 
2.1.4
