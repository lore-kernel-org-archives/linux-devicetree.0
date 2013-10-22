From: Sebastian Reichel <sre@debian.org>
Subject: [PATCH 03/14] DTS: ARM: OMAP3-N900: Add UART support
Date: Wed, 23 Oct 2013 00:49:32 +0200
Message-ID: <1382482183-14426-4-git-send-email-sre@debian.org>
References: <1382482183-14426-1-git-send-email-sre@debian.org>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1382482183-14426-1-git-send-email-sre@debian.org>
Sender: linux-omap-owner@vger.kernel.org
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sre@debian.org>
List-Id: devicetree@vger.kernel.org

Add UART support to Nokia N900.

Signed-off-by: Sebastian Reichel <sre@debian.org>
---
 arch/arm/boot/dts/omap3-n900.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 7dd6fb6..9226268 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -31,6 +31,20 @@
 &omap3_pmx_core {
 	pinctrl-names = "default";
 
+	uart2_pins: pinmux_uart2_pins {
+		pinctrl-single,pins = <
+			0x14a (PIN_INPUT | MUX_MODE0)		/* uart2_rx */
+			0x148 (PIN_OUTPUT | MUX_MODE0)		/* uart2_tx */
+		>;
+	};
+
+	uart3_pins: pinmux_uart3_pins {
+		pinctrl-single,pins = <
+			0x16e (PIN_INPUT | MUX_MODE0)		/* uart3_rx */
+			0x170 (PIN_OUTPUT | MUX_MODE0)		/* uart3_tx */
+		>;
+	};
+
 	i2c1_pins: pinmux_i2c1_pins {
 		pinctrl-single,pins = <
 			0x18a (PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
@@ -127,3 +141,17 @@
 	mode = <2>;
 	power = <50>;
 };
+
+&uart1 {
+	status = "disabled";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+};
-- 
1.8.4.rc3

