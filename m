From: Feng Kan <fkan@apm.com>
Subject: [PATCH V5 4/5] arm64: Select reboot driver for X-Gene platform
Date: Wed, 29 Jan 2014 16:03:17 -0800
Message-ID: <1391040198-14185-5-git-send-email-fkan@apm.com>
References: <1391040198-14185-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391040198-14185-1-git-send-email-fkan@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: patches@apm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Select reboot driver for X-Gene platform.

Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index dd4327f..f43820f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -123,6 +123,8 @@ config ARCH_VEXPRESS
 
 config ARCH_XGENE
 	bool "AppliedMicro X-Gene SOC Family"
+	select MFD_SYSCON
+	select POWER_RESET_SYSCON
 	help
 	  This enables support for AppliedMicro X-Gene SOC Family
 
-- 
1.7.6.1
