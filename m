From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 5/6] ARM: dts: imx35.dtsi: change the clock information for usb
Date: Wed, 16 Sep 2015 13:20:48 +0800
Message-ID: <1442380849-8500-6-git-send-email-peter.chen@freescale.com>
References: <1442380849-8500-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442380849-8500-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For imx35, it needs three clocks to let the controller work,
the old code is wrong, and the usbmisc does not include
clock handling code any more.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx35.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.dtsi
index e6540b5..0d86560 100644
--- a/arch/arm/boot/dts/imx35.dtsi
+++ b/arch/arm/boot/dts/imx35.dtsi
@@ -305,7 +305,9 @@
 				compatible = "fsl,imx35-usb", "fsl,imx27-usb";
 				reg = <0x53ff4000 0x0200>;
 				interrupts = <37>;
-				clocks = <&clks 73>;
+				need-three-clocks;
+				clocks = <&clks 9>, <&clks 73>, <&clks 28>;
+				clock-names = "ipg", "ahb", "per";
 				fsl,usbmisc = <&usbmisc 0>;
 				fsl,usbphy = <&usbphy0>;
 				status = "disabled";
@@ -315,7 +317,9 @@
 				compatible = "fsl,imx35-usb", "fsl,imx27-usb";
 				reg = <0x53ff4400 0x0200>;
 				interrupts = <35>;
-				clocks = <&clks 73>;
+				need-three-clocks;
+				clocks = <&clks 9>, <&clks 73>, <&clks 28>;
+				clock-names = "ipg", "ahb", "per";
 				fsl,usbmisc = <&usbmisc 1>;
 				fsl,usbphy = <&usbphy1>;
 				dr_mode = "host";
@@ -325,8 +329,6 @@
 			usbmisc: usbmisc@53ff4600 {
 				#index-cells = <1>;
 				compatible = "fsl,imx35-usbmisc";
-				clocks = <&clks 9>, <&clks 73>, <&clks 28>;
-				clock-names = "ipg", "ahb", "per";
 				reg = <0x53ff4600 0x00f>;
 			};
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
