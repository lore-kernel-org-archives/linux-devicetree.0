From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 4/4] dt: document NXP LPC1850 DAC driver bindings
Date: Sat, 12 Mar 2016 13:30:17 +0100
Message-ID: <1457785817-32328-5-git-send-email-manabian@gmail.com>
References: <1457785817-32328-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457785817-32328-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/iio/dac/lpc1850-dac.txt      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt

diff --git a/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt b/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
new file mode 100644
index 000000000000..7d6647d4af5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
@@ -0,0 +1,20 @@
+NXP LPC1850 DAC bindings
+
+Required properties:
+- compatible: Should be "nxp,lpc1850-dac"
+- reg: Offset and length of the register set for the ADC device
+- interrupts: The interrupt number for the ADC device
+- clocks: The root clock of the ADC controller
+- vref-supply: The regulator supply ADC reference voltage
+- resets: phandle to reset controller and line specifier
+
+Example:
+dac: dac@400e1000 {
+	compatible = "nxp,lpc1850-dac";
+	reg = <0x400e1000 0x1000>;
+	interrupts = <0>;
+	clocks = <&ccu1 CLK_APB3_DAC>;
+	vref-supply = <&reg_vdda>;
+	resets = <&rgu 42>;
+	status = "disabled";
+};
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
