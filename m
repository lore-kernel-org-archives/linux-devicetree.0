From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Remove combiner IRQ node from exynos4x12.dtsi
Date: Tue, 23 Apr 2013 15:24:48 +0530
Message-ID: <1366710888-11059-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

These nodes have separately been added to 4212 and 4412 dtsi
files by commit 30269ddff1 ("ARM: exynos: add missing properties
for combiner IRQs"). The existing node also contained a few
incorrect entries.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Patch based on linux-next tree (20130423)
---
 arch/arm/boot/dts/exynos4x12.dtsi |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index ede3f9b..675c221 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -28,14 +28,6 @@
 		pinctrl3 = &pinctrl_3;
 	};
 
-	combiner:interrupt-controller@10440000 {
-		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
-			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
-			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
-			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
-			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
-	};
-
 	clock: clock-controller@0x10030000 {
 		compatible = "samsung,exynos4412-clock";
 		reg = <0x10030000 0x20000>;
-- 
1.7.9.5
