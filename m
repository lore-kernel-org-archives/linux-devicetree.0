Return-Path: <SRS0=pYfm=VC=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: hihope-common: Add BT support
Date: Fri,  5 Jul 2019 11:15:19 +0100
Message-Id: <1562321720-18735-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables BT support for the HiHope RZ/G2[MN] boards.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 1480242..fdeb4d2 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		serial0 = &scif2;
+		serial1 = &hscif0;
 	};
 
 	chosen {
@@ -31,6 +32,13 @@
 	leds {
 		compatible = "gpio-leds";
 
+		bt_active_led {
+			label = "blue:bt";
+			gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "hci0-power";
+			default-state = "off";
+		};
+
 		led0 {
 			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
 		};
@@ -153,6 +161,19 @@
 	};
 };
 
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -194,6 +215,11 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
-- 
2.7.4
