From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 11/12] ARM: imx6: change default burst size for USB
Date: Thu, 19 Mar 2015 09:19:22 +0800
Message-ID: <1426727963-32280-12-git-send-email-peter.chen@freescale.com>
References: <1426727963-32280-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426727963-32280-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It can improve the USB performance when choosing larger
burst size at some systems (bus size is larger), there is
no side effect if this burst size is larger than bus size.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 8 ++++++++
 arch/arm/boot/dts/imx6sl.dtsi  | 6 ++++++
 arch/arm/boot/dts/imx6sx.dtsi  | 6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 2430cc9..4446218 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -836,6 +836,8 @@
 				fsl,usbphy = <&usbphy1>;
 				fsl,usbmisc = <&usbmisc 0>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
@@ -847,6 +849,8 @@
 				fsl,usbphy = <&usbphy2>;
 				fsl,usbmisc = <&usbmisc 1>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
@@ -857,6 +861,8 @@
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 				fsl,usbmisc = <&usbmisc 2>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
@@ -867,6 +873,8 @@
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 				fsl,usbmisc = <&usbmisc 3>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 9f283cc..9117c4c 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -681,6 +681,8 @@
 				fsl,usbphy = <&usbphy1>;
 				fsl,usbmisc = <&usbmisc 0>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
@@ -692,6 +694,8 @@
 				fsl,usbphy = <&usbphy2>;
 				fsl,usbmisc = <&usbmisc 1>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
@@ -702,6 +706,8 @@
 				clocks = <&clks IMX6SL_CLK_USBOH3>;
 				fsl,usbmisc = <&usbmisc 2>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 0cdfa01..464cc3a 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -743,6 +743,8 @@
 				fsl,usbmisc = <&usbmisc 0>;
 				fsl,anatop = <&anatop>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
@@ -754,6 +756,8 @@
 				fsl,usbphy = <&usbphy2>;
 				fsl,usbmisc = <&usbmisc 1>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
@@ -766,6 +770,8 @@
 				phy_type = "hsic";
 				fsl,anatop = <&anatop>;
 				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
 				status = "disabled";
 			};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
