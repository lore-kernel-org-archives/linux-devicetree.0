From: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 3/8] ARM: dts: imx: imx7d add iomuxc lpsr device node
Date: Fri, 18 Sep 2015 11:29:53 -0500
Message-ID: <1442593798-11501-3-git-send-email-aalonso@freescale.com>
References: <1442593798-11501-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442593798-11501-1-git-send-email-aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org, nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree node to support iomuxc-lpsr controller, iput-sel phandle
allows to get input select register base address which is shared from
iomuxc controller.

Signed-off-by: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes for V2: Resend
Changes for V3: Add phandle to get input select register base address
Changes for V4: Resend

 arch/arm/boot/dts/imx7d.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 15c2193..0cd7033 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -446,6 +446,12 @@
 				status = "disabled";
 			};
 
+			iomuxc_lpsr: iomuxc-lpsr@302c0000 {
+				compatible = "fsl,imx7d-iomuxc-lpsr";
+				reg = <0x302c0000 0x10000>;
+				input-sel = <&iomuxc>;
+			};
+
 			gpt1: gpt@302d0000 {
 				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
 				reg = <0x302d0000 0x10000>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
