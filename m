From: Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH 3/3] dt-bindings: iio: adc: Add AD7616 ADC documentation
Date: Tue, 2 Apr 2019 16:18:41 +0300
Message-ID: <20190402131841.8430-3-beniamin.bia@analog.com>
References: <20190402131841.8430-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402131841.8430-1-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, biabeniamin@outlook.com, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

Document support for AD7616 Analog to Digital Converter.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
index d7b6241ca881..d8652460198e 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
@@ -7,6 +7,7 @@ Required properties for the AD7606:
 	* "adi,ad7606-8"
 	* "adi,ad7606-6"
 	* "adi,ad7606-4"
+	* "adi,ad7616"
 - reg: SPI chip select number for the device
 - spi-max-frequency: Max SPI frequency to use
 	see: Documentation/devicetree/bindings/spi/spi-bus.txt
-- 
2.17.1
