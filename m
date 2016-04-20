From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/3] ARM: dts: lpc32xx: add clock properties to spi nodes
Date: Wed, 20 Apr 2016 09:20:58 -0400
Message-ID: <1461158460-2946-2-git-send-email-slemieux.tyco@gmail.com>
References: <1461158460-2946-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461158460-2946-1-git-send-email-slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>

The change adds clock properties to spi peripheral devices,
clock ids are taken from dt-bindings/clock/lpc32xx-clock.h

Signed-off-by: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index d7b84cd..1b2f351 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -173,6 +173,7 @@
 			spi1: spi@20088000 {
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20088000 0x1000>;
+				clocks = <&clk LPC32XX_CLK_SPI1>;
 			};
 
 			ssp1: ssp@2008c000 {
@@ -186,6 +187,7 @@
 			spi2: spi@20090000 {
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20090000 0x1000>;
+				clocks = <&clk LPC32XX_CLK_SPI2>;
 			};
 
 			i2s0: i2s@20094000 {
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
