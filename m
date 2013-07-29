From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 7/7] ARM: dts: Add pin state information for DP HPD support to Exynos5420
Date: Mon, 29 Jul 2013 19:19:31 +0530
Message-ID: <1375105771-8106-8-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Add pin state information for DP HPD support that requires pin configuration
support using pinctrl interface.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 +++++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    5 +++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index 5848c42..e695aba 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -59,6 +59,13 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		dp_hpd: dp_hpd {
+			samsung,pins = "gpx0-7";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <0>;
+			samaung,pin-drv = <0>;
+		};
 	};
 
 	pinctrl@13410000 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 7c2f477..1237ad2 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -31,6 +31,11 @@
 		};
 	};
 
+	dp-controller {
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_hpd>;
+       };
+
 	fimd {
 		display-timings {
 			native-mode = <&timing0>;
-- 
1.7.9.5
