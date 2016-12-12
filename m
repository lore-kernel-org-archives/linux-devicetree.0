From: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH resend] ARM: dts: sun8i: Support DTB build for NanoPi M1
Date: Tue, 13 Dec 2016 08:18:15 +0900
Message-ID: <20161212231815.6114-1-woogyom.kim@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The commit 10efbf5f1633 ("ARM: dts: sun8i: Add dts file for NanoPi M1 SBC")
introduced NanoPi M1 board but it's missing in Allwinner H3 DTB build.

Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index cccdbcb..359041f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -845,6 +845,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a83t-allwinner-h8homlet-v2.dtb \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-h3-bananapi-m2-plus.dtb \
+	sun8i-h3-nanopi-m1.dtb	\
 	sun8i-h3-nanopi-neo.dtb \
 	sun8i-h3-orangepi-2.dtb \
 	sun8i-h3-orangepi-lite.dtb \
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
