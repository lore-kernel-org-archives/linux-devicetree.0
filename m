From: Alexis Ballier <aballier@gentoo.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: rk3399-orangepi: Add the fusb typec manager
Date: Fri, 15 Mar 2019 15:58:21 +0100
Message-ID: <20190315145818.23610-4-aballier@gentoo.org>
References: <20190315145818.23610-1-aballier@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315145818.23610-1-aballier@gentoo.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Alexis Ballier <aballier@gentoo.org>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Also rename its regulator to match the schematic names.

Signed-off-by: Alexis Ballier <aballier@gentoo.org>
Cc: devicetree@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
 .../boot/dts/rockchip/rk3399-orangepi.dts     | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts b/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
index 96ccbe5c4f0c..2166be171df8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
@@ -136,13 +136,13 @@
 		vin-supply = <&vcc_sys>;
 	};
 
-	vcc5v0_typec0: vcc5v0-typec0-regulator {
+	vbus_typec: vbus-typec-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpio1 RK_PA3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_typec0_en>;
-		regulator-name = "vcc5v0_typec0";
+		pinctrl-0 = <&vcc5v0_typec_en>;
+		regulator-name = "vbus_typec";
 		vin-supply = <&vcc_sys>;
 	};
 
@@ -505,6 +505,16 @@
 		pinctrl-0 = <&light_int_l>;
 		vdd-supply = <&vcc3v3_s3>;
 	};
+
+	fusb302@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&chg_cc_int_l>;
+		vbus-supply = <&vbus_typec>;
+	};
 };
 
 &io_domains {
@@ -547,7 +557,7 @@
 				<4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		vcc5v0_typec0_en: vcc5v0-typec0-en {
+		vcc5v0_typec_en: vcc5v0-typec-en {
 			rockchip,pins =
 				<1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
@@ -596,6 +606,12 @@
 			rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	fusb302 {
+		chg_cc_int_l: chg-cc-int-l {
+			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
 };
 
 &pwm0 {
@@ -677,7 +693,7 @@
 	status = "okay";
 
 	u2phy0_otg: otg-port {
-		phy-supply = <&vcc5v0_typec0>;
+		phy-supply = <&vbus_typec>;
 		status = "okay";
 	};
 
-- 
2.21.0
