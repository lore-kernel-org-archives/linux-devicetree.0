From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/4] Documentation: dt-bindings: add the Amlogic Meson SAR ADC documentation
Date: Wed, 11 Jan 2017 18:43:31 +0100
Message-ID: <20170111174334.24343-2-martin.blumenstingl@googlemail.com>
References: <20170111174334.24343-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170111174334.24343-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the devicetree binding documentation for the SAR ADC found in
Amlogic Meson SoCs.
Currently only the GXBB, GXL and GXM SoCs are supported.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../bindings/iio/adc/amlogic,meson-saradc.txt      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
new file mode 100644
index 000000000000..9a0bec7afc63
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
@@ -0,0 +1,31 @@
+* Amlogic Meson SAR (Successive Approximation Register) A/D converter
+
+Required properties:
+- compatible:	depending on the SoC this should be one of:
+			- "amlogic,meson-gxbb-saradc" for GXBB
+			- "amlogic,meson-gxl-saradc" for GXL and GXM
+		along with the generic "amlogic,meson-saradc"
+- reg:		the physical base address and length of the registers
+- clocks:	phandle and clock identifier (see clock-names)
+- clock-names:	mandatory clocks:
+			- "clkin" for the reference clock (typically XTAL)
+			- "core" for the SAR ADC core clock
+		optional clocks:
+			- "sana" for the analog clock
+			- "adc_clk" for the ADC (sampling) clock
+			- "adc_sel" for the ADC (sampling) clock mux
+- vref-supply:	the regulator supply for the ADC reference voltage
+- #io-channel-cells: must be 1, see ../iio-bindings.txt
+
+Example:
+	saradc: adc@8680 {
+		compatible = "amlogic,meson-gxl-saradc", "amlogic,meson-saradc";
+		#io-channel-cells = <1>;
+		reg = <0x0 0x8680 0x0 0x34>;
+		clocks = <&xtal>,
+			 <&clkc CLKID_SAR_ADC>,
+			 <&clkc CLKID_SANA>,
+			 <&clkc CLKID_SAR_ADC_CLK>,
+			 <&clkc CLKID_SAR_ADC_SEL>;
+		clock-names = "clkin", "core", "sana", "adc_clk", "adc_sel";
+	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
