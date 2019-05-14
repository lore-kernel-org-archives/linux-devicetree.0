From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 7/8] arm64: dts: meson: g12a: add spdifin
Date: Tue, 14 May 2019 13:15:09 +0200
Message-ID: <20190514111510.23299-8-jbrunet@baylibre.com>
References: <20190514111510.23299-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514111510.23299-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the spdif input device node and the pinctrl definition for
this capture interface g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 37119564274b..d4fc645f0ff3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -807,6 +807,30 @@
 						};
 					};
 
+					spdif_in_a10_pins: spdif-in-a10 {
+						mux {
+							groups = "spdif_in_a10";
+							function = "spdif_in";
+							bias-disable;
+						};
+					};
+
+					spdif_in_a12_pins: spdif-in-a12 {
+						mux {
+							groups = "spdif_in_a12";
+							function = "spdif_in";
+							bias-disable;
+						};
+					};
+
+					spdif_in_h_pins: spdif-in-h {
+						mux {
+							groups = "spdif_in_h";
+							function = "spdif_in";
+							bias-disable;
+						};
+					};
+
 					spdif_out_h_pins: spdif-out-h {
 						mux {
 							groups = "spdif_out_h";
@@ -1510,6 +1534,19 @@
 					status = "disabled";
 				};
 
+				spdifin: audio-controller@400 {
+					compatible = "amlogic,g12a-spdifin",
+						     "amlogic,axg-spdifin";
+					reg = <0x0 0x400 0x0 0x30>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "SPDIFIN";
+					interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+						 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+					clock-names = "pclk", "refclk";
+					status = "disabled";
+				};
+
 				spdifout: audio-controller@480 {
 					compatible = "amlogic,g12a-spdifout",
 						     "amlogic,axg-spdifout";
-- 
2.20.1
