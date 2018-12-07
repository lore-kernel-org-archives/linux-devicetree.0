From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am654-base-board: Add MMC/SD support
Date: Fri, 7 Dec 2018 14:12:33 +0530
Message-ID: <20181207084233.13700-3-faiz_abbas@ti.com>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207084233.13700-1-faiz_abbas@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com, kishon@ti.com, ulf.hansson@linaro.org, adrian.hunter@intel.com, michal.simek@xilinx.com, faiz_abbas@ti.com
List-Id: devicetree@vger.kernel.org

On the am654x-evm, sdhci0 node is connected to an eMMC while sdhci1
is connected to an SD card slot. Add nodes and pinmuxes for the same.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index bd5a0069191d..5dcd16b787eb 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -60,6 +60,36 @@
 			AM65X_IOPAD(0x0070, PIN_INPUT, 5) /* (R25) GPMC0_CSn2.I2C2_SDA */
 		>;
 	};
+
+	main_mmc0_pins_default: main_mmc0_pins_default {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x01a8, PIN_INPUT_PULLDOWN, 0) /* (B25) MMC0_CLK */
+			AM65X_IOPAD(0x01ac, PIN_INPUT_PULLUP, 0) /* (B27) MMC0_CMD */
+			AM65X_IOPAD(0x01a4, PIN_INPUT_PULLUP, 0) /* (A26) MMC0_DAT0 */
+			AM65X_IOPAD(0x01a0, PIN_INPUT_PULLUP, 0) /* (E25) MMC0_DAT1 */
+			AM65X_IOPAD(0x019c, PIN_INPUT_PULLUP, 0) /* (C26) MMC0_DAT2 */
+			AM65X_IOPAD(0x0198, PIN_INPUT_PULLUP, 0) /* (A25) MMC0_DAT3 */
+			AM65X_IOPAD(0x0194, PIN_INPUT_PULLUP, 0) /* (E24) MMC0_DAT4 */
+			AM65X_IOPAD(0x0190, PIN_INPUT_PULLUP, 0) /* (A24) MMC0_DAT5 */
+			AM65X_IOPAD(0x018c, PIN_INPUT_PULLUP, 0) /* (B26) MMC0_DAT6 */
+			AM65X_IOPAD(0x0188, PIN_INPUT_PULLUP, 0) /* (D25) MMC0_DAT7 */
+			AM65X_IOPAD(0x01b4, PIN_INPUT_PULLUP, 0) /* (A23) MMC0_SDCD */
+			AM65X_IOPAD(0x01b0, PIN_INPUT, 0) /* (C25) MMC0_DS */
+		>;
+	};
+
+	main_mmc1_pins_default: main_mmc1_pins_default {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x02d4, PIN_INPUT_PULLDOWN, 0) /* (C27) MMC1_CLK */
+			AM65X_IOPAD(0x02d8, PIN_INPUT_PULLUP, 0) /* (C28) MMC1_CMD */
+			AM65X_IOPAD(0x02d0, PIN_INPUT_PULLUP, 0) /* (D28) MMC1_DAT0 */
+			AM65X_IOPAD(0x02cc, PIN_INPUT_PULLUP, 0) /* (E27) MMC1_DAT1 */
+			AM65X_IOPAD(0x02c8, PIN_INPUT_PULLUP, 0) /* (D26) MMC1_DAT2 */
+			AM65X_IOPAD(0x02c4, PIN_INPUT_PULLUP, 0) /* (D27) MMC1_DAT3 */
+			AM65X_IOPAD(0x02dc, PIN_INPUT_PULLUP, 0) /* (B24) MMC1_SDCD */
+			AM65X_IOPAD(0x02e0, PIN_INPUT, 0) /* (C24) MMC1_SDWP */
+		>;
+	};
 };
 
 &main_pmx1 {
@@ -125,3 +155,19 @@
 	pinctrl-0 = <&main_i2c2_pins_default>;
 	clock-frequency = <400000>;
 };
+
+&sdhci0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc0_pins_default>;
+	bus-width = <8>;
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+};
+
+&sdhci1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	ti,driver-strength-ohm = <50>;
+};
-- 
2.19.2
