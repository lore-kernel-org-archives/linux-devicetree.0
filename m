Return-Path: <SRS0=pQYc=SK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:44928 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfDHWKc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Apr 2019 18:10:32 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/2] ARM: dts: Add common mcpdm dts file for omap4
Date: Mon,  8 Apr 2019 15:10:20 -0700
Message-Id: <20190408221021.2620-2-tony@atomide.com>
In-Reply-To: <20190408221021.2620-1-tony@atomide.com>
References: <20190408221021.2620-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-ID: <devicetree@vger.kernel.org>

The mcpdm module found on omap4 and 5 needs pdmclk clock from
the pmic that may or may not be wired. Without this clock we
cannot read the registers for mcpdm at all. For the external
mcpdm clock to work, it needs to be muxed at the module level
for ti-sysc driver probe to mux it early enough for probe.

Let's set up a common file for it to make things a bit easier
to make l4 abe interconnect to probe with ti-sysc driver. Note
that this is not needed for omap5 as we can just update mcpdm
muxing in omap5-board-common.dtsi in later patches.

Cc: devicetree@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-duovero.dtsi      | 21 +------------
 arch/arm/boot/dts/omap4-mcpdm.dtsi        | 38 +++++++++++++++++++++++
 arch/arm/boot/dts/omap4-panda-common.dtsi | 21 +------------
 arch/arm/boot/dts/omap4-sdp.dts           | 21 +------------
 arch/arm/boot/dts/omap4-var-som-om44.dtsi | 21 +------------
 5 files changed, 42 insertions(+), 80 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4-mcpdm.dtsi

diff --git a/arch/arm/boot/dts/omap4-duovero.dtsi b/arch/arm/boot/dts/omap4-duovero.dtsi
--- a/arch/arm/boot/dts/omap4-duovero.dtsi
+++ b/arch/arm/boot/dts/omap4-duovero.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include "omap443x.dtsi"
+#include "omap4-mcpdm.dtsi"
 
 / {
 	model = "Gumstix Duovero";
@@ -82,16 +83,6 @@
 		>;
 	};
 
-	mcpdm_pins: pinmux_mcpdm_pins {
-		pinctrl-single,pins = <
-			OMAP4_IOPAD(0x106, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_ul_data.abe_pdm_ul_data */
-			OMAP4_IOPAD(0x108, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_dl_data.abe_pdm_dl_data */
-			OMAP4_IOPAD(0x10a, PIN_INPUT_PULLUP   | MUX_MODE0)	/* abe_pdm_frame.abe_pdm_frame */
-			OMAP4_IOPAD(0x10c, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_lb_clk.abe_pdm_lb_clk */
-			OMAP4_IOPAD(0x10e, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_clks.abe_clks */
-		>;
-	};
-
 	mcbsp1_pins: pinmux_mcbsp1_pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0fe, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_clkx.abe_mcbsp1_clkx */
@@ -210,16 +201,6 @@
 	status = "okay";
 };
 
-&mcpdm {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcpdm_pins>;
-
-	clocks = <&twl6040>;
-	clock-names = "pdmclk";
-
-	status = "okay";
-};
-
 &mmc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
diff --git a/arch/arm/boot/dts/omap4-mcpdm.dtsi b/arch/arm/boot/dts/omap4-mcpdm.dtsi
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/omap4-mcpdm.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common omap4 mcpdm configuration
+ *
+ * Only include this file if your board has pdmclk wired from the
+ * pmic to ABE as mcpdm uses an external clock for the module.
+ */
+
+&omap4_pmx_core {
+	mcpdm_pins: pinmux_mcpdm_pins {
+		pinctrl-single,pins = <
+		/* 0x4a100106 abe_pdm_ul_data.abe_pdm_ul_data ag25 */
+		OMAP4_IOPAD(0x106, PIN_INPUT_PULLDOWN | MUX_MODE0)
+
+		/* 0x4a100108 abe_pdm_dl_data.abe_pdm_dl_data af25 */
+		OMAP4_IOPAD(0x108, PIN_INPUT_PULLDOWN | MUX_MODE0)
+
+		/* 0x4a10010a abe_pdm_frame.abe_pdm_frame ae25 */
+		OMAP4_IOPAD(0x10a, PIN_INPUT_PULLUP   | MUX_MODE0)
+
+		/* 0x4a10010c abe_pdm_lb_clk.abe_pdm_lb_clk af26 */
+		OMAP4_IOPAD(0x10c, PIN_INPUT_PULLDOWN | MUX_MODE0)
+
+		/* 0x4a10010e abe_clks.abe_clks ah26 */
+		OMAP4_IOPAD(0x10e, PIN_INPUT_PULLDOWN | MUX_MODE0)
+		>;
+	};
+};
+
+&mcpdm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcpdm_pins>;
+
+	clocks = <&twl6040>;
+	clock-names = "pdmclk";
+
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -7,6 +7,7 @@
  */
 #include <dt-bindings/input/input.h>
 #include "elpida_ecb240abacn.dtsi"
+#include "omap4-mcpdm.dtsi"
 
 / {
 	memory@80000000 {
@@ -226,16 +227,6 @@
 		>;
 	};
 
-	mcpdm_pins: pinmux_mcpdm_pins {
-		pinctrl-single,pins = <
-			OMAP4_IOPAD(0x106, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_ul_data.abe_pdm_ul_data */
-			OMAP4_IOPAD(0x108, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_dl_data.abe_pdm_dl_data */
-			OMAP4_IOPAD(0x10a, PIN_INPUT_PULLUP   | MUX_MODE0)	/* abe_pdm_frame.abe_pdm_frame */
-			OMAP4_IOPAD(0x10c, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_lb_clk.abe_pdm_lb_clk */
-			OMAP4_IOPAD(0x10e, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_clks.abe_clks */
-		>;
-	};
-
 	mcbsp1_pins: pinmux_mcbsp1_pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0fe, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_clkx.abe_mcbsp1_clkx */
@@ -509,16 +500,6 @@
 	status = "okay";
 };
 
-&mcpdm {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcpdm_pins>;
-
-	clocks = <&twl6040>;
-	clock-names = "pdmclk";
-
-	status = "okay";
-};
-
 &twl_usb_comparator {
 	usb-supply = <&vusb>;
 };
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -9,6 +9,7 @@
 
 #include "omap443x.dtsi"
 #include "elpida_ecb240abacn.dtsi"
+#include "omap4-mcpdm.dtsi"
 
 / {
 	model = "TI OMAP4 SDP board";
@@ -246,16 +247,6 @@
 		>;
 	};
 
-	mcpdm_pins: pinmux_mcpdm_pins {
-		pinctrl-single,pins = <
-			OMAP4_IOPAD(0x106, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_ul_data.abe_pdm_ul_data */
-			OMAP4_IOPAD(0x108, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_dl_data.abe_pdm_dl_data */
-			OMAP4_IOPAD(0x10a, PIN_INPUT_PULLUP | MUX_MODE0)	/* abe_pdm_frame.abe_pdm_frame */
-			OMAP4_IOPAD(0x10c, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_lb_clk.abe_pdm_lb_clk */
-			OMAP4_IOPAD(0x10e, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_clks.abe_clks */
-		>;
-	};
-
 	dmic_pins: pinmux_dmic_pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x110, PIN_OUTPUT | MUX_MODE0)		/* abe_dmic_clk1.abe_dmic_clk1 */
@@ -649,16 +640,6 @@
 	status = "okay";
 };
 
-&mcpdm {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcpdm_pins>;
-
-	clocks = <&twl6040>;
-	clock-names = "pdmclk";
-
-	status = "okay";
-};
-
 &twl_usb_comparator {
 	usb-supply = <&vusb>;
 };
diff --git a/arch/arm/boot/dts/omap4-var-som-om44.dtsi b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
--- a/arch/arm/boot/dts/omap4-var-som-om44.dtsi
+++ b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
@@ -7,6 +7,7 @@
  * published by the Free Software Foundation.
  */
 #include "omap4460.dtsi"
+#include "omap4-mcpdm.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-OM44";
@@ -74,16 +75,6 @@
 		>;
 	};
 
-	mcpdm_pins: pinmux_mcpdm_pins {
-		pinctrl-single,pins = <
-			OMAP4_IOPAD(0x106, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_ul_data.abe_pdm_ul_data */
-			OMAP4_IOPAD(0x108, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_dl_data.abe_pdm_dl_data */
-			OMAP4_IOPAD(0x10a, PIN_INPUT_PULLUP | MUX_MODE0)	/* abe_pdm_frame.abe_pdm_frame */
-			OMAP4_IOPAD(0x10c, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_pdm_lb_clk.abe_pdm_lb_clk */
-			OMAP4_IOPAD(0x10e, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_clks.abe_clks */
-		>;
-	};
-
 	tsc2004_pins: pinmux_tsc2004_pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x090, PIN_INPUT | MUX_MODE3)		/* gpmc_ncs4.gpio_101 (irq) */
@@ -251,16 +242,6 @@
 	status = "disabled";
 };
 
-&mcpdm {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcpdm_pins>;
-
-	clocks = <&twl6040>;
-	clock-names = "pdmclk";
-
-	status = "okay";
-};
-
 &gpmc {
 	status = "disabled";
 };
-- 
2.21.0
