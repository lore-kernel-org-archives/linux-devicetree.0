Return-Path: <SRS0=GM37=NS=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 5/6] ARM: dts: am437x-gp-evm: Add pinmux for gpio0 wake
Date: Wed, 7 Nov 2018 10:34:19 +0530
Message-ID: <1541567060-5671-6-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
References: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, d-gerlach@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

From: Dave Gerlach <d-gerlach@ti.com>

Add pinctrl settings so that gpio0 wake from suspend will be supported
using buttons SW4 and SW7. Also, add pinctrl configuration for 0x954,
spi0_d0, which is an unused pin brought out to a header on the board
that in it's default state also connects to the gpio used for wakeup,
gpio0_3, which affects the state of the pin and prevents a working
wakeup unless we set the mux to a different state.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index e52b013..0127d11 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -67,7 +67,13 @@
 		debounce-delay-ms = <5>;
 		col-scan-delay-us = <2>;
 
-		row-gpios = <&gpio3 21 GPIO_ACTIVE_HIGH /* Bank3, pin21 */
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&matrix_keypad_default>;
+		pinctrl-1 = <&matrix_keypad_sleep>;
+
+		linux,wakeup;
+
+		row-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH /* Bank0, pin3 */
 				&gpio4 3 GPIO_ACTIVE_HIGH /* Bank4, pin3 */
 				&gpio4 2 GPIO_ACTIVE_HIGH>; /* Bank4, pin2 */
 
@@ -601,6 +607,24 @@
 			AM4372_IOPAD(0x974, PIN_INPUT_PULLDOWN | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | MUX_MODE0) /* uart0_txd.uart0_txd */
 		>;
 	};
+
+	matrix_keypad_default: matrix_keypad_default {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x9a4, PIN_OUTPUT | MUX_MODE7)
+			AM4372_IOPAD(0x9a8, PIN_OUTPUT | MUX_MODE7)
+			AM4372_IOPAD(0x9ac, PIN_INPUT | PULL_DISABLE | MUX_MODE9)
+			AM4372_IOPAD(0x954, PIN_INPUT_PULLDOWN | MUX_MODE0)
+		>;
+	};
+
+	matrix_keypad_sleep: matrix_keypad_sleep {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x9a4, PULL_UP | MUX_MODE7)
+			AM4372_IOPAD(0x9a8, PULL_UP | MUX_MODE7)
+			AM4372_IOPAD(0x9ac, PIN_INPUT | PULL_DISABLE | MUX_MODE9)
+			AM4372_IOPAD(0x954, PIN_INPUT_PULLDOWN | MUX_MODE0)
+		>;
+	};
 };
 
 &uart0 {
-- 
1.9.1
