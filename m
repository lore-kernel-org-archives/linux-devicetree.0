From: =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: add driver for the ti-adc084s021 chip
Date: Wed,  3 May 2017 14:01:44 +0200
Message-ID: <1493812905-28904-2-git-send-email-marten.lindahl@axis.com>
References: <1493812905-28904-1-git-send-email-marten.lindahl@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493812905-28904-1-git-send-email-marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>

This adds support for the Texas Instruments ADC084S021 ADC chip.

Signed-off-by: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>
---
Changes in v3:
- No updates since v2

Changes in v2:
- Updated the 'Required properties' section
- Removed the 'Optional properties' section

 .../devicetree/bindings/iio/adc/ti-adc084s021.txt     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt b/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
new file mode 100644
index 0000000..4259e50
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
@@ -0,0 +1,19 @@
+* Texas Instruments' ADC084S021
+
+Required properties:
+ - compatible        : Must be "ti,adc084s021"
+ - reg               : SPI chip select number for the device
+ - vref-supply       : The regulator supply for ADC reference voltage
+ - spi-cpol          : Per spi-bus bindings
+ - spi-cpha          : Per spi-bus bindings
+ - spi-max-frequency : Per spi-bus bindings
+
+Example:
+adc@0 {
+	compatible = "ti,adc084s021";
+	reg = <0>;
+	vref-supply = <&adc_vref>;
+	spi-cpol;
+	spi-cpha;
+	spi-max-frequency = <16000000>;
+};
-- 
2.1.4
