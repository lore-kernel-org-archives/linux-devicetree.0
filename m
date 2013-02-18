From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/7] ARM: dts: Add G2D node to exynos4210.dtsi
Date: Mon, 18 Feb 2013 10:32:07 +0530
Message-ID: <1361163733-4338-2-git-send-email-sachin.kamat@linaro.org>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org
List-Id: devicetree@vger.kernel.org

Added G2D DT node to Exynos4210.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index e31bfc4..19aa167 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -47,6 +47,13 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
 	};
 
+	g2d@12800000 {
+		compatible = "samsung,s5pv210-g2d";
+		reg = <0x12800000 0x1000>;
+		interrupts = <0 89 0>;
+		status = "disabled";
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,pinctrl-exynos4210";
 		reg = <0x11400000 0x1000>;
-- 
1.7.4.1
