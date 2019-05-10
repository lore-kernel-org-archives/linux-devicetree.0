From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/5] arm64: dts: meson: g12a: add ethernet pinctrl definitions
Date: Fri, 10 May 2019 18:49:37 +0200
Message-ID: <20190510164940.13496-3-jbrunet@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510164940.13496-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index a32db09809f7..fe0f73730525 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -206,6 +206,43 @@
 						};
 					};
 
+					eth_leds_pins: eth-leds {
+						mux {
+							groups = "eth_link_led",
+								 "eth_act_led";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
+					eth_rmii_pins: eth-rmii {
+						mux {
+							groups = "eth_mdio",
+								 "eth_mdc",
+								 "eth_rgmii_rx_clk",
+								 "eth_rx_dv",
+								 "eth_rxd0",
+								 "eth_rxd1",
+								 "eth_txen",
+								 "eth_txd0",
+								 "eth_txd1";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
+					eth_rgmii_pins: eth-rgmii {
+						mux {
+							groups = "eth_rxd2_rgmii",
+								 "eth_rxd3_rgmii",
+								 "eth_rgmii_tx_clk",
+								 "eth_txd2_rgmii",
+								 "eth_txd3_rgmii";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
 					hdmitx_ddc_pins: hdmitx_ddc {
 						mux {
 							groups = "hdmitx_sda",
-- 
2.20.1
