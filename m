From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] devicetree: ad5064: Added devicetree bindings documentation
Date: Wed, 12 Feb 2014 13:01:58 +0100
Message-ID: <1392206518-1457-3-git-send-email-paul.cercueil@analog.com>
References: <1392206518-1457-1-git-send-email-paul.cercueil@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392206518-1457-1-git-send-email-paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/iio/dac/ad5064.txt         |   49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/ad5064.txt

diff --git a/Documentation/devicetree/bindings/iio/dac/ad5064.txt b/Documentation/devicetree/bindings/iio/dac/ad5064.txt
new file mode 100644
index 0000000..e5997b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/ad5064.txt
@@ -0,0 +1,49 @@
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
+	- adi,use-external-reference: If set, the external reference voltage
+	  supply is used. This should only be set if there is an external
+	  reference voltage connected to the vref or vref[A-D] pins.
+	  If the property is not set, the internal reference voltage supply
+	  is used if present, or an error is issued by the driver.
+	- vref-supply: phandle to the external reference voltage supply.
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
1.7.10.4
