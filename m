From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 05/10] ARM: imx6: set ahb-burst-config as 0 for USB
Date: Wed, 29 Jul 2015 10:42:09 +0800
Message-ID: <1438137734-27311-6-git-send-email-peter.chen@freescale.com>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438137734-27311-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

After setting ahb burst configuration as 0, we can increase tx/rx
burst size, it will improve the USB performance

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 4 ++++
 arch/arm/boot/dts/imx6sl.dtsi  | 3 +++
 arch/arm/boot/dts/imx6sx.dtsi  | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e6d1359..42d62b0 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -853,6 +853,7 @@
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 				fsl,usbphy = <&usbphy1>;
 				fsl,usbmisc = <&usbmisc 0>;
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
@@ -864,6 +865,7 @@
 				fsl,usbphy = <&usbphy2>;
 				fsl,usbmisc = <&usbmisc 1>;
 				dr_mode = "host";
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
@@ -874,6 +876,7 @@
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 				fsl,usbmisc = <&usbmisc 2>;
 				dr_mode = "host";
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
@@ -884,6 +887,7 @@
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 				fsl,usbmisc = <&usbmisc 3>;
 				dr_mode = "host";
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index a78e715..066fac9 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -688,6 +688,7 @@
 				clocks = <&clks IMX6SL_CLK_USBOH3>;
 				fsl,usbphy = <&usbphy1>;
 				fsl,usbmisc = <&usbmisc 0>;
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
@@ -698,6 +699,7 @@
 				clocks = <&clks IMX6SL_CLK_USBOH3>;
 				fsl,usbphy = <&usbphy2>;
 				fsl,usbmisc = <&usbmisc 1>;
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
@@ -708,6 +710,7 @@
 				clocks = <&clks IMX6SL_CLK_USBOH3>;
 				fsl,usbmisc = <&usbmisc 2>;
 				dr_mode = "host";
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 708175d..3656a1d 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -746,6 +746,7 @@
 				fsl,usbphy = <&usbphy1>;
 				fsl,usbmisc = <&usbmisc 0>;
 				fsl,anatop = <&anatop>;
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
@@ -756,6 +757,7 @@
 				clocks = <&clks IMX6SX_CLK_USBOH3>;
 				fsl,usbphy = <&usbphy2>;
 				fsl,usbmisc = <&usbmisc 1>;
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
@@ -768,6 +770,7 @@
 				phy_type = "hsic";
 				fsl,anatop = <&anatop>;
 				dr_mode = "host";
+				ahb-burst-config = <0x0>;
 				status = "disabled";
 			};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
