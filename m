From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 5/6] arm64: dts: rockchip: Rename vcc12v_sys into dc_12v for roc-rk3399-pc
Date: Thu, 19 Sep 2019 10:58:21 +0530
Message-ID: <20190919052822.10403-6-jagan@amarulasolutions.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919052822.10403-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

It is always better practice to follow regulator naming conventions
as per the schematics for future references.

This would indeed helpful to review and check the naming convention
directly on schematics, both for the code reviewers and the developers.

So, rename vcc12v_sys into dc_12v as per rk3399 power tree as per
roc-rk3399-pc schematics.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts b/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
index e09bcbdd92f5..51242ea5447d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
@@ -57,9 +57,9 @@
 	 * should be placed inside mp8859, but not until mp8859 has
 	 * its own dt-binding.
 	 */
-	vcc12v_sys: mp8859-dcdc1 {
+	dc_12v: mp8859-dcdc1 {
 		compatible = "regulator-fixed";
-		regulator-name = "vcc12v_sys";
+		regulator-name = "dc_12v";
 		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <12000000>;
@@ -85,7 +85,7 @@
 		regulator-boot-on;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc12v_sys>;
+		vin-supply = <&dc_12v>;
 	};
 
 	/* Actually 3 regulators (host0, 1, 2) controlled by the same gpio */
@@ -118,7 +118,7 @@
 		regulator-boot-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc12v_sys>;
+		vin-supply = <&dc_12v>;
 	};
 
 	vdd_log: vdd-log {
-- 
2.18.0.321.gffc6fa0e3
