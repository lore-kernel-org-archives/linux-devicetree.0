From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/5] arm64: dts: meson: g12: fix audio fifo reg size
Date: Thu,  5 Sep 2019 14:59:53 +0200
Message-ID: <20190905125956.4384-3-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The register region size initially is too small to access all
the fifo registers.

Fixes: c59b7fe5aafd ("arm64: dts: meson: g12a: add audio fifos")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..0ee8a369c547 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1509,7 +1509,7 @@
 				toddr_a: audio-controller@100 {
 					compatible = "amlogic,g12a-toddr",
 						     "amlogic,axg-toddr";
-					reg = <0x0 0x100 0x0 0x1c>;
+					reg = <0x0 0x100 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "TODDR_A";
 					interrupts = <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
@@ -1521,7 +1521,7 @@
 				toddr_b: audio-controller@140 {
 					compatible = "amlogic,g12a-toddr",
 						     "amlogic,axg-toddr";
-					reg = <0x0 0x140 0x0 0x1c>;
+					reg = <0x0 0x140 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "TODDR_B";
 					interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>;
@@ -1533,7 +1533,7 @@
 				toddr_c: audio-controller@180 {
 					compatible = "amlogic,g12a-toddr",
 						     "amlogic,axg-toddr";
-					reg = <0x0 0x180 0x0 0x1c>;
+					reg = <0x0 0x180 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "TODDR_C";
 					interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
@@ -1545,7 +1545,7 @@
 				frddr_a: audio-controller@1c0 {
 					compatible = "amlogic,g12a-frddr",
 						     "amlogic,axg-frddr";
-					reg = <0x0 0x1c0 0x0 0x1c>;
+					reg = <0x0 0x1c0 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "FRDDR_A";
 					interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
@@ -1557,7 +1557,7 @@
 				frddr_b: audio-controller@200 {
 					compatible = "amlogic,g12a-frddr",
 						     "amlogic,axg-frddr";
-					reg = <0x0 0x200 0x0 0x1c>;
+					reg = <0x0 0x200 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "FRDDR_B";
 					interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
@@ -1569,7 +1569,7 @@
 				frddr_c: audio-controller@240 {
 					compatible = "amlogic,g12a-frddr",
 						     "amlogic,axg-frddr";
-					reg = <0x0 0x240 0x0 0x1c>;
+					reg = <0x0 0x240 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "FRDDR_C";
 					interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>;
-- 
2.21.0
