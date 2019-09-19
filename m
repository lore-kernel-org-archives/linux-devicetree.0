From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: j721e-common-proc-board: Add Support for eMMC and SD card
Date: Thu, 19 Sep 2019 21:02:42 +0530
Message-ID: <20190919153242.29399-3-faiz_abbas@ti.com>
References: <20190919153242.29399-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919153242.29399-1-faiz_abbas@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

sdhci0 is connected to an eMMC and sdhci1 is connected to an SD card
slot. Add support for these nodes.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 .../dts/ti/k3-j721e-common-proc-board.dts     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index d2894d55fbbe..3cfaa2c83ba6 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -41,6 +41,20 @@
 			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
 		>;
 	};
+
+	main_mmc1_pins_default: main_mmc1_pins_default {
+		pinctrl-single,pins = <
+			J721E_IOPAD(0x254, PIN_INPUT, 0) /* (R29) MMC1_CMD */
+			J721E_IOPAD(0x250, PIN_INPUT, 0) /* (P25) MMC1_CLK */
+			J721E_IOPAD(0x2ac, PIN_INPUT, 0) /* (P25) MMC1_CLKLB */
+			J721E_IOPAD(0x24c, PIN_INPUT, 0) /* (R24) MMC1_DAT0 */
+			J721E_IOPAD(0x248, PIN_INPUT, 0) /* (P24) MMC1_DAT1 */
+			J721E_IOPAD(0x244, PIN_INPUT, 0) /* (R25) MMC1_DAT2 */
+			J721E_IOPAD(0x240, PIN_INPUT, 0) /* (R26) MMC1_DAT3 */
+			J721E_IOPAD(0x258, PIN_INPUT, 0) /* (P23) MMC1_SDCD */
+			J721E_IOPAD(0x25c, PIN_INPUT, 0) /* (R28) MMC1_SDWP */
+		>;
+	};
 };
 
 &wkup_pmx0 {
@@ -117,3 +131,23 @@
 &wkup_gpio1 {
 	status = "disabled";
 };
+
+&main_sdhci0 {
+	/* eMMC */
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	disable-wp;
+};
+
+&main_sdhci1 {
+	/* SD/MMC */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	ti,driver-strength-ohm = <50>;
+	disable-wp;
+};
+
+&main_sdhci2 {
+	/* Unused */
+	status = "disabled";
+};
-- 
2.19.2
