From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v3 6/8] arm64: exynos7: Enable ARMv8 based Exynos7 (SoC) support
Date: Thu, 11 Sep 2014 15:50:50 +0530
Message-ID: <1410430852-3491-7-git-send-email-ch.naveen@samsung.com>
References: <1410430852-3491-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1410430852-3491-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
List-Id: devicetree@vger.kernel.org

From: Alim Akhtar <alim.akhtar@samsung.com>

This patch adds the necessary Kconfig entries to enable
support for the ARMv8 based Exynos7 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/Kconfig |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd4e81a..b4d1dc2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -134,6 +134,18 @@ source "kernel/Kconfig.freezer"
 
 menu "Platform selection"
 
+config ARCH_EXYNOS
+	bool
+	help
+	  This enables support for Samsung Exynos SoC family
+
+config ARCH_EXYNOS7
+	bool "ARMv8 based Samsung Exynos7"
+	select ARCH_EXYNOS
+	select COMMON_CLK_SAMSUNG
+	help
+	  This enables support for Samsung Exynos7 SoC family
+
 config ARCH_VEXPRESS
 	bool "ARMv8 software model (Versatile Express)"
 	select ARCH_REQUIRE_GPIOLIB
-- 
1.7.9.5
