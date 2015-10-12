From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 1/3] Documentation: ad5064: Added devicetree bindings documentation
Date: Mon, 12 Oct 2015 13:50:32 +0200
Message-ID: <1444650634-12025-1-git-send-email-paul.cercueil@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michael Hennerich <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/iio/dac/ad5064.txt         | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/ad5064.txt

 v2: No change in this patch

diff --git a/Documentation/devicetree/bindings/iio/dac/ad5064.txt b/Documentation/devicetree/bindings/iio/dac/ad5064.txt
new file mode 100644
index 0000000..fa2d328
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/ad5064.txt
@@ -0,0 +1,48 @@
+Analog Devices AD5064 DAC device driver
+
+Required properties:
+	- compatible: Must be one of:
+		* "adi,ad5024"
+		* "adi,ad5025"
+		* "adi,ad5044"
+		* "adi,ad5045"
+		* "adi,ad5064"
+		* "adi,ad5064-1"
+		* "adi,ad5065"
+		* "adi,ad5628-1"
+		* "adi,ad5628-2"
+		* "adi,ad5648-1"
+		* "adi,ad5648-2"
+		* "adi,ad5666-1"
+		* "adi,ad5666-2"
+		* "adi,ad5668-1"
+		* "adi,ad5668-2"
+		* "adi,ad5668-3"
+	- reg: SPI chip select number for the device
+	- spi-max-frequency: Max SPI frequency to use (< 30000000)
+	- vrefA-supply, vrefB-supply: phandles to external reference voltage
+	  supplies for channels 0 and 1 respectively.
+	  This property must be present for ad5024, ad5025, ad5044, ad5045,
+	  ad5064, ad5065.
+	- vrefC-supply, vrefD-supply: phandles to external reference voltage
+	  supplies for channels 2 and 3 respectively.
+	  This property must be present for ad5024, ad5044, ad5064.
+
+Optional properties:
+	- vref-supply: phandle to the external reference voltage supply.
+	  This should only be set if there is an external reference voltage
+	  connected to the vref or vref[A-D] pins.
+	  If the property is not set, the internal reference voltage supply
+	  is used if present.
+	  This property can be used with ad5064-1, ad5628-1, ad5628-2, ad5648-1,
+	  ad5648-2, ad5666-1, ad5666-2, ad5668-1, ad5668-2, ad5668-3.
+
+Example:
+
+		ad5668-2@4 {
+			compatible = "adi,ad5668-2";
+			reg = <4>;
+			spi-max-frequency = <10000000>;
+			adi,use-external-reference;
+			vref-supply = <&vref_supply>;
+		};
-- 
2.5.3
