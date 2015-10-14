From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 1/2] ARM: dts: imx27.dtsi: change the clock information for usb
Date: Wed, 14 Oct 2015 09:57:25 +0800
Message-ID: <1444787845-29933-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For imx27, it needs three clocks to let the controller work,
the old code is wrong, and usbmisc has not included clock handling
code any more. Without this patch, it will cause below data
abort when accessing usbmisc registers.

usbcore: registered new interface driver usb-storage
Unhandled fault: external abort on non-linefetch (0x008) at 0xf4424600
pgd = c0004000
[f4424600] *pgd=10000452(bad)
Internal error: : 8 [#1] PREEMPT ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.0-next-20150701-dirty #3089
Hardware name: Freescale i.MX27 (Device Tree Support)
task: c7832b60 ti: c783e000 task.ti: c783e000
PC is at usbmisc_imx27_init+0x4c/0xbc
LR is at usbmisc_imx27_init+0x40/0xbc
pc : [<c03cb5c0>]    lr : [<c03cb5b4>]    psr: 60000093
sp : c783fe08  ip : 00000000  fp : 00000000
r10: c0576434  r9 : 0000009c  r8 : c7a773a0
r7 : 01000000  r6 : 60000013  r5 : c7a776f0  r4 : c7a773f0
r3 : f4424600  r2 : 00000000  r1 : 00000001  r0 : 00000001
Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: a0004000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc783e190)
Stack: (0xc783fe08 to 0xc7840000)

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reported-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Tested-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> #v4.1+
---
 arch/arm/boot/dts/imx27.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
index feb9d34..f818ea4 100644
--- a/arch/arm/boot/dts/imx27.dtsi
+++ b/arch/arm/boot/dts/imx27.dtsi
@@ -486,7 +486,10 @@
 				compatible = "fsl,imx27-usb";
 				reg = <0x10024000 0x200>;
 				interrupts = <56>;
-				clocks = <&clks IMX27_CLK_USB_IPG_GATE>;
+				clocks = <&clks IMX27_CLK_USB_IPG_GATE>,
+					<&clks IMX27_CLK_USB_AHB_GATE>,
+					<&clks IMX27_CLK_USB_DIV>;
+				clock-names = "ipg", "ahb", "per";
 				fsl,usbmisc = <&usbmisc 0>;
 				status = "disabled";
 			};
@@ -495,7 +498,10 @@
 				compatible = "fsl,imx27-usb";
 				reg = <0x10024200 0x200>;
 				interrupts = <54>;
-				clocks = <&clks IMX27_CLK_USB_IPG_GATE>;
+				clocks = <&clks IMX27_CLK_USB_IPG_GATE>,
+					<&clks IMX27_CLK_USB_AHB_GATE>,
+					<&clks IMX27_CLK_USB_DIV>;
+				clock-names = "ipg", "ahb", "per";
 				fsl,usbmisc = <&usbmisc 1>;
 				dr_mode = "host";
 				status = "disabled";
@@ -505,7 +511,10 @@
 				compatible = "fsl,imx27-usb";
 				reg = <0x10024400 0x200>;
 				interrupts = <55>;
-				clocks = <&clks IMX27_CLK_USB_IPG_GATE>;
+				clocks = <&clks IMX27_CLK_USB_IPG_GATE>,
+					<&clks IMX27_CLK_USB_AHB_GATE>,
+					<&clks IMX27_CLK_USB_DIV>;
+				clock-names = "ipg", "ahb", "per";
 				fsl,usbmisc = <&usbmisc 2>;
 				dr_mode = "host";
 				status = "disabled";
@@ -515,7 +524,6 @@
 				#index-cells = <1>;
 				compatible = "fsl,imx27-usbmisc";
 				reg = <0x10024600 0x200>;
-				clocks = <&clks IMX27_CLK_USB_AHB_GATE>;
 			};
 
 			sahara2: sahara@10025000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
