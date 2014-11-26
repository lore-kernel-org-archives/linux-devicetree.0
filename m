From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: hip04: set ARCH_NR_GPIO to 128
Date: Wed, 26 Nov 2014 14:43:31 +0800
Message-ID: <1416984212-619-2-git-send-email-wangzhou.bry@gmail.com>
References: <1416984212-619-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416984212-619-1-git-send-email-wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Set ARCH_NR_GPIO for Hisilicon Soc Hip04, which has 4 GPIO
controllers with 32 GPIOs each.

Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/Kconfig           |    1 +
 arch/arm/mach-hisi/Kconfig |    1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 89c4b5c..26aae1e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1509,6 +1509,7 @@ config ARCH_NR_GPIO
 	default 352 if ARCH_VT8500
 	default 288 if ARCH_ROCKCHIP
 	default 264 if MACH_H4700
+	default 128 if ARCH_HIP04
 	default 0
 	help
 	  Maximum number of GPIOs in the system.
diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index cd19433..ed4542a 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -28,6 +28,7 @@ config ARCH_HIP04
 	select HAVE_ARM_ARCH_TIMER
 	select MCPM if SMP
 	select MCPM_QUAD_CLUSTER if SMP
+	select GPIO_DWAPB
 	help
 	  Support for Hisilicon HiP04 SoC family
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
