From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH V7 5/6] arm64: Select reboot driver for X-Gene platform
Date: Wed, 25 Jun 2014 16:03:25 -0700
Message-ID: <1403737406-6474-6-git-send-email-fkan@apm.com>
References: <1403737406-6474-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403737406-6474-1-git-send-email-fkan-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Select reboot driver for X-Gene platform.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a474de34..91a2e25 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -140,6 +140,8 @@ config ARCH_VEXPRESS
 
 config ARCH_XGENE
 	bool "AppliedMicro X-Gene SOC Family"
+	select MFD_SYSCON
+	select POWER_RESET_SYSCON
 	help
 	  This enables support for AppliedMicro X-Gene SOC Family
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
