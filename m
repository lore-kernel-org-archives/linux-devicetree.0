From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v12 03/08] ARM: config: enable hi3xxx in multi_v7_defconfig
Date: Wed, 11 Dec 2013 15:54:52 +0800
Message-ID: <1386748497-11290-4-git-send-email-haojian.zhuang@gmail.com>
References: <1386748497-11290-1-git-send-email-haojian.zhuang@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386748497-11290-1-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Enable ARCH_HI3xxx in multi_v7_defconfig.

Signed-off-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4a5903e..7910d22 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -9,6 +9,7 @@ CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM_MOBILE=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_ARCH_HIGHBANK=y
+CONFIG_ARCH_HI3xxx=y
 CONFIG_ARCH_KEYSTONE=y
 CONFIG_ARCH_MXC=y
 CONFIG_MACH_IMX51_DT=y
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
