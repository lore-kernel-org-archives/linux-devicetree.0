From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] exynos4-is: Correct fimc-lite compatible property description
Date: Thu, 09 May 2013 14:43:34 +0200
Message-ID: <1368103414-16645-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: a.hajda@samsung.com, hj210.choi@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

Ensure the compatible property for FIMC-LITE IP blocks is properly
documented, a cut&paste error fix.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/media/exynos-fimc-lite.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt b/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
index 3f62adf..de9f6b7 100644
--- a/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
+++ b/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
@@ -2,7 +2,7 @@ Exynos4x12/Exynos5 SoC series camera host interface (FIMC-LITE)
 
 Required properties:
 
-- compatible	: should be "samsung,exynos4212-fimc" for Exynos4212 and
+- compatible	: should be "samsung,exynos4212-fimc-lite" for Exynos4212 and
 		  Exynos4412 SoCs;
 - reg		: physical base address and size of the device memory mapped
 		  registers;
-- 
1.7.9.5
