From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 1/3] arm64: berlin: enable ARCH_REQUIRE_GPIOLIB
Date: Fri, 18 Sep 2015 21:47:37 +0800
Message-ID: <1442584059-7319-2-git-send-email-jszhang@marvell.com>
References: <1442584059-7319-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442584059-7319-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

All berlin SoCs have GPIOs driven by the dwapb GPIO driver. Add GPIOLIB
as a dependency to be able to support them.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 23800a1..c6e2c75 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -7,6 +7,7 @@ config ARCH_BCM_IPROC
 
 config ARCH_BERLIN
 	bool "Marvell Berlin SoC Family"
+	select ARCH_REQUIRE_GPIOLIB
 	select DW_APB_ICTL
 	help
 	  This enables support for Marvell Berlin SoC Family
-- 
2.5.1
