From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] dts: add support for MMC on socfpga boards
Date: Wed, 5 Mar 2014 17:23:50 +0100
Message-ID: <20140305162350.GA3674@pollux.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Add DTS binding for MMC on socfpga boards. Tested on Sockit.
    
Signed-off-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 537f1a5..cad7526 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -521,6 +521,23 @@
 			reg-io-width = <4>;
 		};
 
+		mmc: dwmmc0@ff704000 {
+			compatible = "snps,dw-mshc";
+			reg = <0xff704000 0x1000>;
+			interrupts = <0 139 4>;
+			clock-frequency = <12500000>; /*12.5 MHz*/
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-slots = <1>;
+			supports-highspeed;
+			broken-cd;
+			fifo-depth = <0x400>;
+			slot@0 {
+				reg = <0>;
+				bus-width = <4>;
+			};
+		};
+
 		rstmgr@ffd05000 {
 			compatible = "altr,rst-mgr";
 			reg = <0xffd05000 0x1000>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
