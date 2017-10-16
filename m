From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: [PATCH 5/9] ARM: dts: rockchip: Add gmac support for rk3288-vyasa board
Date: Mon, 16 Oct 2017 17:46:23 +0530
Message-ID: <1508156187-27519-6-git-send-email-jagan@amarulasolutions.com>
References: <1508156187-27519-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508156187-27519-1-git-send-email-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Trimarchi <michael@amarulasolutions.com>, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/rk3288-vyasa.dts | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-vyasa.dts b/arch/arm/boot/dts/rk3288-vyasa.dts
index 0fa447f..c79a4c7 100644
--- a/arch/arm/boot/dts/rk3288-vyasa.dts
+++ b/arch/arm/boot/dts/rk3288-vyasa.dts
@@ -104,12 +104,35 @@
 		regulator-boot-on;
 		vin-supply = <&dc12_vbat>;
 	};
+
+	ext_gmac: external-gmac-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+		clock-output-names = "ext_gmac";
+	};
 };
 
 &cpu0 {
 	cpu0-supply = <&vdd_cpu>;
 };
 
+&gmac {
+	assigned-clocks = <&cru SCLK_MAC>;
+	assigned-clock-parents = <&ext_gmac>;
+	clock_in_out = "input";
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>, <&phy_rst>, <&phy_pmeb>, <&phy_int>;
+	phy-supply = <&vcc_lan>;
+	phy-mode = "rgmii";
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
+	tx_delay = <0x30>;
+	rx_delay = <0x10>;
+	status = "ok";
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu>;
 	status = "okay";
@@ -361,6 +384,24 @@
 };
 
 &pinctrl {
+	pcfg_output_high: pcfg-output-high {
+		output-high;
+	};
+
+	gmac {
+		phy_int: phy-int {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		phy_pmeb: phy-pmeb {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		phy_rst: phy-rst {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_output_high>;
+		};
+	};
+
 	pmic {
 		pmic_int: pmic-int {
 			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.7.4
