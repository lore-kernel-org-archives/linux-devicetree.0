From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 7/8] ARM: mach-bcm: ARCH_BCM_MOBILE: remove one level of menu from Kconfig
Date: Tue, 28 Oct 2014 16:15:10 -0700
Message-ID: <1414538111-11668-8-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
 <1414538111-11668-1-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414538111-11668-1-git-send-email-sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
Cc: JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

remove menu "Broadcom Mobile SoC Selection"
This requires:
- selecting ARCH_BCM_MOBILE based on SoC selections
- fixup bcm_defconfig and multi_v7_defconfig to work with new menu levels.

Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/configs/bcm_defconfig      |    3 ++-
 arch/arm/configs/multi_v7_defconfig |    3 ++-
 arch/arm/mach-bcm/Kconfig           |   26 ++++++++++----------------
 3 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/arm/configs/bcm_defconfig b/arch/arm/configs/bcm_defconfig
index bc614f4..83a87e4 100644
--- a/arch/arm/configs/bcm_defconfig
+++ b/arch/arm/configs/bcm_defconfig
@@ -25,7 +25,8 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARCH_BCM=y
-CONFIG_ARCH_BCM_MOBILE=y
+CONFIG_ARCH_BCM_21664=y
+CONFIG_ARCH_BCM_281XX=y
 CONFIG_ARM_THUMBEE=y
 CONFIG_SMP=y
 CONFIG_PREEMPT=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f1dc7fc..6e0d7cb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -17,7 +17,8 @@ CONFIG_MACH_ARMADA_38X=y
 CONFIG_MACH_ARMADA_XP=y
 CONFIG_MACH_DOVE=y
 CONFIG_ARCH_BCM=y
-CONFIG_ARCH_BCM_MOBILE=y
+CONFIG_ARCH_BCM_21664=y
+CONFIG_ARCH_BCM_281XX=y
 CONFIG_ARCH_BCM_5301X=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 6e79696..cceb69f 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -51,8 +51,10 @@ config ARCH_BCM_5301X
 	  different SoC or with the older BCM47XX and BCM53XX based
 	  network SoC using a MIPS CPU, they are supported by arch/mips/bcm47xx
 
+comment "KONA architected SoCs"
+
 config ARCH_BCM_MOBILE
-	bool "Broadcom Mobile SoC Support" if ARCH_MULTI_V7
+	bool
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
@@ -61,16 +63,13 @@ config ARCH_BCM_MOBILE
 	select TICK_ONESHOT
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL
+	select ARCH_BCM_MOBILE_SMP if SMP
 	help
 	  This enables support for systems based on Broadcom mobile SoCs.
 
-if ARCH_BCM_MOBILE
-
-menu "Broadcom Mobile SoC Selection"
-
 config ARCH_BCM_281XX
 	bool "Broadcom BCM281XX SoC family"
-	default y
+	select ARCH_BCM_MOBILE
 	select HAVE_SMP
 	help
 	  Enable support for the BCM281XX family, which includes
@@ -79,7 +78,7 @@ config ARCH_BCM_281XX
 
 config ARCH_BCM_21664
 	bool "Broadcom BCM21664 SoC family"
-	default y
+	select ARCH_BCM_MOBILE
 	select HAVE_SMP
 	help
 	  Enable support for the BCM21664 family, which includes
@@ -87,19 +86,18 @@ config ARCH_BCM_21664
 
 config ARCH_BCM_MOBILE_L2_CACHE
 	bool "Broadcom mobile SoC level 2 cache support"
-	depends on (ARCH_BCM_281XX || ARCH_BCM_21664)
+	depends on ARCH_BCM_MOBILE
 	default y
 	select CACHE_L2X0
 	select ARCH_BCM_MOBILE_SMC
 
 config ARCH_BCM_MOBILE_SMC
 	bool
-	depends on ARCH_BCM_281XX || ARCH_BCM_21664
+	depends on ARCH_BCM_MOBILE
 
 config ARCH_BCM_MOBILE_SMP
-	bool "Broadcom mobile SoC SMP support"
-	depends on (ARCH_BCM_281XX || ARCH_BCM_21664) && SMP
-	default y
+	bool
+	depends on ARCH_BCM_MOBILE
 	select HAVE_ARM_SCU
 	select ARM_ERRATA_764369
 	help
@@ -107,10 +105,6 @@ config ARCH_BCM_MOBILE_SMP
 	  Provided as an option so SMP support for SoCs of this type
 	  can be disabled for an SMP-enabled kernel.
 
-endmenu
-
-endif
-
 comment "Other Architectures"
 
 config ARCH_BCM2835
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
