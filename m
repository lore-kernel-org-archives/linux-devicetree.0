From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] ARM: dts: mvebu: Fix armada-385-turris-omnia stdout-path
Date: Sun, 27 Nov 2016 20:37:24 +0100
Message-ID: <1480275444-4220-1-git-send-email-afaerber@suse.de>
References: <71af60f5-b657-cab4-32a8-00a604fc656e@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <71af60f5-b657-cab4-32a8-00a604fc656e-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Michal Hrusecki <Michal.Hrusecky-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, =?UTF-8?q?Bed=C5=99icha=20Ko=C5=A1atu?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Specify the baudrate.

Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
Cc: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm/boot/dts/armada-385-turris-omnia.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts b/arch/arm/boot/dts/armada-385-turris-omnia.dts
index f53cb8b73610..2eff012287d4 100644
--- a/arch/arm/boot/dts/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
@@ -52,7 +52,7 @@
 	compatible = "cznic,turris-omnia", "marvell,armada385", "marvell,armada380";
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
