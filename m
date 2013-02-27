From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 2/5] ARM: dts: Add lcd pinctrl node entries for EXYNOS4412 SoC
Date: Wed, 27 Feb 2013 14:13:37 +0530
Message-ID: <1361954620-20614-3-git-send-email-vikas.sajjan@linaro.org>
References: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, sachin.kamat@linaro.org, joshi@samsung.com
List-Id: devicetree@vger.kernel.org

From: Sachin Kamat <sachin.kamat@linaro.org>

This patch adds the lcd panel related picntrl nodes for Exynos4412 SoC

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 099cec7..a59d69c 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -354,6 +354,20 @@
 			samsung,pin-drv = <0>;
 		};
 
+		lcd_sync: lcd-sync {
+			samsung,pins = "gpf0-0", "gpf0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		lcd_en: lcd-en {
+			samsung,pins = "gpf0-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		lcd_clk: lcd-clk {
 			samsung,pins = "gpf0-0", "gpf0-1", "gpf0-2", "gpf0-3";
 			samsung,pin-function = <2>;
-- 
1.7.9.5
