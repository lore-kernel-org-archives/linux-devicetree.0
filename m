From: Akash Gajjar <Akash_Gajjar@mentor.com>
Subject: [PATCH 2/4] arm64: dts: rockchip: rockpro64 dts remove unused node
Date: Wed, 13 Feb 2019 22:36:38 +0530
Message-ID: <20190213170651.3210-3-Akash_Gajjar@mentor.com>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Oskari Lemmela <oskari@lemmela.net>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Levin Du <djw@t-chip.com.cn>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

lcd panel pinmux and vcc1v8_s3 regulator is redundant and has a no impact, so
removing it.

Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
---
 .../boot/dts/rockchip/rk3399-rockpro64.dts    | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index 49e83ba64045..c9a2b26d7cad 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -83,17 +83,6 @@
 		regulator-max-microvolt = <12000000>;
 	};
 
-	/* switched by pmic_sleep */
-	vcc1v8_s3: vcca1v8_s3: vcc1v8-s3 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc1v8_s3";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vcc_1v8>;
-	};
-
 	vcc3v3_pcie: vcc3v3-pcie-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -522,12 +511,6 @@
 		};
 	};
 
-	lcd-panel {
-		lcd_panel_reset: lcd-panel-reset {
-			rockchip,pins = <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-
 	pcie {
 		pcie_pwr_en: pcie-pwr-en {
 			rockchip,pins = <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -576,7 +559,7 @@
 };
 
 &saradc {
-	vref-supply = <&vcca1v8_s3>;
+	vref-supply = <&vcca_1v8>;
 	status = "okay";
 };
 
-- 
2.17.1
