From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v6 4/5] ARM: dts: Add FIMD AUXDATA node entry for exynos4 DT
Date: Thu, 28 Feb 2013 15:12:38 +0530
Message-ID: <1362044559-7496-5-git-send-email-vikas.sajjan@linaro.org>
References: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, jy0922.shim@samsung.com
List-Id: devicetree@vger.kernel.org

Adds the FIMD AUXDATA node

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index b68115a..b32a929 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -84,6 +84,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
 				"exynos-tmu", NULL),
 	OF_DEV_AUXDATA("samsung,mfc-v5", 0x13400000, "s5p-mfc", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-fimd", EXYNOS4_PA_FIMD0,
+			"exynos4-fb.0", NULL),
 	{},
 };
 
-- 
1.7.9.5
