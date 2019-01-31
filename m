From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] ARM: dts: rockchip: rv1108-elgin: Fix vcc5/6-supply representation
Date: Thu, 31 Jan 2019 10:47:07 -0200
Message-ID: <20190131124710.30238-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jason Zhu <jason.zhu@rock-chips.com>, Vicent Chi <vicent.chi@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Philipp Tomsic <philipp.tomsich@theobroma-systems.com>, Tony Xie <tony.xie@rock-chips.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On rv1108-elgin-r1 board the RK805 VCC5 and VCC6 supplies come from
the BUCK2 regulator at 2.2V, so fix the representation in the
device tree.

While at it, rename it from vdd_cam to vdd_buck2, which is a better
name for the regulator label.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 arch/arm/boot/dts/rv1108-elgin-r1.dts | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/rv1108-elgin-r1.dts b/arch/arm/boot/dts/rv1108-elgin-r1.dts
index 658057d871af..66688fdf4fd8 100644
--- a/arch/arm/boot/dts/rv1108-elgin-r1.dts
+++ b/arch/arm/boot/dts/rv1108-elgin-r1.dts
@@ -74,8 +74,8 @@
 		vcc2-supply = <&vcc_sys>;
 		vcc3-supply = <&vcc_sys>;
 		vcc4-supply = <&vcc_sys>;
-		vcc5-supply = <&vcc_sys>;
-		vcc6-supply = <&vcc_sys>;
+		vcc5-supply = <&vdd_buck2>;
+		vcc6-supply = <&vdd_buck2>;
 
 		regulators {
 			vdd_core: DCDC_REG1 {
@@ -90,10 +90,12 @@
 				};
 			};
 
-			vdd_cam: DCDC_REG2 {
-				regulator-name= "vdd_cam";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <2000000>;
+			vdd_buck2: DCDC_REG2 {
+				regulator-name= "vdd_buck2";
+				regulator-min-microvolt = <2200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-always-on;
+				regulator-boot-on;
 				regulator-state-mem {
 					regulator-state-disabled;
 				};
-- 
2.20.1
