From: Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH 4/4] dt-bindings: iio: adc: Add AD7606B ADC documentation
Date: Fri, 2 Aug 2019 13:03:04 +0300
Message-ID: <20190802100304.15899-4-beniamin.bia@analog.com>
References: <20190802100304.15899-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802100304.15899-1-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, paulmck@linux.ibm.com, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, biabeniamin@outlook.com, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

Documentation for AD7606B Analog to Digital Converter and software
mode was added.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt  | 8 ++++++++
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 4 +++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
index d8652460198e..9cc7ea19eca6 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
@@ -7,6 +7,7 @@ Required properties for the AD7606:
 	* "adi,ad7606-8"
 	* "adi,ad7606-6"
 	* "adi,ad7606-4"
+	* "adi,ad7606b"
 	* "adi,ad7616"
 - reg: SPI chip select number for the device
 - spi-max-frequency: Max SPI frequency to use
@@ -42,6 +43,12 @@ Optional properties:
 - adi,oversampling-ratio-gpios: must be the device tree identifier of the over-sampling
 				mode pins. As the line is active high, it should be marked
 				GPIO_ACTIVE_HIGH.
+- adi,sw-mode: Boolean, software mode of operation, so far available only for ad7606b.
+	Software mode is enabled when all three oversampling mode pins are connected to
+	high level. The AD7606B is configured by the corresponding registers. If the
+	adi,oversampling-ratio-gpios property is defined, then the driver will set the
+	oversampling gpios to high. Otherwise, it is assumed that the pins are hardwired
+	to VDD.
 
 Example:
 
@@ -63,4 +70,5 @@ Example:
 						&gpio 23 GPIO_ACTIVE_HIGH
 						&gpio 26 GPIO_ACTIVE_HIGH>;
 		standby-gpios = <&gpio 24 GPIO_ACTIVE_LOW>;
+		adi,sw-mode;
 	};
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 509dbe9c84d2..2afe31747a70 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -13,6 +13,7 @@ maintainers:
 description: |
   Analog Devices AD7606 Simultaneous Sampling ADC
   https://www.analog.com/media/en/technical-documentation/data-sheets/ad7606_7606-6_7606-4.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7606B.pdf
   https://www.analog.com/media/en/technical-documentation/data-sheets/AD7616.pdf
 
 properties:
@@ -22,6 +23,7 @@ properties:
       - adi,ad7606-8
       - adi,ad7606-6
       - adi,ad7606-4
+      - adi,ad7606b
       - adi,ad7616
 
   reg:
@@ -87,7 +89,7 @@ properties:
 
   adi,sw-mode:
     description:
-      Software mode of operation, so far available only for ad7616.
+      Software mode of operation, so far available only for ad7616 and ad7606B.
       It is enabled when all three oversampling mode pins are connected to
       high level. The device is configured by the corresponding registers. If the
       adi,oversampling-ratio-gpios property is defined, then the driver will set the
-- 
2.17.1
