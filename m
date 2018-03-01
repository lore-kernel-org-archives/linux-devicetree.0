Return-Path: <SRS0=Pbk3=FX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:59012 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965752AbeCAEB1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Feb 2018 23:01:27 -0500
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 3/3] ARM: dts: omap4-droid4: Configure uart1 pins
Date: Wed, 28 Feb 2018 20:01:07 -0800
Message-Id: <20180301040107.39444-3-tony@atomide.com>
In-Reply-To: <20180301040107.39444-1-tony@atomide.com>
References: <20180301040107.39444-1-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

These are needed to use the n_gsm driver for TS 27.010 UART
multiplexing. Note that support for the OOB wake gpio is still
missing so the UART is not yet usable for n_gsm.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -557,6 +557,28 @@
 		>;
 	};
 
+	/*
+	 * Note that the v3.0.8 stock userspace dynamically remuxes uart1
+	 * rts pin probably for PM purposes to PIN_INPUT_PULLUP | MUX_MODE7
+	 * when not used. If needed, we can add rts pin remux later based
+	 * on power measurements.
+	 */
+	uart1_pins: pinmux_uart1_pins {
+		pinctrl-single,pins = <
+		/* 0x4a10013c mcspi1_cs2.uart1_cts ag23 */
+		OMAP4_IOPAD(0x13c, PIN_INPUT_PULLUP | MUX_MODE1)
+
+		/* 0x4a10013e mcspi1_cs3.uart1_rts ah23 */
+		OMAP4_IOPAD(0x13e, MUX_MODE1)
+
+		/* 0x4a100140 uart3_cts_rctx.uart1_tx f27 */
+		OMAP4_IOPAD(0x140, PIN_OUTPUT | MUX_MODE1)
+
+		/* 0x4a1001ca dpm_emu14.uart1_rx aa3 */
+		OMAP4_IOPAD(0x1ca, PIN_INPUT_PULLUP | MUX_MODE2)
+		>;
+	};
+
 	/* uart3_tx_irtx and uart3_rx_irrx */
 	uart3_pins: pinmux_uart3_pins {
 		pinctrl-single,pins = <
@@ -626,6 +648,17 @@
 	};
 };
 
+/*
+ * As uart1 is wired to mdm6600 with rts and cts, we can use the cts pin for
+ * uart1 wakeirq.
+ */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	interrupts-extended = <&wakeupgen GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH
+			       &omap4_pmx_core 0xfc>;
+};
+
 &uart3 {
 	interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH
 			       &omap4_pmx_core 0x17c>;
-- 
2.16.2
