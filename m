From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/4] dt: document NXP LPC1850 ADC driver bindings
Date: Sun,  6 Mar 2016 12:13:13 +0100
Message-ID: <1457262795-20282-3-git-send-email-manabian@gmail.com>
References: <1457262795-20282-1-git-send-email-manabian@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457262795-20282-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/iio/adc/lpc1850-adc.txt     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt b/Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt
new file mode 100644
index 000000000000..0bcae5140bc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt
@@ -0,0 +1,21 @@
+NXP LPC1850 ADC bindings
+
+Required properties:
+- compatible: Should be "nxp,lpc1850-adc"
+- reg: Offset and length of the register set for the ADC device
+- interrupts: The interrupt number for the ADC device
+- clocks: The root clock of the ADC controller
+- vref-supply: The regulator supply ADC reference voltage
+- resets: phandle to reset controller and line specifier
+
+Example:
+
+adc0: adc@400e3000 {
+	compatible = "nxp,lpc1850-adc";
+	reg = <0x400e3000 0x1000>;
+	interrupts = <17>;
+	clocks = <&ccu1 CLK_APB3_ADC0>;
+	vref-supply = <&reg_vdda>;
+	resets = <&rgu 40>;
+	status = "disabled";
+};
-- 
1.8.0
