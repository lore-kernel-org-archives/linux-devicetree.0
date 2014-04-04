From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] ARM: configs: enable SMP in bcm_defconfig
Date: Thu,  3 Apr 2014 21:18:09 -0500
Message-ID: <1396577891-2713-4-git-send-email-elder@linaro.org>
References: <1396577891-2713-1-git-send-email-elder@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396577891-2713-1-git-send-email-elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Also explicitly set CONFIG_NR_CPUS to 2, limiting it to the most we
currently need.

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/configs/bcm_defconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/bcm_defconfig b/arch/arm/configs/bcm_defconfig
index 0100464..ea374a7 100644
--- a/arch/arm/configs/bcm_defconfig
+++ b/arch/arm/configs/bcm_defconfig
@@ -24,6 +24,8 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM_MOBILE=y
 CONFIG_ARM_THUMBEE=y
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
