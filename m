Return-Path: <SRS0=akoX=SD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 08/12] ARM: dts: iwg23s-sbc: Enable USB Phy[01]
Date: Mon,  1 Apr 2019 13:53:48 +0100
Message-Id: <1554123232-58942-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Enable USB phy[01] on iWave iwg23s sbc based on RZ/G1C SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
V1-->V2
 * No change
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 9f9eb15..96bb2fb 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -214,6 +214,16 @@
 		function = "sdhi2";
 		power-source = <1800>;
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		groups = "usb1";
+		function = "usb1";
+	};
 };
 
 &qspi0 {
@@ -274,3 +284,17 @@
 	sd-uhs-sdr50;
 	status = "okay";
 };
+
+&usbphy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usbphy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4
