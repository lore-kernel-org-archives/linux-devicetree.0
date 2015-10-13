From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 1/2] Documentation: ad5592r: Added devicetree bindings documentation
Date: Tue, 13 Oct 2015 11:37:59 +0200
Message-ID: <1444729080-9937-1-git-send-email-paul.cercueil@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Michael Hennerich <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Antonio Fiol <antonio-ZGO+nOAM/nI@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/iio/dac/ad5592r.txt        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/ad5592r.txt

 v2: Fix indentation issue

diff --git a/Documentation/devicetree/bindings/iio/dac/ad5592r.txt b/Documentation/devicetree/bindings/iio/dac/ad5592r.txt
new file mode 100644
index 0000000..12b8d0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/ad5592r.txt
@@ -0,0 +1,43 @@
+Analog Devices AD5592R/AD5593R DAC/ADC device driver
+
+Required properties for the AD5592R:
+	- compatible: Must be "adi,ad5592r"
+	- reg: SPI chip select number for the device
+	- spi-max-frequency: Max SPI frequency to use (< 30000000)
+	- spi-cpol: The AD5592R requires inverse clock polarity (CPOL) mode
+
+Required properties for the AD5593R:
+	- compatible: Must be "adi,ad5593r"
+	- reg: I2C address of the device
+
+Required properties for all supported chips:
+	- channel-modes: An array of eight 8-bit values (one per channel)
+	  describing the mode of each channel. Macros specifying the valid values
+	  can be found in <dt-bindings/iio/adi,ad5592r.h>.
+	  The following values are currently supported:
+		* CH_MODE_UNUSED (the pin is pulled down)
+		* CH_MODE_DAC
+		* CH_MODE_ADC
+		* CH_MODE_GPIO_TRISTATE
+
+Example:
+
+	#include <dt-bindings/iio/adi,ad5592r.h>
+
+	ad5592r@0 {
+		compatible = "adi,ad5592r";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		spi-cpol;
+
+		channel-modes = /bits/ 8 <
+			CH_MODE_DAC
+			CH_MODE_ADC
+			CH_MODE_ADC
+			CH_MODE_UNUSED
+			CH_MODE_UNUSED
+			CH_MODE_UNUSED
+			CH_MODE_UNUSED
+			CH_MODE_UNUSED
+		>;
+	};
-- 
2.6.1
