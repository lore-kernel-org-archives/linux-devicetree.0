From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v12 08/08] ARM: hi3xxx: select GPIO in Kconfig
Date: Wed, 11 Dec 2013 15:54:57 +0800
Message-ID: <1386748497-11290-9-git-send-email-haojian.zhuang@gmail.com>
References: <1386748497-11290-1-git-send-email-haojian.zhuang@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386748497-11290-1-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Select GPIO in hi3xxx Kconfig.

Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-hi3xxx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-hi3xxx/Kconfig b/arch/arm/mach-hi3xxx/Kconfig
index 4007ecf..018ad67 100644
--- a/arch/arm/mach-hi3xxx/Kconfig
+++ b/arch/arm/mach-hi3xxx/Kconfig
@@ -3,6 +3,7 @@ config ARCH_HI3xxx
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_TIMER_SP804
+	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select CACHE_L2X0
 	select CLKSRC_OF
 	select GENERIC_CLOCKEVENTS
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
