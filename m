From: Tomas Novotny <tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 3/5] Documentation: dt: iio: add mcp4725/6 dac device binding
Date: Tue, 18 Oct 2016 19:43:07 +0200
Message-ID: <1476812589-18333-4-git-send-email-tomas.novotny@tbs-biometrics.com>
References: <1476812589-18333-1-git-send-email-tomas.novotny@tbs-biometrics.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476812589-18333-1-git-send-email-tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>

Signed-off-by: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/iio/dac/mcp4725.txt        | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/mcp4725.txt

diff --git a/Documentation/devicetree/bindings/iio/dac/mcp4725.txt b/Documentation/devicetree/bindings/iio/dac/mcp4725.txt
new file mode 100644
index 0000000..1bc6c09
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/mcp4725.txt
@@ -0,0 +1,35 @@
+Microchip mcp4725 and mcp4726 DAC device driver
+
+Required properties:
+	- compatible: Must be "microchip,mcp4725" or "microchip,mcp4726"
+	- reg: Should contain the DAC I2C address
+	- vdd-supply: Phandle to the Vdd power supply. This supply is used as a
+	  voltage reference on mcp4725. It is used as a voltage reference on
+	  mcp4726 if there is no vref-supply specified.
+
+Optional properties (valid only for mcp4726):
+	- vref-supply: Optional phandle to the Vref power supply. Vref pin is
+	  used as a voltage reference when this supply is specified.
+	- microchip,vref-buffered: Boolean to enable buffering of the external
+	  Vref pin. This boolean is not valid without the vref-supply. Quoting
+	  the datasheet: This is offered in cases where the reference voltage
+	  does not have the current capability not to drop its voltage when
+	  connected to the internal resistor ladder circuit.
+
+Examples:
+
+	/* simple mcp4725 */
+	mcp4725@60 {
+		compatible = "microchip,mcp4725";
+		reg = <0x60>;
+		vdd-supply = <&vdac_vdd>;
+	};
+
+	/* mcp4726 with the buffered external reference voltage */
+	mcp4726@60 {
+		compatible = "microchip,mcp4726";
+		reg = <0x60>;
+		vdd-supply = <&vdac_vdd>;
+		vref-supply = <&vdac_vref>;
+		microchip,vref-buffered;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
