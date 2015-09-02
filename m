From: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: [PATCH] ARM: dts: Fix Makefile target for
 sun4i-a10-itead-iteaduino-plus
Date: Wed, 2 Sep 2015 16:18:12 -0400
Message-ID: <20150902201812.GC464@hansolo.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Bcc: 
Subject: [PATCH] ARM: dts: Fix Makefile target for sun4i-a10-itead-iteaduino-plus
Reply-To: 

ommit 79ae3e66f8d (ARM: dts: sun4i: Add Iteaduino Plus A10) added a new
make target for the sun4i-a10-itead-iteaduino-plus dts file, but mistakenly
used .dts instead of the correct .dtb suffix.  This resulted in a build error
like:

	scripts/Makefile.dtbinst:42: target 'sun4i-a10-itead-iteaduino-plus.dts' doesn't match the target pattern

when doing a make dtbs_install.

Fix it to use the proper file name.

Signed-off-by: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
---
 arch/arm/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 233159d2eaab..bb8fa023d574 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -578,7 +578,7 @@ dtb-$(CONFIG_MACH_SUN4I) += \
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
