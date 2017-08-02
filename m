From: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Subject: [PATCH] ARM: dts: i.MX25: add ranges to tscadc
Date: Wed,  2 Aug 2017 22:06:11 +0200
Message-ID: <1501704371-28151-1-git-send-email-martin@kaiser.cx>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a ranges; line to the tscadc node. This creates a 1:1 mapping between
the addresses used by tscadc and those in its child nodes (adc, tsc).

Without such a mapping, the reg = ... lines in the tsc and adc nodes do
not create a resource. Probing the fsl-imx25-tcq and fsl-imx25-tsadc
drivers will then fail since there's no IORESOURCE_MEM.

Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
---
 arch/arm/boot/dts/imx25.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index 0d2f3a1..1e37bd3 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -297,6 +297,7 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 				status = "disabled";
+				ranges;
 
 				adc: adc@50030800 {
 					compatible = "fsl,imx25-gcq";
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
