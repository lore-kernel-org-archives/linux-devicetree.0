From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/8] arm64: dts: meson: g12a: add audio fifos
Date: Tue, 14 May 2019 13:15:05 +0200
Message-ID: <20190514111510.23299-4-jbrunet@baylibre.com>
References: <20190514111510.23299-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514111510.23299-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the playback and capture memory interfaces of the g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 67 +++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 2d5bccad4035..299df8131a0c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 
 / {
@@ -709,6 +710,72 @@
 					resets = <&reset RESET_AUDIO>;
 				};
 
+				toddr_a: audio-controller@100 {
+					compatible = "amlogic,g12a-toddr";
+					reg = <0x0 0x100 0x0 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "TODDR_A";
+					interrupts = <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
+					resets = <&arb AXG_ARB_TODDR_A>;
+					status = "disabled";
+				};
+
+				toddr_b: audio-controller@140 {
+					compatible = "amlogic,g12a-toddr";
+					reg = <0x0 0x140 0x0 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "TODDR_B";
+					interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
+					resets = <&arb AXG_ARB_TODDR_B>;
+					status = "disabled";
+				};
+
+				toddr_c: audio-controller@180 {
+					compatible = "amlogic,g12a-toddr";
+					reg = <0x0 0x180 0x0 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "TODDR_C";
+					interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
+					resets = <&arb AXG_ARB_TODDR_C>;
+					status = "disabled";
+				};
+
+				frddr_a: audio-controller@1c0 {
+					compatible = "amlogic,g12a-frddr";
+					reg = <0x0 0x1c0 0x0 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "FRDDR_A";
+					interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+					resets = <&arb AXG_ARB_FRDDR_A>;
+					status = "disabled";
+				};
+
+				frddr_b: audio-controller@200 {
+					compatible = "amlogic,g12a-frddr";
+					reg = <0x0 0x200 0x0 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "FRDDR_B";
+					interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
+					resets = <&arb AXG_ARB_FRDDR_B>;
+					status = "disabled";
+				};
+
+				frddr_c: audio-controller@240 {
+					compatible = "amlogic,g12a-frddr";
+					reg = <0x0 0x240 0x0 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "FRDDR_C";
+					interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
+					resets = <&arb AXG_ARB_FRDDR_C>;
+					status = "disabled";
+				};
+
 				arb: reset-controller@280 {
 					status = "disabled";
 					compatible = "amlogic,meson-axg-audio-arb";
-- 
2.20.1
