From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: dts: Add TMU clock entries to exynos4210.dtsi
Date: Mon, 22 Apr 2013 10:02:52 +0530
Message-ID: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Adds TMU clock entries to exynos4210.dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 50ab9d4..53654c4 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -111,6 +111,9 @@
 		interrupt-parent = <&combiner>;
 		reg = <0x100C0000 0x100>;
 		interrupts = <2 4>;
+		clocks = <&clock 383>;
+		clock-names = "tmu_apbif";
+		status = "disabled";
 	};
 
 	g2d@12800000 {
-- 
1.7.9.5
