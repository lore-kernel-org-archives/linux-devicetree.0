From: Julien CHAUVEAU <julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
Subject: [PATCH] ARM: dts: rockchip: add serial aliases for rk3066 and rk3188
Date: Thu, 30 Oct 2014 16:51:17 +0100
Message-ID: <1414684277-17248-1-git-send-email-julien.chauveau@neo-technologies.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Rockchip
	SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Julien CHAUVEAU <julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add aliases for UARTs on rk3066 and rk3188 in order to fix the numbering scheme.
This will keep the debug console on ttyS2 when UART 1 is disabled, for example.

Signed-off-by: Julien CHAUVEAU <julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 499468d..d8027c4 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -29,6 +29,10 @@
 		mshc0 = &emmc;
 		mshc1 = &mmc0;
 		mshc2 = &mmc1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
 		spi0 = &spi0;
 		spi1 = &spi1;
 	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
