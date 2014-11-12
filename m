From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3.19 1/2] ARM: multi_v7_defconfig: remove one level of menu from Kconfig
Date: Wed, 12 Nov 2014 13:03:16 -0800
Message-ID: <1415826197-6748-2-git-send-email-f.fainelli@gmail.com>
References: <1415826197-6748-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415826197-6748-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

remove menu "Broadcom Mobile SoC Selection"
This requires:
- selecting ARCH_BCM_MOBILE based on SoC selections
- fixup multi_v7_defconfig to work with new menu levels of mach-bcm.

Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/configs/multi_v7_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 491b7d5523bf..e8f79fdd4cc3 100644
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
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
