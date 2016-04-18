From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: lpc32xx: set default clock rate of HCLK PLL
Date: Mon, 18 Apr 2016 07:12:00 +0300
Message-ID: <1460952720-6638-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Probably most of NXP LPC32xx boards have 13MHz main oscillator and
therefore for HCLK PLL and ARM core clock rate default hardware
setting is 16 * 13MHz = 208MHz, however a user may vary HCLK PLL/ARM
core rate from 156MHz to about 266MHz for 13MHz clock source.

The change explicitly defines HCLK PLL output rate to default 208MHz
to overwrite any settings done by a bootloader, if needed it can be
redefined in a board DTS file.

Acked-by: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
The change was discussed on linux-clk mailing list, from that
times I grab Sylvain's acked-by tag:

  http://www.spinics.net/lists/devicetree/msg116863.html

 arch/arm/boot/dts/lpc32xx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index c58d8da..d7b84cd 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -294,6 +294,9 @@
 
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
+
+					assigned-clocks = <&clk LPC32XX_CLK_HCLK_PLL>;
+					assigned-clock-rates = <208000000>;
 				};
 			};
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
