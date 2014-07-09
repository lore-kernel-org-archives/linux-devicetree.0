From: Feng Kan <fkan@apm.com>
Subject: [PATCH V8 5/6] arm64: Select reboot driver for X-Gene platform
Date: Tue,  8 Jul 2014 19:15:52 -0700
Message-ID: <1404872153-3594-6-git-send-email-fkan@apm.com>
References: <1404872153-3594-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404872153-3594-1-git-send-email-fkan@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dbaryshkov@gmail.com, catalin.marinas@arm.com, dwmw2@infradead.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@apm.com
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Select reboot driver for X-Gene platform.

Signed-off-by: Feng Kan <fkan@apm.com>
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
