From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 4/6] dt-bindings: iio: adc: mcp320x: Update for mcp3550/1/3
Date: Sat, 9 Sep 2017 20:32:41 +0200
Message-ID: <f5899af5ef548c618ac14950301f6bc8eff6e9ba.1504807204.git.lukas@wunner.de>
References: <cover.1504807204.git.lukas@wunner.de>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1504807204.git.lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Oskar Andero <oskar.andero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrea Galbusera <gizero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Manfred Schlaegl <manfred.schlaegl-RbZlAiThDcE@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Soeren Andersen <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All chips supported by this driver clock data out on the falling edge
and latch data in on the rising edge, hence SPI mode (0,0) or (1,1)
must be used.

Furthermore, none of the chips has an internal reference voltage
regulator, so an external supply is always required and needs to be
specified in the device tree lest the IIO "scale" in sysfs cannot be
calculated.

Document these requirements in the device tree binding, add compatible
strings for the newly supported mcp3550/1/3 and explain that SPI mode
(0,0) should be preferred for these chips.

Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
---
Changes since v1:
- Move support for continuous conversion mode to separate patch
  which is marked informational / not for merging. (Rob, Jonathan)

 Documentation/devicetree/bindings/iio/adc/mcp320x.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
index bcd3ac8e6e0c..7d64753df949 100644
--- a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
+++ b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
@@ -29,15 +29,29 @@ Required properties:
 				"microchip,mcp3204"
 				"microchip,mcp3208"
 				"microchip,mcp3301"
+				"microchip,mcp3550-50"
+				"microchip,mcp3550-60"
+				"microchip,mcp3551"
+				"microchip,mcp3553"
 
 			NOTE: The use of the compatibles with no vendor prefix
 			is deprecated and only listed because old DT use them.
 
+	- spi-cpha, spi-cpol (boolean):
+			Either SPI mode (0,0) or (1,1) must be used, so specify
+			none or both of spi-cpha, spi-cpol.  The MCP3550/1/3
+			is more efficient in mode (1,1) as only 3 instead of
+			4 bytes need to be read from the ADC, but not all SPI
+			masters support it.
+
+	- vref-supply:	Phandle to the external reference voltage supply.
+
 Examples:
 spi_controller {
 	mcp3x0x@0 {
 		compatible = "mcp3002";
 		reg = <0>;
 		spi-max-frequency = <1000000>;
+		vref-supply = <&vref_reg>;
 	};
 };
-- 
2.11.0
