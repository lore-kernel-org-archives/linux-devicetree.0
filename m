From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v3 3/3] ARM: dts: add property for maximum ADC clock frequencies
Date: Sun, 22 Mar 2015 00:22:07 +0100
Message-ID: <1426980127-16686-4-git-send-email-stefan@agner.ch>
References: <1426980127-16686-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426980127-16686-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ADC clock frequency is limited depending on modes used. Add
device tree property which allow to set the mode used and the
maximum frequency ratings for the instance. These allows to
set the ADC clock to a frequency which is within specification
according to the actual mode used.

Acked-by: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/adc/vf610-adc.txt | 9 +++++++++
 arch/arm/boot/dts/vfxxx.dtsi                            | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
index 1a4a43d..3eb40e2 100644
--- a/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
@@ -11,6 +11,13 @@ Required properties:
 - clock-names: Must contain "adc", matching entry in the clocks property.
 - vref-supply: The regulator supply ADC reference voltage.
 
+Recommended properties:
+- fsl,adck-max-frequency: Maximum frequencies according to datasheets operating
+  requirements. Three values are required, depending on conversion mode:
+  - Frequency in normal mode (ADLPC=0, ADHSC=0)
+  - Frequency in high-speed mode (ADLPC=0, ADHSC=1)
+  - Frequency in low-power mode (ADLPC=1, ADHSC=0)
+
 Example:
 adc0: adc@4003b000 {
 	compatible = "fsl,vf610-adc";
@@ -18,5 +25,7 @@ adc0: adc@4003b000 {
 	interrupts = <0 53 0x04>;
 	clocks = <&clks VF610_CLK_ADC0>;
 	clock-names = "adc";
+	fsl,adck-max-frequency = <30000000>, <40000000>,
+				<20000000>;
 	vref-supply = <&reg_vcc_3v3_mcu>;
 };
diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index a29c7ce..c6609bd 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -189,6 +189,8 @@
 				clocks = <&clks VF610_CLK_ADC0>;
 				clock-names = "adc";
 				status = "disabled";
+				fsl,adck-max-frequency = <30000000>, <40000000>,
+							<20000000>;
 			};
 
 			wdoga5: wdog@4003e000 {
@@ -387,6 +389,8 @@
 				clocks = <&clks VF610_CLK_ADC1>;
 				clock-names = "adc";
 				status = "disabled";
+				fsl,adck-max-frequency = <30000000>, <40000000>,
+							<20000000>;
 			};
 
 			esdhc1: esdhc@400b2000 {
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
