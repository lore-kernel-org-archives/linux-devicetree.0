Return-Path: <SRS0=8Fol=Q4=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a774c0-cat874: add RTC support
Date: Thu, 21 Feb 2019 09:40:48 +0000
Message-Id: <1550742048-28068-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
References: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds Epson RX-8571 real time clock support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 96ee0d2c..18ff79c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -56,6 +56,19 @@
 	clock-frequency = <48000000>;
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	rtc@32 {
+		compatible = "epson,rx8571";
+		reg = <0x32>;
+	};
+};
+
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
 };
@@ -66,6 +79,11 @@
 };
 
 &pfc {
+	i2c1_pins: i2c1 {
+		groups = "i2c1_b";
+		function = "i2c1";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
-- 
2.7.4
