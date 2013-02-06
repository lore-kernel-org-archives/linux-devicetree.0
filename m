From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/7] ARM: dts: Add G2D node to SMDKV310
Date: Wed,  6 Feb 2013 17:21:12 +0530
Message-ID: <1360151477-26460-3-git-send-email-sachin.kamat@linaro.org>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Added G2D DT node to SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-smdkv310.dts |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 2b1e03a..7bb16aa 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -43,6 +43,10 @@
 		status = "okay";
 	};
 
+	g2d@12800000 {
+		status = "okay";
+	};
+
 	codec@13400000 {
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
-- 
1.7.4.1
