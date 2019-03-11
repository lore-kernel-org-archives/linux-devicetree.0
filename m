From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/3] arm64: dts: rockchip: rk3399: rock960: Rename vcc_sys into vcc5v0_sys
Date: Mon, 11 Mar 2019 20:33:30 +0530
Message-ID: <20190311150332.19492-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>, Akash Gajjar <akash@openedev.com>
List-Id: devicetree@vger.kernel.org

It is always better practice to follow regulator naming conventions
as per the schematics for future references.

So, rename vcc_sys into vcc5v0_sys as per rk3399 power diagram of
rock960 schematics.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Akash Gajjar <akash@openedev.com>
---
 .../boot/dts/rockchip/rk3399-rock960.dtsi     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index 2927db4dda9d..a268ec9f6b5e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -26,9 +26,9 @@
 		regulator-always-on;
 	};
 
-	vcc_sys: vcc-sys {
+	vcc5v0_sys: vcc5v0-sys {
 		compatible = "regulator-fixed";
-		regulator-name = "vcc_sys";
+		regulator-name = "vcc5v0_sys";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -40,7 +40,7 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 
 	vcc3v3_pcie: vcc3v3-pcie-regulator {
@@ -64,7 +64,7 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 };
 
@@ -123,7 +123,7 @@
 		regulator-ramp-delay = <1000>;
 		regulator-always-on;
 		regulator-boot-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 		status = "okay";
 
 		regulator-state-mem {
@@ -141,7 +141,7 @@
 		regulator-ramp-delay = <1000>;
 		regulator-always-on;
 		regulator-boot-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 		regulator-state-mem {
 			regulator-off-in-suspend;
 		};
@@ -159,16 +159,16 @@
 		#clock-cells = <1>;
 		clock-output-names = "xin32k", "rk808-clkout2";
 
-		vcc1-supply = <&vcc_sys>;
-		vcc2-supply = <&vcc_sys>;
-		vcc3-supply = <&vcc_sys>;
-		vcc4-supply = <&vcc_sys>;
-		vcc6-supply = <&vcc_sys>;
-		vcc7-supply = <&vcc_sys>;
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
 		vcc8-supply = <&vcc3v3_sys>;
-		vcc9-supply = <&vcc_sys>;
-		vcc10-supply = <&vcc_sys>;
-		vcc11-supply = <&vcc_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc5v0_sys>;
 		vcc12-supply = <&vcc3v3_sys>;
 		vddio-supply = <&vcc_1v8>;
 
-- 
2.18.0.321.gffc6fa0e3
