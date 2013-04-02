From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 5/7] ARM: dts: Add vmmc regulator support for Arndale board
Date: Tue,  2 Apr 2013 13:45:05 +0530
Message-ID: <1364890507-19261-6-git-send-email-tushar.behera@linaro.org>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Sachin Kamat <sachin.kamat@linaro.org>

Added vmmc regulator node to Arndale DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V3:
* Pin-control related modifications.

 arch/arm/boot/dts/exynos5250-arndale.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 7c3f54b..e7fa72c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -322,6 +322,7 @@
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
 		samsung,dw-mshc-ddr-timing = <1 2>;
+		vmmc-supply = <&mmc_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
 
@@ -343,6 +344,7 @@
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
 		samsung,dw-mshc-ddr-timing = <1 2>;
+		vmmc-supply = <&mmc_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
 
@@ -421,4 +423,13 @@
 			gpio-key,wakeup;
 		};
 	};
+
+	mmc_reg: voltage-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_33ON_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpx1 1 1>;
+		enable-active-high;
+	};
 };
-- 
1.7.9.5
