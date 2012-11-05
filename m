From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/5] arm: exynos5: add iommu support for exynos5250_DT platform
Date: Mon, 05 Nov 2012 13:01:24 +0530
Message-ID: <1352100685-7695-5-git-send-email-rahul.sharma@samsung.com>
References: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com
List-Id: devicetree@vger.kernel.org

With this patch iommu support will be enabled for exynos 5250
platform with device tree enabled.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index bb3b09a..adff52e 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -422,6 +422,7 @@ config MACH_EXYNOS5_DT
 	select ARM_AMBA
 	select SOC_EXYNOS5250
 	select USE_OF
+	select ARM_DMA_USE_IOMMU
 	help
 	  Machine support for Samsung EXYNOS5 machine with device tree enabled.
 	  Select this if a fdt blob is available for the EXYNOS5 SoC based board.
-- 
1.7.0.4
