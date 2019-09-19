From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 6/6] arm64: dts: rockchip: Fix roc-rk3399-pc regulator input rails
Date: Thu, 19 Sep 2019 10:58:22 +0530
Message-ID: <20190919052822.10403-7-jagan@amarulasolutions.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919052822.10403-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Few, know rk808 pmic regulators VCC[1-4], VCC[6-7], VCC[9-11],
VDD_LOG, VDD_GPU, VDD_CPU_B, VCC3V3_SYS are inputting with vcc_sys
which is 5V power rail from dc_12v.

So, replace the vin-supply of above mentioned regulators
with vcc_sys as per the PMIC-RK808-D page of roc-rk3399-pc
schematics.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../rk3399-libretech-roc-rk3399-pc.dts        | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts b/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
index 51242ea5447d..1eddb2e00809 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
@@ -85,7 +85,7 @@
 		regulator-boot-on;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&dc_12v>;
+		vin-supply = <&vcc_sys>;
 	};
 
 	/* Actually 3 regulators (host0, 1, 2) controlled by the same gpio */
@@ -129,7 +129,7 @@
 		regulator-boot-on;
 		regulator-min-microvolt = <800000>;
 		regulator-max-microvolt = <1400000>;
-		vin-supply = <&vcc3v3_sys>;
+		vin-supply = <&vcc_sys>;
 	};
 };
 
@@ -202,16 +202,16 @@
 		rockchip,system-power-controller;
 		wakeup-source;
 
-		vcc1-supply = <&vcc3v3_sys>;
-		vcc2-supply = <&vcc3v3_sys>;
-		vcc3-supply = <&vcc3v3_sys>;
-		vcc4-supply = <&vcc3v3_sys>;
-		vcc6-supply = <&vcc3v3_sys>;
-		vcc7-supply = <&vcc3v3_sys>;
+		vcc1-supply = <&vcc_sys>;
+		vcc2-supply = <&vcc_sys>;
+		vcc3-supply = <&vcc_sys>;
+		vcc4-supply = <&vcc_sys>;
+		vcc6-supply = <&vcc_sys>;
+		vcc7-supply = <&vcc_sys>;
 		vcc8-supply = <&vcc3v3_sys>;
-		vcc9-supply = <&vcc3v3_sys>;
-		vcc10-supply = <&vcc3v3_sys>;
-		vcc11-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc_sys>;
+		vcc10-supply = <&vcc_sys>;
+		vcc11-supply = <&vcc_sys>;
 		vcc12-supply = <&vcc3v3_sys>;
 		vddio-supply = <&vcc1v8_pmu>;
 
@@ -385,7 +385,7 @@
 		regulator-ramp-delay = <1000>;
 		regulator-always-on;
 		regulator-boot-on;
-		vin-supply = <&vcc3v3_sys>;
+		vin-supply = <&vcc_sys>;
 
 		regulator-state-mem {
 			regulator-off-in-suspend;
@@ -404,7 +404,7 @@
 		regulator-ramp-delay = <1000>;
 		regulator-always-on;
 		regulator-boot-on;
-		vin-supply = <&vcc3v3_sys>;
+		vin-supply = <&vcc_sys>;
 
 		regulator-state-mem {
 			regulator-off-in-suspend;
-- 
2.18.0.321.gffc6fa0e3
