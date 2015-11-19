From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] ARM: dts: vfxxx: Fix dspi[01] spi-num-chipselects.
Date: Wed, 18 Nov 2015 22:54:39 -0500
Message-ID: <1447905280-5172-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Per the Vybrid Reference Manual (section 3.8.6.1), dspi0 has 6 chip
select signals associated with it, while dspi1 has only 4.

Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
---
 arch/arm/boot/dts/vfxxx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 6736bae..1cca43a 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -158,7 +158,7 @@
 				interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks VF610_CLK_DSPI0>;
 				clock-names = "dspi";
-				spi-num-chipselects = <5>;
+				spi-num-chipselects = <6>;
 				status = "disabled";
 			};
 
@@ -170,7 +170,7 @@
 				interrupts = <68 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks VF610_CLK_DSPI1>;
 				clock-names = "dspi";
-				spi-num-chipselects = <5>;
+				spi-num-chipselects = <4>;
 				status = "disabled";
 			};
 
-- 
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
