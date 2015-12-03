From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 7/9] ARM: hisi: rename ARCH_HI3xxx to ARCH_HI36xx
Date: Thu, 3 Dec 2015 10:48:06 +0800
Message-ID: <1449110886-23828-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ARCH_HI3xxx just represents hi36xx soc family.

Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/Kconfig.debug              | 4 ++--
 arch/arm/boot/dts/Makefile          | 2 +-
 arch/arm/configs/hisi_defconfig     | 2 +-
 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/mach-hisi/Kconfig          | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 4d2ae2a..27d97c8 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -280,7 +280,7 @@ choice
 
 	config DEBUG_HI3620_UART
 		bool "Hisilicon HI3620 Debug UART"
-		depends on ARCH_HI3xxx
+		depends on ARCH_HI36xx
 		select DEBUG_UART_PL01X
 		help
 		  Say Y here if you want kernel low-level debugging support
@@ -288,7 +288,7 @@ choice
 
 	config DEBUG_HI3716_UART
 		bool "Hisilicon Hi3716 Debug UART"
-		depends on ARCH_HI3xxx
+		depends on ARCH_HI36xx
 		select DEBUG_UART_PL01X
 		help
 		  Say Y here if you want kernel low-level debugging support
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 39ad947..9a7ba0b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -135,7 +135,7 @@ dtb-$(CONFIG_ARCH_EXYNOS5) += \
 	exynos5800-peach-pi.dtb
 dtb-$(CONFIG_ARCH_HI3519) += \
 	hi3519-demb.dtb
-dtb-$(CONFIG_ARCH_HI3xxx) += \
+dtb-$(CONFIG_ARCH_HI36xx) += \
 	hi3620-hi4511.dtb
 dtb-$(CONFIG_ARCH_HIX5HD2) += \
 	hisi-x5hd2-dkb.dtb
diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 321d020..3162709 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -4,7 +4,7 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_LZMA=y
 CONFIG_ARCH_HISI=y
-CONFIG_ARCH_HI3xxx=y
+CONFIG_ARCH_HI36xx=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_CMDLINE_PARTITION=y
 CONFIG_ARCH_HIX5HD2=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 69a22fd..ddc28ce 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -38,7 +38,7 @@ CONFIG_MACH_BERLIN_BG2Q=y
 CONFIG_ARCH_DIGICOLOR=y
 CONFIG_ARCH_HIGHBANK=y
 CONFIG_ARCH_HISI=y
-CONFIG_ARCH_HI3xxx=y
+CONFIG_ARCH_HI36xx=y
 CONFIG_ARCH_HIX5HD2=y
 CONFIG_ARCH_HIP01=y
 CONFIG_ARCH_HIP04=y
diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index bc5b873..15f23ed 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -20,7 +20,7 @@ config ARCH_HI3519
 	help
 	  Support for Hisilicon Hi3519 Soc
 
-config ARCH_HI3xxx
+config ARCH_HI36xx
 	bool "Hisilicon Hi36xx family" if ARCH_MULTI_V7
 	select CACHE_L2X0
 	select HAVE_ARM_SCU if SMP
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
