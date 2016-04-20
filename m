From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: dts: lpc32xx: disabled ssp0/spi1 & ssp1/spi2 by default
Date: Wed, 20 Apr 2016 09:21:00 -0400
Message-ID: <1461158460-2946-4-git-send-email-slemieux.tyco@gmail.com>
References: <1461158460-2946-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461158460-2946-1-git-send-email-slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>

The SSP0/SPI1 and SSP1/SPI2 shared pinout and should be disable by default.

Board specific dts should enable them, as needed.

Signed-off-by: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 1b2f351..73c4746 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -162,32 +162,44 @@
 			compatible = "simple-bus";
 			ranges = <0x20000000 0x20000000 0x30000000>;
 
+			/*
+			 * ssp0 and spi1 are shared pins;
+			 * enable one in your board dts, as needed.
+			 */
 			ssp0: ssp@20084000 {
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x20084000 0x1000>;
 				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk LPC32XX_CLK_SSP0>;
 				clock-names = "apb_pclk";
+				status = "disabled";
 			};
 
 			spi1: spi@20088000 {
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20088000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_SPI1>;
+				status = "disabled";
 			};
 
+			/*
+			 * ssp1 and spi2 are shared pins;
+			 * enable one in your board dts, as needed.
+			 */
 			ssp1: ssp@2008c000 {
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x2008c000 0x1000>;
 				interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk LPC32XX_CLK_SSP1>;
 				clock-names = "apb_pclk";
+				status = "disabled";
 			};
 
 			spi2: spi@20090000 {
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20090000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_SPI2>;
+				status = "disabled";
 			};
 
 			i2s0: i2s@20094000 {
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
