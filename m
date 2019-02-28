From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v4 9/9] staging: iio: ad7780: add device tree binding
Date: Thu, 28 Feb 2019 11:26:28 -0300
Message-ID: <ac8955ea9d903c106535d76549ff9802f527f4f6.1551358569.git.renatogeh@gmail.com>
References: <cover.1551358569.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1551358569.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adds a device tree binding for the ad7780 driver.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
 .../bindings/iio/adc/adi,ad7780.txt           | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
new file mode 100644
index 000000000000..440e52555349
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
@@ -0,0 +1,48 @@
+* Analog Devices AD7170/AD7171/AD7780/AD7781
+
+Data sheets:
+
+- AD7170:
+	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7170.pdf
+- AD7171:
+	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7171.pdf
+- AD7780:
+	* https://www.analog.com/media/en/technical-documentation/data-sheets/ad7780.pdf
+- AD7781:
+	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7781.pdf
+
+Required properties:
+
+- compatible: should be one of
+	* "adi,ad7170"
+	* "adi,ad7171"
+	* "adi,ad7780"
+	* "adi,ad7781"
+- reg: spi chip select number for the device
+- vref-supply: the regulator supply for the ADC reference voltage
+
+Optional properties:
+
+- powerdown-gpios:  must be the device tree identifier of the PDRST pin. If
+		    specified, it will be asserted during driver probe. As the
+		    line is active high, it should be marked GPIO_ACTIVE_HIGH.
+- adi,gain-gpios:   must be the device tree identifier of the GAIN pin. Only for
+		    the ad778x chips. If specified, it will be asserted during
+		    driver probe. As the line is active low, it should be marked
+		    GPIO_ACTIVE_LOW.
+- adi,filter-gpios: must be the device tree identifier of the FILTER pin. Only
+		    for the ad778x chips. If specified, it will be asserted
+		    during driver probe. As the line is active low, it should be
+		    marked GPIO_ACTIVE_LOW.
+
+Example:
+
+adc@0 {
+	compatible =  "adi,ad7780";
+	reg =	      <0>;
+	vref-supply = <&vdd_supply>
+
+	powerdown-gpios  = <&gpio 12 GPIO_ACTIVE_HIGH>;
+	adi,gain-gpios   = <&gpio  5 GPIO_ACTIVE_LOW>;
+	adi,filter-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
+};
-- 
2.21.0
