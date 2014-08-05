From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: add thermal sensor support for i.mx6sl
Date: Tue, 5 Aug 2014 17:34:52 +0800
Message-ID: <1407231292-11007-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add thermal sensor support for i.MX6SL.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6sl.dtsi |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index c75800c..505da9e 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -529,6 +529,14 @@
 				};
 			};
 
+			tempmon: tempmon {
+				compatible = "fsl,imx6q-tempmon";
+				interrupts = <0 49 IRQ_TYPE_LEVEL_HIGH>;
+				fsl,tempmon = <&anatop>;
+				fsl,tempmon-data = <&ocotp>;
+				clocks = <&clks IMX6SL_CLK_PLL3_USB_OTG>;
+			};
+
 			usbphy1: usbphy@020c9000 {
 				compatible = "fsl,imx6sl-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
@@ -784,7 +792,7 @@
 			};
 
 			ocotp: ocotp@021bc000 {
-				compatible = "fsl,imx6sl-ocotp";
+				compatible = "fsl,imx6sl-ocotp", "syscon";
 				reg = <0x021bc000 0x4000>;
 			};
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
