From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: document Rockchip saradc
Date: Wed, 09 Jul 2014 01:26:46 +0200
Message-ID: <3591595.sBj6Zqo42A@diego>
References: <2959154.xc8BQActsn@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2959154.xc8BQActsn@diego>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?utf-8?B?ZWRkaWUo6JSh5p6rKQ==?= <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This add the necessary binding documentation for the saradc found in all recent
processors from Rockchip.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../bindings/iio/adc/rockchip-saradc.txt           | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
new file mode 100644
index 0000000..603ac9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
@@ -0,0 +1,28 @@
+Rockhip Successive Approximation Register (SAR) A/D Converter bindings
+
+Required properties:
+- compatible: Should be "rockchip,saradc"
+- reg: physical base address of the controller and length of memory mapped
+       region.
+- interrupts: The interrupt number to the cpu. The interrupt specifier format
+              depends on the interrupt controller.
+- clocks: Must contain an entry for each entry in clock-names.
+- clock-names: Shall be "saradc" for the converter-clock, and "apb_pclk" for
+               the peripheral clock.
+- vref-supply: The regulator supply ADC refrence voltage.
+- #io-channel-cells: Should be 1, see ../iio-bindings.txt
+
+Optional properties :
+- clock-frequency : converter frequency in Hz. If omitted, 1MHz is used.
+
+Example:
+	saradc: saradc@2006c000 {
+		compatible = "rockchip,saradc";
+		reg = <0x2006c000 0x100>;
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
+		clock-names = "saradc", "apb_pclk";
+		#io-channel-cells = <1>;
+		vref-supply = <&vcc18>;
+		clock-frequency = <1000000>;
+	};
-- 
1.9.0
