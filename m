Return-Path: <SRS0=SXWh=IP=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] arm64: dts: renesas: salvator-common: Add HSCIF1 device support
Date: Mon, 28 May 2018 15:28:40 +0200
Message-Id: <1527514120-19693-1-git-send-email-geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds the pin control for HSCIF1, and supports connection with
the Debug Serial-1 (CN26) on Salvator boards.

SCIF1 and HSCI1 are sharing the pin connected to the Debug Serial-1
(CN26) on Salvator boards, and it is necessary to use it by exclusion.

As for the default of this DeviceTree, SCIF1 is connected.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Add missing "uart-has-rtscts"]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "arm64: dts: renesas: r8a77965: Add all HSCIF nodes",
due to the &hscif1 reference.

This doesn't really change anything, but serves as an example and
documentation.

Questions:
  1. Do we want to have such examples/documentation?

  2. Should we make HSCIF1 the default? IMHO, HSCIF is superior to SCIF.
     Both are served by the same driver, so increased kernel size is not
     a counter-argument.
     For comparison: r8a7790-lager.dts uses SCIFA1 instead of SCIF1 for
     the debug serial (not for the serial console, due to earlycon and
     U-Boot compatibility).

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 9256fbaaab7f3297..976fda67e202f054 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -341,6 +341,15 @@
 	clock-frequency = <32768>;
 };
 
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	/* Please use exclusively to the scif1 node */
+	/* status = "okay"; */
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -546,6 +555,11 @@
 		function = "du";
 	};
 
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data_a", "hscif1_ctrl_a";
+		function = "hscif1";
+	};
+
 	i2c2_pins: i2c2 {
 		groups = "i2c2_a";
 		function = "i2c2";
@@ -711,6 +725,7 @@
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
+	/* Please use exclusively to the hscif1 node */
 	status = "okay";
 };
 
-- 
2.7.4
