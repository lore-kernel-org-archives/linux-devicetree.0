Return-Path: <SRS0=Uw7E=JF=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: renesas: salvator-common: Add HSCIF1 device support
Date: Tue, 19 Jun 2018 19:14:01 +0200
Message-Id: <20180619171401.19489-1-geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds pin control for HSCIF1, and supports connection with
Debug Serial-1 (CN26) on Salvator boards.

SCIF1 and HSCIF1 are sharing the pins connected to Debug Serial-1 (CN26)
on Salvator boards, and it is necessary to ensure that either SCIF1 or
HSCIF1 is enabled, not both.

As for the default of this DeviceTree, SCIF1 is connected.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Add missing "uart-has-rtscts"]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop RFC state,
  - Reword.
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index d9de075c91df3a06..82623b8f7c2657d8 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -353,6 +353,15 @@
 	clock-frequency = <32768>;
 };
 
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	/* Please only enable hscif1 or scif1 */
+	/* status = "okay"; */
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -558,6 +567,11 @@
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
@@ -728,6 +742,7 @@
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
+	/* Please only enable hscif1 or scif1 */
 	status = "okay";
 };
 
-- 
2.17.1
