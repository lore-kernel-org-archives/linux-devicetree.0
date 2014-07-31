From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 4/5] ARM: dts: Fix the sort ordering of EHCI and HSIC in rk3288.dtsi
Date: Thu, 31 Jul 2014 15:49:35 -0700
Message-ID: <1406846976-23127-4-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The EHCI and HSIC device tree nodes were added in the wrong place.
Fix them.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v4:
- Based on the proper patch

Changes in v3:
- EHCI and HSIC move new for version 3.

 arch/arm/boot/dts/rk3288.dtsi | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 9713054..49c99f2 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -156,6 +156,17 @@
 		status = "disabled";
 	};
 
+	usb_host0_ehci: usb@ff500000 {
+		compatible = "generic-ehci";
+		reg = <0xff500000 0x100>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_USBHOST0>;
+		clock-names = "usbhost";
+		status = "disabled";
+	};
+
+	/* NOTE: ohci@ff520000 doesn't actually work on hardware */
+
 	usb_host1: usb@ff540000 {
 		compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
 				"snps,dwc2";
@@ -176,6 +187,15 @@
 		status = "disabled";
 	};
 
+	usb_hsic: usb@ff5c0000 {
+		compatible = "generic-ehci";
+		reg = <0xff5c0000 0x100>;
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HSIC>;
+		clock-names = "usbhost";
+		status = "disabled";
+	};
+
 	uart2: serial@ff690000 {
 		compatible = "rockchip,rk3288-uart", "snps,dw-apb-uart";
 		reg = <0xff690000 0x100>;
@@ -270,27 +290,6 @@
 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 		status = "disabled";
 	};
-
-	usb_host0_ehci: usb@ff500000 {
-		compatible = "generic-ehci";
-		reg = <0xff500000 0x100>;
-		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_USBHOST0>;
-		clock-names = "usbhost";
-		status = "disabled";
-	};
-
-	/* NOTE: ohci@ff520000 doesn't actually work on hardware */
-
-	usb_hsic: usb@ff5c0000 {
-		compatible = "generic-ehci";
-		reg = <0xff5c0000 0x100>;
-		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_HSIC>;
-		clock-names = "usbhost";
-		status = "disabled";
-	};
-
 	gic: interrupt-controller@ffc01000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
-- 
2.0.0.526.g5318336

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
