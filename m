From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 5/6] ARM64: dts: meson-axg: add pdm pins
Date: Mon, 16 Jul 2018 12:11:50 +0200
Message-ID: <20180716101151.31109-6-jbrunet@baylibre.com>
References: <20180716101151.31109-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716101151.31109-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pdm input pin definitions to meson AXG

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 277958ff516a..461be4a35f92 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -477,6 +477,48 @@
 					};
 				};
 
+				pdm_dclk_a14_pins: pdm_dclk_a14 {
+					mux {
+						groups = "pdm_dclk_a14";
+						function = "pdm";
+					};
+				};
+
+				pdm_dclk_a19_pins: pdm_dclk_a19 {
+					mux {
+						groups = "pdm_dclk_a19";
+						function = "pdm";
+					};
+				};
+
+				pdm_din0_pins: pdm_din0 {
+					mux {
+						groups = "pdm_din0";
+						function = "pdm";
+					};
+				};
+
+				pdm_din1_pins: pdm_din1 {
+					mux {
+						groups = "pdm_din1";
+						function = "pdm";
+					};
+				};
+
+				pdm_din2_pins: pdm_din2 {
+					mux {
+						groups = "pdm_din2";
+						function = "pdm";
+					};
+				};
+
+				pdm_din3_pins: pdm_din3 {
+					mux {
+						groups = "pdm_din3";
+						function = "pdm";
+					};
+				};
+
 				pwm_a_a_pins: pwm_a_a {
 					mux {
 						groups = "pwm_a_a";
-- 
2.14.4
