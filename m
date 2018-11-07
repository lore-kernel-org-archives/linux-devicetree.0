Return-Path: <SRS0=GM37=NS=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 4/6] ARM: dts: am437x-gp-evm: Add uart0 pinctrl default and sleep states
Date: Wed, 7 Nov 2018 10:34:18 +0530
Message-ID: <1541567060-5671-5-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
References: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, d-gerlach@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

From: Dave Gerlach <d-gerlach@ti.com> 

Currently uart0 uses pinctrl config set by bootloader so
create default state that can be restored after a suspend
event.

Also, modify uart0 pinctrl to include RTS and CTS pins as by
default these are not in a mode for optimal power savings.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com> 
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 9c5e969..e52b013 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -517,15 +517,6 @@
 		>;
 	};
 
-	uart0_pins_default: uart0_pins_default {
-		pinctrl-single,pins = <
-			AM4372_IOPAD(0x968, PIN_INPUT | MUX_MODE0)		/* uart0_ctsn.uart0_ctsn */
-			AM4372_IOPAD(0x96C, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* uart0_rtsn.uart0_rtsn */
-			AM4372_IOPAD(0x970, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart0_rxd.uart0_rxd */
-			AM4372_IOPAD(0x974, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* uart0_txd.uart0_txd */
-		>;
-	};
-
 	beeper_pins: beeper_pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9e0, PIN_OUTPUT_PULLUP | MUX_MODE7)	/* cam1_field.gpio4_12 */
@@ -592,12 +583,31 @@
 			AM4372_IOPAD(0xaa8, PIN_INPUT_PULLDOWN)
 		>;
 	};
+
+	uart0_pins_default: uart0_pins_default {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x968, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0) /* uart0_ctsn.uart0_ctsn */
+			AM4372_IOPAD(0x96C, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0) /* uart0_rtsn.uart0_rtsn */
+			AM4372_IOPAD(0x970, PIN_INPUT_PULLUP | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | MUX_MODE0) /* uart0_rxd.uart0_rxd */
+			AM4372_IOPAD(0x974, PIN_INPUT | PULL_DISABLE | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | MUX_MODE0) /* uart0_txd.uart0_txd */
+		>;
+	};
+
+	uart0_pins_sleep: uart0_pins_sleep {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x968, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7) /* uart0_ctsn.uart0_ctsn */
+			AM4372_IOPAD(0x96C, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7) /* uart0_rtsn.uart0_rtsn */
+			AM4372_IOPAD(0x970, PIN_INPUT_PULLUP | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | MUX_MODE0) /* uart0_rxd.uart0_rxd */
+			AM4372_IOPAD(0x974, PIN_INPUT_PULLDOWN | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | MUX_MODE0) /* uart0_txd.uart0_txd */
+		>;
+	};
 };
 
 &uart0 {
 	status = "okay";
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&uart0_pins_default>;
+	pinctrl-1 = <&uart0_pins_sleep>;
 };
 
 &i2c0 {
-- 
1.9.1
