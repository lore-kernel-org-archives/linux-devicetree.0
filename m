From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH] ARM: sun4i: fix a typo so that iteaduino-plus DTB builds
Date: Fri, 16 Oct 2015 10:17:37 +0200
Message-ID: <1444983457-27201-1-git-send-email-lkundrak@v3.sk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
---
 arch/arm/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 815bd3b..a0c439f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -582,7 +582,7 @@ dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-hackberry.dtb \
 	sun4i-a10-hyundai-a7hd.dtb \
 	sun4i-a10-inet97fv2.dtb \
-	sun4i-a10-itead-iteaduino-plus.dts \
+	sun4i-a10-itead-iteaduino-plus.dtb \
 	sun4i-a10-jesurun-q5.dtb \
 	sun4i-a10-marsboard.dtb \
 	sun4i-a10-mini-xplus.dtb \
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
