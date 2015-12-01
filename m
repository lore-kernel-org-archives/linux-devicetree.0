From: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 3/4] ARM: dts: imx7d.dtsi: add ADC support
Date: Tue, 1 Dec 2015 16:22:29 +0800
Message-ID: <1448958150-25579-4-git-send-email-haibo.chen@freescale.com>
References: <1448958150-25579-1-git-send-email-haibo.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448958150-25579-1-git-send-email-haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add imx7d ADC support.

Signed-off-by: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx7d.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index ebc053a..aa0624d 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -583,6 +583,24 @@
 			reg = <0x30400000 0x400000>;
 			ranges;
 
+			adc1: adc@30610000 {
+				compatible = "fsl,imx7d-adc";
+				reg = <0x30610000 0x10000>;
+				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_ADC_ROOT_CLK>;
+				clock-names = "adc";
+				status = "disabled";
+			};
+
+			adc2: adc@30620000 {
+				compatible = "fsl,imx7d-adc";
+				reg = <0x30620000 0x10000>;
+				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_ADC_ROOT_CLK>;
+				clock-names = "adc";
+				status = "disabled";
+			};
+
 			pwm1: pwm@30660000 {
 				compatible = "fsl,imx7d-pwm", "fsl,imx27-pwm";
 				reg = <0x30660000 0x10000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
