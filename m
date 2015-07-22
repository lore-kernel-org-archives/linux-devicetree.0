From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v3 2/2] arm64: Enable Marvell Berlin SoC family in Kconfig and defconfig
Date: Wed, 22 Jul 2015 16:57:50 +0800
Message-ID: <1437555470-6283-3-git-send-email-jszhang@marvell.com>
References: <1437555470-6283-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437555470-6283-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will.deacon@arm.com, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, mark.rutland@arm.com, sudeep.holla@arm.com, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

This patch introduces ARCH_BERLIN to enable Marvell Berlin SoC family in
Kconfig and defconfig.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 arch/arm64/configs/defconfig | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index f7e4327..37b8fc5 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -1,5 +1,11 @@
 menu "Platform selection"
 
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
index 506b466..83843f9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -31,6 +31,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
+CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS7=y
 CONFIG_ARCH_FSL_LS2085A=y
 CONFIG_ARCH_HISI=y
-- 
2.1.4
