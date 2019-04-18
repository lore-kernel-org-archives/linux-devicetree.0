From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 5/6] arm64: dts: meson: vim2: add missing clk-gate pinctrl
Date: Thu, 18 Apr 2019 14:27:13 +0200
Message-ID: <20190418122714.30805-6-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

For some reason the vim2 is missing the clk-gate pinctrl setting all
the other board have. Just add this missing bit

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 27beb813015b..766194ab0aa8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -324,7 +324,8 @@
 &sd_emmc_a {
 	status = "okay";
 	pinctrl-0 = <&sdio_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -349,7 +350,8 @@
 &sd_emmc_b {
 	status = "okay";
 	pinctrl-0 = <&sdcard_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <4>;
 	cap-sd-highspeed;
@@ -366,7 +368,8 @@
 &sd_emmc_c {
 	status = "okay";
 	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
 	cap-sd-highspeed;
-- 
2.20.1
