From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Add MFC clock entries for exynos4
Date: Thu,  4 Apr 2013 11:56:54 +0530
Message-ID: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, rob.herring@calxeda.com, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Added MFC related clock entries in exynos4.dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Based on Kukjin's for-next.
Dependent on the below patch:
https://patchwork.kernel.org/patch/2349361/
---
 arch/arm/boot/dts/exynos4.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 59e6730..4061f48 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -150,6 +150,8 @@
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 170>, <&clock 273>;
+		clock-names = "sclk_mfc", "mfc";
 		status = "disabled";
 	};
 
-- 
1.7.9.5
