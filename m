From: <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH] ARM: at91/dt: Disable SPI on at91sam9x5ek to allow MCI1 to work.
Date: Thu, 16 Feb 2017 19:16:28 +0200
Message-ID: <1487265388-29390-1-git-send-email-cristian.birsan@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cristian Birsan <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Cristian Birsan <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

The A13 hardware line is shared by SPI and MCI1 controller.This patch
disables the SPI controller so that the MCI1 (the big MMC card slot) can
be used.

Signed-off-by: Cristian Birsan <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 arch/arm/boot/dts/at91sam9x5ek.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91sam9x5ek.dtsi b/arch/arm/boot/dts/at91sam9x5ek.dtsi
index 696b8ba..9d2bbc4 100644
--- a/arch/arm/boot/dts/at91sam9x5ek.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5ek.dtsi
@@ -116,7 +116,7 @@
 			};
 
 			spi0: spi@f0000000 {
-				status = "okay";
+				status = "disabled"; /* conflicts with mmc1 */
 				cs-gpios = <&pioA 14 0>, <0>, <0>, <0>;
 				m25p80@0 {
 					compatible = "atmel,at25df321a";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
