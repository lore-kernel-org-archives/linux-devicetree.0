From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 2/2] arm64: Enable Marvell Berlin SoC family in Kconfig and defconfig
Date: Thu, 30 Jul 2015 17:35:22 +0800
Message-ID: <1438248922-2919-3-git-send-email-jszhang@marvell.com>
References: <1438248922-2919-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438248922-2919-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch introduces ARCH_BERLIN to enable Marvell Berlin SoC family in
Kconfig and defconfig.

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 arch/arm64/configs/defconfig | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index e2deb18..23800a1 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -5,6 +5,12 @@ config ARCH_BCM_IPROC
 	help
 	  This enables support for Broadcom iProc based SoCs
 
+config ARCH_BERLIN
+	bool "Marvell Berlin SoC Family"
+	select DW_APB_ICTL
+	help
+	  This enables support for Marvell Berlin SoC Family
+
 config ARCH_EXYNOS
 	bool
 	help
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 913f121..34d71dd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -32,6 +32,7 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
 CONFIG_ARCH_BCM_IPROC=y
+CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS7=y
 CONFIG_ARCH_FSL_LS2085A=y
 CONFIG_ARCH_HISI=y
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
