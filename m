From: Nikolaus Schulz <nikolaus.schulz@avionic-design.de>
Subject: [PATCH 1/2] iio: document ti-dac8554 devicetree bindings
Date: Thu, 20 Nov 2014 17:54:17 +0100
Message-ID: <1416502461-13980-1-git-send-email-nikolaus.schulz@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nikolaus Schulz <nikolaus.schulz@avionic-design.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Alban Bedel <alban.bedel@avionic-design.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Nikolaus Schulz <nikolaus.schulz@avionic-design.de>
---
 .../devicetree/bindings/iio/dac/ti-dac8554.txt     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt

diff --git a/Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt b/Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt
new file mode 100644
index 0000000..16f7178
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/ti-dac8554.txt
@@ -0,0 +1,22 @@
+TI DAC8554 Digital to Analog Converter
+
+This driver supports the SPI bus.
+
+Required properties:
+	- compatible: must be "ti,dac8554"
+	- vref-supply: the vref power supply
+	- address: the additional 2-bit chip address
+
+For required properties on SPI, please consult
+Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Example:
+
+	dac8554@0 {
+		compatible = "ti,dac8554";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+
+		vref-supply = <&vdd_vref>;
+		address = <0>;
+	};
-- 
2.1.3
