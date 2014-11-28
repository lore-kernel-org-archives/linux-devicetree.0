From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] ARM: hip04: set ARCH_NR_GPIO to 128
Date: Fri, 28 Nov 2014 14:29:47 +0800
Message-ID: <1417156188-500-2-git-send-email-wangzhou.bry@gmail.com>
References: <1417156188-500-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417156188-500-1-git-send-email-wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Set ARCH_NR_GPIO for Hisilicon Soc Hip04, which has 4 GPIO
controllers with 32 GPIOs each.

Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/Kconfig                |    1 +
 arch/arm/configs/hisi_defconfig |    3 +++
 2 files changed, 4 insertions(+)

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
diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 1772505..130292b 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -41,6 +41,9 @@ CONFIG_SPI_PL022=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SYSFS=y
 CONFIG_DRM=y
 CONFIG_FB_SIMPLE=y
 CONFIG_USB=y
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
