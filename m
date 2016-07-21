From: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH 12/18] ARM: mvebu: a39x: add missing nodes describing USB2.0 and USB3.0
Date: Thu, 21 Jul 2016 14:44:09 +0200
Message-ID: <1469105055-25181-14-git-send-email-jaz@semihalf.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469105055-25181-1-git-send-email-jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The whole Armada 39x SoC family of processors has one USB2.0 and one
USB3.0 which all can be supported with existing drivers.

Signed-off-by: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/armada-39x.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
index 0749878..1225cd8 100644
--- a/arch/arm/boot/dts/armada-39x.dtsi
+++ b/arch/arm/boot/dts/armada-39x.dtsi
@@ -381,6 +381,14 @@
 				reg = <0x22000 0x1000>;
 			};
 
+			usb@58000 {
+				compatible = "marvell,orion-ehci";
+				reg = <0x58000 0x500>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gateclk 18>;
+				status = "disabled";
+			};
+
 			xor@60800 {
 				compatible = "marvell,armada-380-xor", "marvell,orion-xor";
 				reg = <0x60800 0x100
@@ -457,6 +465,14 @@
 				reg = <0xe4078 0x4>, <0xe4074 0x4>;
 				status = "okay";
 			};
+
+			usb3@f8000 {
+				compatible = "marvell,armada-380-xhci";
+				reg = <0xf8000 0x4000>,<0xfc000 0x4000>;
+				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gateclk 10>;
+				status = "disabled";
+			};
 		};
 
 		pcie-controller {
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
