From: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] apf27dev: add max1027 in the dts
Date: Sat, 30 Aug 2014 15:22:12 +0200
Message-ID: <1409404932-12532-1-git-send-email-tremyfr@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Signed-off-by: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/imx27-apf27dev.dts |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx27-apf27dev.dts b/arch/arm/boot/dts/imx27-apf27dev.dts
index b982309..25b9ecd 100644
--- a/arch/arm/boot/dts/imx27-apf27dev.dts
+++ b/arch/arm/boot/dts/imx27-apf27dev.dts
@@ -82,6 +82,19 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_cspi1 &pinctrl_cspi1_cs>;
 	status = "okay";
+
+	adc@0 {
+		compatible = "maxim,max1027";
+		reg = <0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_max1027>;
+		/* SPI mode = 0 */
+		spi-cpol = <0>;
+		spi-cpha = <0>;
+		spi-max-frequency = <10000000>;
+	};
 };
 
 &cspi2 {
@@ -230,6 +243,13 @@
 		pinctrl_sdhc2_cd: sdhc2cdgrp {
 			fsl,pins = <MX27_PAD_TOUT__GPIO3_14 0x0>;
 		};
+
+		pinctrl_max1027: max1027 {
+			 fsl,pins = <
+				 MX27_PAD_UART1_CTS__GPIO5_14 0
+				 MX27_PAD_UART1_RTS__GPIO5_15 0
+			>;
+		};
 	};
 };
 
-- 
1.7.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
