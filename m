From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] ARM: orion5x: fix Makefile for linkstation-lschl.dtb
Date: Thu,  2 Feb 2017 12:38:33 +0100
Message-ID: <20170202113856.728043-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Roger Shimizu <rogershimizu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The rename of orion5x-lschl.dts needs to be reflected in the Makefile:

make[3]: *** No rule to make target 'arch/arm/boot/dts/orion5x-lschl.dtb', needed by '__build'.

Fixes: 6cfd3cd8d836 ("ARM: dts: orion5x-lschl: More consistent naming on linkstation series")
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/arm/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 10eec600cf6b..47208fc5a750 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -633,7 +633,7 @@ dtb-$(CONFIG_ARCH_ORION5X) += \
 	orion5x-lacie-ethernet-disk-mini-v2.dtb \
 	orion5x-linkstation-lsgl.dtb \
 	orion5x-linkstation-lswtgl.dtb \
-	orion5x-lschl.dtb \
+	orion5x-linkstation-lschl.dtb \
 	orion5x-lswsgl.dtb \
 	orion5x-maxtor-shared-storage-2.dtb \
 	orion5x-netgear-wnr854t.dtb \
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
