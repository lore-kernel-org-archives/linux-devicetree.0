From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM64: dts: meson-axg: add ethernet mac controller
Date: Mon, 13 Nov 2017 16:01:55 +0800
Message-ID: <20171113080155.2463-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT info for the stmmac ethernet MAC which found in
the Amlogic's Meson-AXG SoC, also describe the ethernet
pinctrl & clock information here.

This is tested in the S400 dev board which use a RTL8211F PHY,
and the pins connect to the 'eth_rgmii_y_pins' group.

Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts |  7 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 53 ++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 9eb6aaee155d..7b39a9fe2b0f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -21,3 +21,10 @@
 	status = "okay";
 };
 
+&ethmac {
+	status = "okay";
+	phy-mode = "rgmii";
+
+	pinctrl-0 = <&eth_rgmii_y_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 65945c6c8b65..57faaa9d8013 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -157,6 +157,19 @@
 			#address-cells = <0>;
 		};
 
+		ethmac: ethernet@ff3f0000 {
+			compatible = "amlogic,meson-axg-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+			reg = <0x0 0xff3f0000 0x0 0x10000
+				0x0 0xff634540 0x0 0x8>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "macirq";
+			status = "disabled";
+			clocks = <&clkc CLKID_ETH>,
+				 <&clkc CLKID_FCLK_DIV2>,
+				 <&clkc CLKID_MPLL2>;
+			clock-names = "stmmaceth", "clkin0", "clkin1";
+		};
+
 		hiubus: hiubus@ff63c000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff63c000 0x0 0x1c00>;
@@ -203,6 +216,46 @@
 					#gpio-cells = <2>;
 					gpio-ranges = <&pinctrl_periphs 0 0 86>;
 				};
+
+				eth_rgmii_x_pins: eth-x-rgmii {
+					mux {
+						groups = "eth_mdio_x",
+						       "eth_mdc_x",
+						       "eth_rgmii_rx_clk_x",
+						       "eth_rx_dv_x",
+						       "eth_rxd0_x",
+						       "eth_rxd1_x",
+						       "eth_rxd2_rgmii",
+						       "eth_rxd3_rgmii",
+						       "eth_rgmii_tx_clk",
+						       "eth_txen_x",
+						       "eth_txd0_x",
+						       "eth_txd1_x",
+						       "eth_txd2_rgmii",
+						       "eth_txd3_rgmii";
+						function = "eth";
+					};
+				};
+
+				eth_rgmii_y_pins: eth-y-rgmii {
+					mux {
+						groups = "eth_mdio_y",
+						       "eth_mdc_y",
+						       "eth_rgmii_rx_clk_y",
+						       "eth_rx_dv_y",
+						       "eth_rxd0_y",
+						       "eth_rxd1_y",
+						       "eth_rxd2_rgmii",
+						       "eth_rxd3_rgmii",
+						       "eth_rgmii_tx_clk",
+						       "eth_txen_y",
+						       "eth_txd0_y",
+						       "eth_txd1_y",
+						       "eth_txd2_rgmii",
+						       "eth_txd3_rgmii";
+						function = "eth";
+					};
+				};
 			};
 		};
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
