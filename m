From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v2 2/5] ARM: dts: Remove unsused MFC clock from exynos4
Date: Thu, 20 Jun 2013 12:23:39 +0530
Message-ID: <1371711222-9232-3-git-send-email-arun.kk@samsung.com>
References: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arunkk.samsung@gmail.com
List-Id: devicetree@vger.kernel.org

Removes the unused sclk_mfc from exynos4 dtsi file.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 3f94fe8..0f213a3 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -160,8 +160,8 @@
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
 		samsung,power-domain = <&pd_mfc>;
-		clocks = <&clock 170>, <&clock 273>;
-		clock-names = "sclk_mfc", "mfc";
+		clocks = <&clock 273>;
+		clock-names = "mfc";
 		status = "disabled";
 	};
 
-- 
1.7.9.5
