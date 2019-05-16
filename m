Return-Path: <SRS0=ZBEu=TQ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774c0-cat874: Add BT support
Date: Thu, 16 May 2019 09:59:26 +0100
Message-Id: <1557997166-63351-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
References: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables BT support for the CAT874 board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 72cccfc..fdca695 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -16,6 +16,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &hscif2;
 	};
 
 	chosen {
@@ -154,6 +155,19 @@
 	clock-frequency = <48000000>;
 };
 
+&hscif2 {
+	pinctrl-0 = <&hscif2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		enable-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <100000>;
@@ -237,6 +251,11 @@
 		function = "i2c1";
 	};
 
+	hscif2_pins: hscif2 {
+		groups = "hscif2_data_a", "hscif2_ctrl_a";
+		function = "hscif2";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
-- 
2.7.4
