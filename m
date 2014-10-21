From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v2 7/7] arm64: exynos: Enable rtc and watchdog support for
 Exynos7
Date: Tue, 21 Oct 2014 11:13:57 +0530
Message-ID: <1413870237-1821-8-git-send-email-a.kesavan@samsung.com>
References: <1413870237-1821-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1413870237-1821-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

Enable rtc and watchdog support for exynos7 SoCs.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm64/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 238acff..9bb4e02 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -158,6 +158,9 @@ config ARCH_EXYNOS7
 	select COMMON_CLK_SAMSUNG
 	select PINCTRL
 	select PINCTRL_EXYNOS
+	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select HAVE_S3C_RTC if RTC_CLASS
+
 	help
 	  This enables support for Samsung Exynos7 SoC family
 
-- 
1.7.9.5
